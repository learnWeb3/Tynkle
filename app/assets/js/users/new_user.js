document
  .querySelector(".form-check-input")
  .addEventListener("click", function (event) {
    if (event.target.id === "helper_role_1") {
      const user_confirmation = confirm(
        "Vous êtes sur le point de créer un profil en tant qu'Helper pour proposer vos services de dépannage"
      );
      if (user_confirmation) {
        document.querySelector("#helper_role_2").checked = false;
        event.target.checked = true;
      } else {
        event.target.checked = false;
        document.querySelector("#helper_role_2").checked = true;
      }
    }
  });

