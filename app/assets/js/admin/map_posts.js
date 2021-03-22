import { getFilteredContent, getPlatforms, ROOT_PATH } from "../API_CLIENT/index.js";
import { getBreakdownCategoriesCheckInputTemplate } from "../templates/templates.js";

mapboxgl.accessToken =
  MAPBOX_TOKEN;
var map = new mapboxgl.Map({
  container: "map",
  style: "mapbox://styles/antoine-tech/ckkv8yq1v3vof17nzaeb0gmi7",
  center: [48, 2],
  zoom: 2,
});

map.on("load", function () {
  // Add a new source from our GeoJSON data and
  // set the 'cluster' option to true. GL-JS will
  // add the point_count property to your source data.
  map.addSource("posts", {
    type: "geojson",
    // Point to GeoJSON data. This example visualizes all M1.0+ posts
    // from 12/22/15 to 1/21/16 as logged by USGS' Earthquake hazards program.
    data: posts,
    cluster: true,
    clusterMaxZoom: 14, // Max zoom to cluster points on
    clusterRadius: 50, // Radius of each cluster when clustering points (defaults to 50)
  });

  map.addLayer({
    id: "clusters",
    type: "circle",
    source: "posts",
    filter: ["has", "point_count"],
    paint: {
      // Use step expressions (https://docs.mapbox.com/mapbox-gl-js/style-spec/#expressions-step)
      // with three steps to implement three types of circles:
      //   * Blue, 20px circles when point count is less than 100
      //   * Yellow, 30px circles when point count is between 100 and 750
      //   * Pink, 40px circles when point count is greater than or equal to 750
      "circle-color": [
        "step",
        ["get", "point_count"],
        "#f3cf12",
        100,
        "#f1f075",
        750,
        "#f28cb1",
      ],
      "circle-radius": ["step", ["get", "point_count"], 20, 100, 30, 750, 40],
    },
  });

  map.addLayer({
    id: "cluster-count",
    type: "symbol",
    source: "posts",
    filter: ["has", "point_count"],
    layout: {
      "text-field": "{point_count_abbreviated}",
      "text-font": ["DIN Offc Pro Medium", "Arial Unicode MS Bold"],
      "text-size": 12,
    },
  });

  map.addLayer({
    id: "unclustered-point",
    type: "circle",
    source: "posts",
    filter: ["!", ["has", "point_count"]],
    paint: {
      "circle-color": "#515151",
      "circle-radius": 10,
      "circle-stroke-width": 1,
      "circle-stroke-color": "#515151",
    },
  });

  // inspect a cluster on click
  map.on("click", "clusters", function (e) {
    var features = map.queryRenderedFeatures(e.point, {
      layers: ["clusters"],
    });
    var clusterId = features[0].properties.cluster_id;
    map
      .getSource("posts")
      .getClusterExpansionZoom(clusterId, function (err, zoom) {
        if (err) return;

        map.easeTo({
          center: features[0].geometry.coordinates,
          zoom: zoom,
        });
      });
  });

  // When a click event occurs on a feature in
  // the unclustered-point layer, open a popup at
  // the location of the feature, with
  // description HTML from its properties.
  map.on("click", "unclustered-point", function (e) {
    var coordinates = e.features[0].geometry.coordinates.slice();
    var title = e.features[0].properties.title;
    var cover_image = e.features[0].properties.cover_image;
    var id = e.features[0].properties.id;
    var platform_name = e.features[0].properties.platform_name;
    var breakdown_category_name = e.features[0].properties.breakdown_category_name
    var city = e.features[0].properties.city
    var postal_code = e.features[0].properties.postal_code;
    var user_id = e.features[0].properties.user_id;
    var created_at =  e.features[0].properties.created_at;
    var username = e.features[0].properties.username
    // Ensure that if the map is zoomed out such that
    // multiple copies of the feature are visible, the
    // popup appears over the copy being pointed to.
    while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
      coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
    }

    new mapboxgl.Popup()
      .setLngLat(coordinates)
      .setHTML(
        `<div class='col'>
            <img src='${cover_image}' class='img-fluid'/>
            <div class="row">
                 <div class="col-12 d-flex flex-column justify-content-start">
                    <h5 class="font-weight-bold my-4">${title}</h5>
                    <p>${platform_name}-${breakdown_category_name}</p>
                </div>
                <div class="col-12 d-flex align-items-start">
                    <div class="d-flex align-items-center w-100">
                    <i class="lni lni-pointer lni-16"></i>
                        <p class="m-2">${city} ${postal_code}</p>
                    </div>
                </div>
            </div>
            <div class="row d-none d-lg-block">
                <div class="d-flex align-items-center w-100">
                    <i class="lni lni-user lni-16"></i>
                    <a class="font-italic m-2" href="${ROOT_PATH}/users/${user_id}">${username}</a>
                </div>
            </div>
            <div class="row">
                <div class="col-12 d-flex align-items-center">
                <i class="lni lni-calendar lni-16"></i>
                    <small class="m-2 mb-0">Posté le ${created_at}</small>
                </div>
            </div>   
            <div class="row my-4">
                <a href="${
                    ROOT_PATH + "/posts/" + id
                    }" class="align-self-end font-weight-bold text-start text-lg-end">Voir les détails <i
                    class="lni lni-arrow-right"></i>
                </a>
            </div>
        </div>`
      )
      .addTo(map);
  });

  map.on("mouseenter", "clusters", function () {
    map.getCanvas().style.cursor = "pointer";
  });
  map.on("mouseleave", "clusters", function () {
    map.getCanvas().style.cursor = "";
  });
});



const handleChangeSelect = async () => {
  document
    .querySelector("#id_platform")
    .addEventListener("change", async () => {
      const breakdown_categories = document.querySelector(
        "#breakdown_categories"
      );
      const id_platform = document.querySelector("#id_platform")
        .selectedOptions[0].value;
      Array.from(breakdown_categories.children).map((child) => child.remove());
      if (id_platform !== "0") {
        const {data:platforms, status} = await getPlatforms({
          id_platform,
        });
        if (status === 200) {
          platforms.map((platform) => {
            const div = document.createElement("div");
            div.classList.add("form-check");
            div.innerHTML = getBreakdownCategoriesCheckInputTemplate(platform);
            breakdown_categories.appendChild(div);
            handleChangeCheckbox();
          });
        }
      } else {
        const p = document.createElement("p");
        p.classList.add("my-2");
        p.innerHTML = "Veuillez selectionner une catégorie d'appareil";
        breakdown_categories.appendChild(p);
        fetchFilteredPosts();
      }
    });
};

const breakDownCategoriesToParams = () => {
  const inputs = Array.from(
    document.querySelectorAll("#breakdown_categories input")
  );
  const breakdown_ids = inputs.map((element) => {
    if (element.checked) {
      return element.dataset.breakdownid;
    } else {
      return null;
    }
  });
  const breakdown_categories = breakdown_ids.filter(
    (element) => element !== null
  );
  return breakdown_categories.length > 0
    ? `breakdown_categories=${breakdown_categories.join(",")}`
    : null;
};

const fetchFilteredPosts = async (el) => {
  const breakdown_categories = breakDownCategoriesToParams();
  const endpoint = breakdown_categories
    ? `/posts?ajax=true&${breakdown_categories}`
    : "/posts?ajax=true";
  const { data, status } = await getFilteredContent(endpoint);
  if (status === 200) {
  }
};

const handleChangeCheckbox = () => {
  const inputs = Array.from(
    document.querySelectorAll("#breakdown_categories input")
  );
  inputs.map((input) => {
    input.addEventListener("change", fetchFilteredPosts);
  });
};

// listening for change event on select
handleChangeSelect();