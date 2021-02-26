import { deleteWarnings } from "./API_CLIENT/index.js";

const handleDeleteClick = () => {
  $(".delete").on("click", async function (event) {
    event.preventDefault();
    const url = $(this).closest("tr").data("url");
    console.log(url);
    const { status, data } = await deleteWarnings(url);
    if (status === 204) {
      $(this).closest("tr").remove();
    }
    if ($("#warnings-users tbody tr").length === 0) {
      $("#warnings-users tbody").append(
        `<tr><td colspan="8">Pas d'alerte utilisateurs pour le moment</td></tr>`
      );
    }
    if ($("#warnings-posts tbody tr").length === 0) {
      $("#warnings-posts tbody").append(
        `<tr><td colspan="8">Pas d'alerte sur les annonces pour le moment</td></tr>`
      );
    }
  });
};

handleDeleteClick();
