const options = {
    max_value: 5,
    step_size: 0.5,
    initial_value: 0,
    cursor: 'default',
    readonly: true
};

const initMap = (lat, lng) => {
    map = new google.maps.Map(document.getElementById("map"), {
        center: { lat, lng },
        zoom: 8,
    });
    const marker = new google.maps.Marker({
        position:  {lat, lng },
        map: map
    });
}

$(".rating").rate(options);
const lat = parseInt(document.querySelector('#map').dataset.lat)
const lng = parseInt(document.querySelector('#map').dataset.lon)
initMap(lat, lng)
