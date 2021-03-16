const ROOT_PATH = "http://localhost/tynkle";

const headers = {
  "Content-Type": "application/json",
};

const getData = async (path) => {
  const options = {
    headers,
    method: "GET",
  };
  return fetch(ROOT_PATH + path, options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const postData = async (path, data) => {
  const options = {
    headers,
    method: "POST",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + path, options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const putData = async (path, data) => {
  const options = {
    headers,
    method: "PUT",
    body: JSON.stringify(data),
  };
  return fetch(ROOT_PATH + path, options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const destroyData = async (path) => {
  const options = {
    headers,
    method: "DELETE",
  };
  return fetch(ROOT_PATH + path, options)
    .then(async (res) => {
      const status = res.status;
      return status === 200
        ? { data: await res.json(), status: status }
        : { data: null, status: status };
    })
    .catch((error) => ({ data: null, status: 500 }));
};

const getCurrentUser = async () => await getData("/users/current");

const getNearbyUsers = async (lat, lon) =>
  await getData(`/users?lat=${lat}&lng=${lon}`);

const follow = async (userId, data) =>
  await postData("/users/" + userId + "/follows", data);

const reviewUser = async (data) => await postData("/reviews", data);

const unFollow = async (followId) => await destroyData("/follows/" + followId);

const saveRule = async (data) => await postData("/rules", data);

const saveArticle = async (data) => await postData("/articles", data);
const updateArticle = async (data, id) =>
  await putData("/articles/" + id, data);

const updateRule = async (data, id) => await putData("/rules/" + id, data);

const sendContactMessage = async (data) => await postData("/contact", data);

const getMessages = async (url) => await getData(url);

const deleteWarnings = async (url) => await destroyData(url);
const searchUserbyAdmin = async (data) =>
  await postData("/admin/users/search", data);

const createWarning = async (url, data) => await postData(url, data);

const updatePageDetails = async (url, data) => await putData(url, data);
const updateUserByAdmin = async (url, data) => await putData(url, data);

const getBreakdowns = async (data) => await postData("/breakdowns", data);

const getPlatforms = async (data) => await postData("/breakdowns", data);

const makeOffers = async (data) => await postData("/offers", data);

const signout = async () => await destroyData("/logout");

const getFollowingPosts = (nextPage) => {
  const options = {
    headers,
    method: "GET",
  };
  return fetch(ROOT_PATH + nextPage + "&ajax=true", options);
};

const getFollowingArticles = async (nextPage) =>
  await getData(nextPage + "&ajax=true");

const getFilteredContent = async (endpoint) => await getData(endpoint);

const deletemessage = async (message_id) =>
  await destroyData("/messages" + "/" + message_id);
const updateOffer = async (data, offer_id) =>
  await putData("/offers" + "/" + offer_id, data);

const sendmessage = async (data) => await postData("/chats", data);

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
  getBreakdowns,
  getNearbyUsers,
};
