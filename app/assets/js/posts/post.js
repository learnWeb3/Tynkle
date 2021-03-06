import { current_user, setCurrentUserId } from "../commons/current_user.js";
import { handleNewMessage, handleNewOffer, handleNewWarning } from "../commons/modal.js";

const initMap = (lat, lng) => {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat, lng },
    zoom: 8,
  });
  const marker = new google.maps.Marker({
    position: { lat, lng },
    map: map,
  });
};

// init js-rater library
const options = {
  max_value: 5,
  step_size: 0.5,
  initial_value: 0,
  cursor: "default",
  readonly: true,
};


$(".rating").rate(options);

$("#lightgallery").lightGallery({
  pager: true,
});

// parsing lat lon
const lat = parseFloat(document.querySelector("#map").dataset.lat);
const lng = parseFloat(document.querySelector("#map").dataset.lon);

console.log(lat, lng)
// displaying map centered on lat/lon
initMap(lat, lng);
// getting current user
setCurrentUserId(current_user);
// listening click on send buttons
handleNewWarning("posts");
handleNewMessage(current_user);
handleNewOffer(current_user);
