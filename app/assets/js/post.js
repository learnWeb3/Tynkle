import { current_user, setCurrentUserId } from "./current_user.js";
import { handleNewMessage, handleNewOffer } from "./modal.js";

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
// parsing lat lon
const lat = parseInt(document.querySelector("#map").dataset.lat);
const lng = parseInt(document.querySelector("#map").dataset.lon);
// displaying map centered on lat/lon
initMap(lat, lng);
// getting current user
setCurrentUserId(current_user);
// listening click on send buttons
handleNewMessage(current_user);
handleNewOffer(current_user);
