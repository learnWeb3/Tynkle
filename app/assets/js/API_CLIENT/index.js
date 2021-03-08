const ROOT_PATH = "http://localhost/tynkle";

const getCurrentUser = async () => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "GET",
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

const follow = (userId, data) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + "/users/" + userId + "/follows", options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const reviewUser = (data) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + "/reviews", options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const unFollow = (followId) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "DELETE",
  };
  return fetch(ROOT_PATH + "/follows/" + followId, options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const saveRule = (data) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + "/rules", options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const saveArticle = (data) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + "/articles", options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const updateArticle = (data, id) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "PUT",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + "/articles/" + id, options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const updateRule = (data, id) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "PUT",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + "/rules/" + id, options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const sendContactMessage = async (data) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + "/contact", options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const getMessages = async (url) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "GET",
  };
  return fetch(ROOT_PATH + url, options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const deleteWarnings = async (url) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "DELETE",
  };
  return fetch(ROOT_PATH + url, options)
    .then(async (res) => {
      const status = res.status;
      return { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const searchUserbyAdmin = async (data) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + "/admin/users/search", options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const createWarning = async (url, data) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "POST",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + url, options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const updatePageDetails = async (url, data) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "PUT",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + url, options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const updateUserByAdmin = async (url, data) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "PUT",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + url, options)
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

const getFollowingArticles = (nextPage) => {
  const options = {
    headers: {
      "Content-Type": "application/json",
    },
    method: "GET",
  };
  return fetch(ROOT_PATH + nextPage + "&ajax=true", options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
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
  updatePageDetails,
  updateUserByAdmin,
  searchUserbyAdmin,
  createWarning,
  deleteWarnings,
  getMessages,
  sendContactMessage,
  saveArticle,
  updateArticle,
  follow,
  unFollow,
  updateRule,
  saveRule,
  reviewUser,
  getFollowingArticles,
};
