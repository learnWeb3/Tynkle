const ROOT_PATH = "http://localhost/tynkle";

const getCurrentUser = async (data) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "GET",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + "/users/current", options)
  .then(async (res) => {
    const status = res.status;
    return status === 200
      ? { data: await res.json(), status: status }
      : { data: null, status: status };
  })
  .catch((error) => ({ data: null, status: 500 }));
};

const getPlatforms = async (data) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + "/breakdowns", options)
    .then((results) => results.json())
    .catch((error) => console.log(error));
};

const makeOffers = async (data) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + "/offers", options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.text(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const signout = async () => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "DELETE",
  };
  return fetch(ROOT_PATH + "/logout", options)
    .then((response) => {
      return { status: response.status };
    })
    .catch((error) => console.log(error));
};

const getFollowingPosts = (nextPage) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "GET",
  };
  return fetch(ROOT_PATH + nextPage + "&ajax=true", options);
};

const getFilteredContent = (endpoint) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "GET",
  };
  return fetch(ROOT_PATH + endpoint + "&ajax=true", options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const deletemessage = async (message_id) =>
  fetch(ROOT_PATH + "/messages" + "/" + message_id, {
    method: "DELETE",
    headers: {
      "Content-Type": "application/json",
    },
  })
    .then(async (res) => {
      const status = res.status;
      return { status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));

const updateOffer = async (data, offer_id) =>
  fetch(ROOT_PATH + "/offers" + "/" + offer_id, {
    method: "PUT",
    body: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json",
    },
  })
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));

const sendmessage = async (data) =>
  fetch(ROOT_PATH + "/chats", {
    method: "POST",
    body: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json",
    },
  })
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));

export {
  ROOT_PATH,
  getPlatforms,
  signout,
  getFollowingPosts,
  sendmessage,
  deletemessage,
  makeOffers,
  getFilteredContent,
  updateOffer,
  getCurrentUser,
};
