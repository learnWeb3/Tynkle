import { updateUserByAdmin, searchUserbyAdmin } from "./API_CLIENT/index.js";
import { getAdminUserRowTemplate } from "./templates.js";

const handleRadioChange = () =>
  $("form.user-update input").on("change", async function (event) {
    const inputValue = $(this).val();
    const inputName = $(this).attr("name");
    const user_id = $(this).data("userid");
    const url = "/admin/users/" + user_id;
    const data = { [inputName]: inputValue };
    const { status, data: updateData } = await updateUserByAdmin(url, data);
    const row = $(this).closest("tr");
    if (status === 200) {
      row.addClass("updated-success");
    } else {
      row.addClass("updated-danger");
    }
  });

const handleInputSearch = () =>
  $("form.user-search input").on("input", async function (event) {
    const email = $(this).val().length > 0 ? "%" + $(this).val() + "%" : "%%";
    const { status, data } = await searchUserbyAdmin({ email: email });
    if (status === 200) {
      $("table tbody").html("");
      data.map((e) => $("table tbody").append(getAdminUserRowTemplate(e)));
      handleRadioChange();
    } else {
    }
  });

handleInputSearch();
handleRadioChange();
