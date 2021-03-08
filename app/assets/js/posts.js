import {
  getFollowingPosts,
  getPlatforms,
  getFilteredContent,
  ROOT_PATH,
} from "./API_CLIENT/index.js";
import { current_user, setCurrentUserId } from "./current_user.js";
import { getLocation } from "./geolocation.js";
import {
  getPostTemplate,
  getBreakdownCategoriesCheckInputTemplate,
} from "./templates.js";

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
        const platforms = await getPlatforms({
          id_platform,
        });
        if (platforms) {
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
    ? `/posts?${breakdown_categories}`
    : "/posts?";
  const { data, status } = await getFilteredContent(endpoint);
  const postsContainer = document.querySelector("#posts-container");
  postsContainer.dataset.nextPage = data.next;
  postsContainer.innerHTML = "";
  data?.data?.map((postData) =>
    postsContainer.appendChild(getPostTemplate(postData, current_user))
  );
};

const handleChangeCheckbox = () => {
  const inputs = Array.from(
    document.querySelectorAll("#breakdown_categories input")
  );
  inputs.map((input) => {
    input.addEventListener("change", fetchFilteredPosts);
  });
};

const geoSearch = () => {
  document
    .querySelector("#geosearch")
    .addEventListener("click", async function (event) {
      event.preventDefault();
      const distance = document.querySelector("#search_radius").value;
      const { lat, lng } = await getLocation();
      const breakdown_categories = breakDownCategoriesToParams();
      const endpoint = breakdown_categories
        ? `/posts/geosearch?lat=${lat}&lng=${lng}&distance=${distance}&${breakdown_categories}`
        : `/posts/geosearch?lat=${lat}&lng=${lng}&distance=${distance}`;
      const { data, status } = await getFilteredContent(endpoint);
      const postsContainer = document.querySelector("#posts-container");
      postsContainer.dataset.nextPage = data.next;
      postsContainer.innerHTML = "";
      if (data.length > 0) {
        data.map((postData) =>
          postsContainer.appendChild(getPostTemplate(postData, current_user))
        );
      } else {
        postsContainer.innerHTML = `
        <div class='h-100 w-100 d-flex flex-column align-items-center justify-content-center'>
          <h2>Pas de publication pour le moment ...</h2>
          <a class="my-4 btn btn-primary btn-lg " href="${ROOT_PATH}/posts">NOUVELLE RECHERCHE</a>
        </div>
        `.trim();
      }
    });
};

const initObserver = () => {
  const postsContainer = document.querySelector("#posts-container");
  const nextPage = postsContainer.dataset.nextpage;

  const options = {
    threshold: 1,
  };
  const state = {
    viewedItemCount: 0,
    nextPage,
  };

  const appendFollowingPosts = (followingPosts) =>
    followingPosts.data.map((followingPost) => {
      document
        .querySelector("#posts-container")
        .appendChild(getPostTemplate(followingPost, current_user));
    });

  function callback(entries) {
    entries.map((element) => {
      if (element.intersectionRatio >= 1) {
        element.target.classList.add("active");
        state.viewedItemCount = state.viewedItemCount + 1;
        if (state.viewedItemCount === 10) {
          getFollowingPosts(nextPage)
            .then((response) => response.json())
            .then((data) => {
              appendFollowingPosts(data);
              postsContainer.dataset.nextpage = data.next;
              initObserver();
            })
            .catch((error) => console.log(error));
        }
      }
    });
  }
  var OBSERVER = new IntersectionObserver(callback, options);
  const init = (targetSelector) => {
    Array.from(document.querySelectorAll(targetSelector)).map((element) =>
      OBSERVER.observe(element)
    );
  };
  init(".card-publication");
};

// getting current user
setCurrentUserId(current_user);
// listening for change event on select
handleChangeSelect();
// initializing intersection observer
initObserver();
// listening for browser geolocation user ask
geoSearch();
