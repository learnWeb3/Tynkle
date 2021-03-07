import { follow, unFollow } from "./API_CLIENT/index.js";
import { setCurrentUserId, current_user } from "./current_user.js";
import { handleNewMessage, handleNewWarning } from "./modal.js";
import { getAlertTemplate, getFollowButton, getUnfollowButton } from "./templates.js";
import { handleDismissAlert } from './flash.js';

// init js-rater library
const options = {
  max_value: 5,
  step_size: 0.5,
  initial_value: 0,
  cursor: "default",
  readonly: true,
};

const handleFollow = (current_users) => $("#follow").on("click", async function (event) {
  event.preventDefault();
  const { status, data } = await follow(current_user.id, {
    id_followed: $(this).data("user"),
  });
  if (status === 200) {
      $(this).remove()
      $('#follow-actions').append(getUnfollowButton(data[0]['id'], $(this).data("user")));
      $('#followers_count').html( parseInt($('#followers_count').text()) + 1)
      handleUnfollow();
      $('body').append(getAlertTemplate(['Abboné avec succès'], 'success'));
  }else{
    $('body').append(getAlertTemplate(['Une erreur est survenue'], 'danger'));
  }
  handleDismissAlert()
});

const handleUnfollow = () => $("#unfollow").on("click", async function (event) {
  event.preventDefault();
  const { status, data } = await unFollow($(this).data("follow"));
  if (status === 204) {
    $(this).remove()
    $('#follow-actions').append(getFollowButton($(this).data("user")));
    $('#followers_count').html( parseInt($('#followers_count').text()) - 1);
    handleFollow();
    $('body').append(getAlertTemplate(['Abbonnement supprimé avec succès'], 'success'));
  }else{
    $('body').append(getAlertTemplate(['Une erreur est survenue'], 'danger'));
  }
  handleDismissAlert()
});

// RATER LIBRARY INT
$(".rating").rate(options);
// getting current user
setCurrentUserId(current_user);
// listening click on send buttons
handleNewWarning("users");
handleNewMessage(current_user);
handleFollow(current_user)
handleUnfollow()
