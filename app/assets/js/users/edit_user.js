import { getDataGouvAdresses } from "../commons/geolocation.js";

const handleClickItem = () =>
  $("#autocomplete-menu .item").on("click", function (event) {
    $("#adress").val($(this).text());
    console.log($(this));
    $('#city').val($(this).data('city'));
    $('#postal_code').val($(this).data('postcode'));
    $('#lat').val($(this).data('lat'));
    $('#lon').val($(this).data('lon'));
    $("#autocomplete-menu").addClass("d-none");
  });
const handleRemoveMenu = () =>
  $(window).on("click", function (event) {
    if (!Array.from(event.target.classList).includes("item")) {
      $("#autocomplete-menu").addClass("d-none");
    }
  });

const handleInput = () =>
  $("#adress").on("input", async (event) => {
    const { status, data } = await getDataGouvAdresses(event.target.value);
    if (status === 200) {
      $("#autocomplete-menu").html("").removeClass("d-none");
      data.features.map(({ properties, geometry: { coordinates } }) => {
        $("#autocomplete-menu").append(
          `<div class='item' data-postcode='${properties['postcode']}' data-city='${properties['city']}' data-lat='${coordinates[0]}' data-lon='${coordinates[1]}'>${properties.label}</div>`
        );
      });
      handleClickItem();
      handleRemoveMenu();
    }
  });

handleInput();
