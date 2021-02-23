import { setCurrentUserId, current_user } from "./current_user";
import { handleNewMessage } from "./post";

// init js-rater library
const options = {
    max_value: 5,
    step_size: 0.5,
    initial_value: 0,
    cursor: "default",
    readonly: true,
  };


// RATER LIBRARY INT
$(".rating").rate(options);
// getting current user
setCurrentUserId(current_user);
// listening click on send buttons
handleNewMessage(current_user);
