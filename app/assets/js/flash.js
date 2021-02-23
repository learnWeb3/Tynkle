const handleDismissAlert = () =>
  document
    .querySelector(".alert .close")
    ?.addEventListener("click", function (event) {
      this.parentElement.remove();
    });

handleDismissAlert();
