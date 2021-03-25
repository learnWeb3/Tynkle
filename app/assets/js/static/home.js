import { getBreakdowns } from "../API_CLIENT/index.js";

const handleChange = () =>
  $("select[name='platform']").on("click", async function () {
    const { status, data } = await getBreakdowns({
      id_platform: $(this).val(),
    });
    if (status === 200) {
      const template = data.map(
        ({ id, name }) => `<option value="${id}">${name}</option>`
      );
      $(this).closest('form').find("select[name='breakdown']").html(template);
    }
  });

const handleTabClick = () =>
  $('.nav-link[role="tab"]').click(function(event){
    event.preventDefault();
    $('.nav-link[role="tab"]').removeClass("active");
    $(this).addClass("active");
    const target = $($(event.currentTarget).data("target"));
    $(".tab-pane").removeClass("show active");
    !target.hasClass("show active") && target.addClass("show active");
  });

$(document).ready(() => {
  $(".rating").rate();
  handleTabClick();
  handleChange();
});
