import { getCurrentUser } from "../API_CLIENT/index.js";

const current_user = {
  id: null,
};

const setCurrentUserId = async (current_user) => {
  const { status, data } = await getCurrentUser();
  console.log(status)
  if (status === 200) {
    current_user["id"] = data.current_user;
  }
};

export {current_user, setCurrentUserId}