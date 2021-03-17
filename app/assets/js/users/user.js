import { follow, unFollow, reviewUser, ROOT_PATH } from "../API_CLIENT/index.js";
import { setCurrentUserId, current_user } from "../commons/current_user.js";
import { handleNewMessage, handleNewWarning } from "../commons/modal.js";
import {
  getAlertTemplate,
  getFollowButton,
  getUnfollowButton,
} from "../templates/templates.js";
import { handleDismissAlert } from "../commons/flash.js";

// init js-rater library
const options = {
  max_value: 5,
  step_size: 0.5,
  initial_value: 0,
  cursor: "default",
  readonly: true,
};

const handleFollow = (current_users) =>
  $("#follow").on("click", async function (event) {
    event.preventDefault();
    const { status, data } = await follow(current_user.id, {
      id_followed: $(this).data("user"),
    });
    if (status === 200) {
      $(this).remove();
      $("#follow-actions").append(
        getUnfollowButton(data[0]["id"], $(this).data("user"))
      );
      $("#followers_count").html(parseInt($("#followers_count").text()) + 1);
      handleUnfollow();
      $("body").append(getAlertTemplate(["Abboné avec succès"], "success"));
    } else {
      $("body").append(getAlertTemplate(["Une erreur est survenue"], "danger"));
    }
    handleDismissAlert();
  });

const handleUnfollow = () =>
  $("#unfollow").on("click", async function (event) {
    event.preventDefault();
    const { status, data } = await unFollow($(this).data("follow"));
    if (status === 204) {
      $(this).remove();
      $("#follow-actions").append(getFollowButton($(this).data("user")));
      $("#followers_count").html(parseInt($("#followers_count").text()) - 1);
      handleFollow();
      $("body").append(
        getAlertTemplate(["Abbonnement supprimé avec succès"], "success")
      );
    } else {
      $("body").append(getAlertTemplate(["Une erreur est survenue"], "danger"));
    }
    handleDismissAlert();
  });

const handleReviewUser = (review) => {

  review.id_reviewer = current_user.id;
  review.id_reviewed = $("#new-review-form").data("iduser");
  $(".rate").on("change", function (ev, data) {
    review.score = $(this).rate("getValue");
    $("#rate-level").html(getRateLevel(review.score));
  });

  $("#new-review-form textarea").on("change", function (event) {
    review.comment = $(this).val();
  });
  
  const sendButton = document.querySelector(
    "#warning .modal-footer .btn.btn-success"
  );
  const modalBody = document.querySelector("#new-review .modal-body");
  const form = document.querySelector("#new-review-form");
  $("#new-review-form-submit").on("click", async function (event) {
    event.preventDefault();
    const { status, data } = await reviewUser(review);
    if (status === 200) {
      form.remove();
      const img = new Image(64, 64);
      const p = document.createElement("p");
      const text = document.createTextNode("Signalement envoyé avec succès");
      p.classList.add("font-weight-bold", "my-2");
      p.appendChild(text);
      img.src = ROOT_PATH + "/app/assets/icons/success.svg";
      modalBody.classList.remove("d-block", "overflow-auto");
      modalBody.classList.add(
        "d-flex",
        "justify-content-center",
        "align-items-center",
        "flex-column"
      );
      modalBody.appendChild(img);
      modalBody.appendChild(p);
      sendButton.remove();
    } else {
      console.error(data);
    }
  });
};

const getRateLevel = (rate) => {
  const rateLevelToRate = {
    0: "Très insatisfaisant",
    0.5: "Très insatisfaisant",
    1: "Insatisfaisant",
    1.5: "Insatisfaisant",
    2: "Non recommandé",
    2.5: "Non recommandé",
    3: "Moyen",
    3.5: "Moyen",
    4: "Bon",
    4.5: "Bon",
    5: "Excellent",
  };
  return rateLevelToRate[rate];
};

const init = async () => {
  // RATER LIBRARY INT
  $(".rating").rate(options);
  $(".rate").rate({
    max_value: 5,
    step_size: 0.5,
    initial_value: 0,
  });
  // new review handling
  const review = {};
  // getting current user
  await setCurrentUserId(current_user);
  // listening click on send buttons
  handleNewWarning("users");
  handleNewMessage(current_user);
  handleFollow(current_user);
  handleUnfollow();
  handleReviewUser(review);
};

init();
