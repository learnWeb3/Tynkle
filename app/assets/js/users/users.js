import { getPlatforms, getFollowingUsers, getFilteredContent } from "../API_CLIENT/index.js";
import {
  getBreakdownCategoriesCheckInputTemplate,
  getUserCardTemplate,
} from "../templates/templates.js";

const initObserver = () => {
  const userContainer = document.querySelector("#users-container");
  const nextPage = userContainer.dataset.nextpage;

  const options = {
    threshold: 1,
  };
  const state = {
    viewedItemCount: 0,
    nextPage,
  };

  const appendFollowingUser = (followingusers) =>
    followingusers.data.map((followinguser) => {
      console.log(followinguser)
     $("#users-container")
        .append(getUserCardTemplate(followinguser));
    });
    $(".rating").rate();

  function callback(entries) {
    entries.map((element) => {
      if (element.intersectionRatio >= 1) {
        element.target.classList.add("active");
        state.viewedItemCount = state.viewedItemCount + 1;
        if (state.viewedItemCount === 10) {
          getFollowingUsers(nextPage)
            .then((response) => response.json())
            .then((data) => {
              appendFollowingUser(data);
              userContainer.dataset.nextpage = data.next;
              initObserver();
            })
            .catch((error) => console.error(error));
        }
      }
    });
  }
  var OBSERVER = new IntersectionObserver(callback, options);
  const init = (targetSelector) => {
    Array.from(document.querySelectorAll(targetSelector)).map((element) =>
      OBSERVER.observe(element)
    );
  };
  init(".card");
};

const handleChangeSelect = async () => {
  document
    .querySelector("#id_platform")
    .addEventListener("change", async () => {
      const breakdown_categories = document.querySelector(
        "#breakdown_categories"
      );
      const id_platform = document.querySelector("#id_platform")
        .selectedOptions[0].value;
      Array.from(breakdown_categories.children).map((child) => child.remove());
      if (id_platform !== "0") {
        const { data: platforms, status } = await getPlatforms({
          id_platform,
        });
        if (status === 200) {
          platforms.map((platform) => {
            const div = document.createElement("div");
            div.classList.add("form-check");
            div.innerHTML = getBreakdownCategoriesCheckInputTemplate(platform);
            breakdown_categories.appendChild(div);
            handleChangeCheckbox();
          });
        }
      } else {
        const p = document.createElement("p");
        p.classList.add("my-2");
        p.innerHTML = "Veuillez selectionner une catégorie d'appareil";
        breakdown_categories.appendChild(p);
      }
    });
};

const breakDownCategoriesToParams = () => {
  const inputs = Array.from(
    document.querySelectorAll("#breakdown_categories input")
  );
  const breakdown_ids = inputs.map((element) => {
    if (element.checked) {
      return element.dataset.breakdownid;
    } else {
      return null;
    }
  });
  const breakdown_categories = breakdown_ids.filter(
    (element) => element !== null
  );
  return breakdown_categories.length > 0
    ? `breakdown_categories=${breakdown_categories.join(",")}`
    : null;
};


const fetchFilteredUsers = async (el) => {
  const breakdown_categories = breakDownCategoriesToParams();
  const endpoint = breakdown_categories
    ? `/users?ajax=true&${breakdown_categories}`
    : "/users?ajax=true";
  const { data, status } = await getFilteredContent(endpoint);
  if (status === 200) {
    const userContainer = document.querySelector("#users-container");
    userContainer.dataset.nextPage = data.next;
    userContainer.innerHTML = "";
    userContainer.classList.remove("container-xl");
    userContainer.classList.add("card-columns");
    data?.data?.map((userData) =>
      $("#users-container").append(getUserCardTemplate(userData))
    );
    initObserver();
  }
};

const handleChangeCheckbox = () => {
  const inputs = Array.from(
    document.querySelectorAll("#breakdown_categories input")
  );
  inputs.map((input) => {
    input.addEventListener("change", fetchFilteredUsers);
  });
};

$(document).ready(function () {
  $(".rating").rate();
  // listening for change event on select
  handleChangeSelect();
  initObserver();
});
