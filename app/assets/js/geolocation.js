const getLocation = async () => {
    const position = await new Promise((resolve, reject) => navigator.geolocation.getCurrentPosition(function (position) { resolve(position) }))
    return ({
        lat: position.coords.latitude,
        lon: position.coords.longitude
    })
}

const initMap = () => {
    map = new google.maps.Map(document.getElementById("map"), {
        center: { lat, lng },
        zoom: 8,
    });
}



export { getLocation, initMap}