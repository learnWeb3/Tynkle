import { ROOT_PATH, updatePageDetails } from "../API_CLIENT/index.js";

$("form button").on("click", async function (event) {
  event.preventDefault();
  const form = $(this).parent("form")[0];
  const submitUrl = form.dataset.submiturl;
  if (submitUrl !== undefined && submitUrl !== null) {
    let data = {};
    if (Array.from(form.classList).includes("upload")) {
      data = new FormData(form);
      const { status, data: pageData } = await fetch(ROOT_PATH + submitUrl, {
        method: "POST",
        body: data,
      }).then(async (res) => {
        const status = res.status;
        return status === 200
          ? { data: await res.json(), status: status }
          : { data: null, status: status };
      })
      .catch((error) => ({ data: null, status: 500 }));

      if (status === 200) {
        const { image_url } = pageData;
        console.log($(form).closest(".image-preview-container"));
        $(form).closest('.row').find(".image-preview-container").html(
          `<img src="${image_url}" alt="image d'arrière plan de la page"
            class="h-100 w-100">`
        );
        $(form)
          .find(".update-alert h5")
          .addClass("text-success")
          .html("Mis à jour avec succès");
      } else {
        $(form)
          .find(".update-alert h5")
          .addClass("text-danger")
          .html("Erreur lors de la mise à jour");
      }
    } else {
      const formData = new FormData(form);
      for (const pair of formData.entries()) {
        data[pair[0]] = pair[1];
      }
      const { status, data: pageData } = await updatePageDetails(
        submitUrl,
        data
      );
      if (status === 200) {
        const { title, description } = pageData;
        $(form).find("input[name='description']").val(description);
        $(form).find("input[name='title']").val(title);
        $(form)
          .find(".update-alert h5")
          .addClass("text-success")
          .html("Mis à jour avec succès");
      } else {
        $(form)
          .find(".update-alert h5")
          .addClass("text-danger")
          .html("Erreur lors de la mise à jour");
      }
    }
  }
});
