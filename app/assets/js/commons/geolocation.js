const getLocation = async () => {
  const position = await new Promise((resolve, reject) =>
    navigator.geolocation.getCurrentPosition(function (position) {
      resolve(position);
    })
  );
  return {
    lat: position.coords.latitude,
    lng: position.coords.longitude,
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

const getDataGouvAdresses = async (userInput) => {
  const dataGouvBasePath = "https://api-adresse.data.gouv.fr/search/?q=";
  const params = userInput.split(" ").join("+") + 'autocomplete=1';
  return fetch(dataGouvBasePath + params)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

export { getLocation, initMap, geocode, getDataGouvAdresses };
