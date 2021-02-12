const getLocation = async () => {
  const position = await new Promise((resolve, reject) =>
    navigator.geolocation.getCurrentPosition(function (position) {
      resolve(position);
    })
  );
  return {
    lat: position.coords.latitude,
    lon: position.coords.longitude,
  };
};

const initMap = () => {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat, lng },
    zoom: 8,
  });
};

const geocode = async (locality, postal_code, API_KEY) => {
  const getGeolocation = async (locality, postal_code) =>
    fetch(
      `https://maps.googleapis.com/maps/api/geocode/json?components=locality:${locality}:|postal_code:${postal_code}&key=${API_KEY}`
    ).then((response) => response.json());
  const { results, status } = await getGeolocation(locality, postal_code);
  if (status === "OK") {
    return results[0].geometry.location;
  } else {
    console.error("Error geocoding adress");
  }
};

export { getLocation, initMap, geocode };
