import { getFollowingArticles, ROOT_PATH } from "./API_CLIENT/index.js";
import { getArticleTemplate } from "./templates.js";

const nextPage = $("#see-more").data("next");

const appendFollowingArticles = (followingArticles) =>
  followingArticles.map((followingArticle) => {
    console.log(followingArticle);
  $("#articles-container")
      .append(getArticleTemplate(followingArticle, ROOT_PATH));
  });

$("#see-more").on("click", async function (event) {
  event.preventDefault();
  const { status, data } = await getFollowingArticles(nextPage);
  if (data.next !== document.querySelector("#see-more").dataset['next']) {
    appendFollowingArticles(data.data);
    console.log(data.next);
    document.querySelector("#see-more").dataset['next'] = data.next;
  } else {
    $(this).remove();
    $("#articles-container").append("<p class='font-weight-bold text-center my-4 text-brand-blue'>Plus d'article pour le moment ...</p>")
  }
});
