import {
  getFilteredContent,
  updateOffer,
  ROOT_PATH,
} from "../API_CLIENT/index.js";
import { current_user, setCurrentUserId } from "../commons/current_user.js";
import {
  getNoResultTemplate,
  getOfferTemplate,
  getPostTemplate,
} from "../templates/templates.js";

const handleOfferCardAction = async (event) => {
  const currentElement = event.target;
  const currentElementClassNames = Array.from(currentElement.classList);
  if (currentElementClassNames.includes("offer-action")) {
    const id_offer = currentElement.dataset.offerid;
    const action = parseInt(currentElement.dataset.action);
    const parameters =
      action === 1 ? { is_accepted: true } : { is_declined: true };
    const { data: offerData, status: offerStatus } = await updateOffer(
      parameters,
      id_offer
    );
    const { data, status } = await getFilteredContent(
      "/activities/offers?type=all"
    );
    if (status === 200) {
      const container = document.querySelector("#offers-container");
      container.innerHTML = "";
      data.map((element) => {
        let offer = getOfferTemplate(element);
        container.appendChild(offer);
      });
    }
  }
};

const handleRadioClick = async (event) => {
  const targetedElements = [
    "offers_filter_all",
    "offers_filter_current",
    "offers_filter_old",
    "offers_filter_sent",
    "offers_filter_received",
    "posts_filter_all",
    "posts_filter_current",
    "posts_filter_old",
    "asks_filter_all",
    "asks_filter_current",
    "asks_filter_old",
  ];
  const currentElement = event.target;
  const currentElementid = currentElement.id;
  if (targetedElements.includes(currentElementid) && currentElement.checked) {
    const currentElementDataType = currentElement.dataset.filtertype;
    const currentElementValue = currentElement.value;
    let url, container, redirectionLink, text, header;
    if (currentElementDataType === "offers") {
      url = `/activities/offers?ajax=true&type=${currentElementValue}`;
      container = document.querySelector("#offers-container");
      redirectionLink = ROOT_PATH + "/posts";
      header = "Aucune offre pour le moment ...";
      text = "VENIR EN AIDE A LA COMMUNAUTE";
    } else if (currentElementDataType === "asks") {
      url = `/activities/asks?ajax=true&type=${currentElementValue}`;
      container = document.querySelector("#asks-container");
      redirectionLink = ROOT_PATH + "/posts";
      header = "Aucune demande pour le moment ...";
      text = "VOIR LES ANNONCES";
    } else if (currentElementDataType === "posts") {
      url = `/activities/posts?ajax=true&type=${currentElementValue}`;
      container = document.querySelector("#posts-container");
      redirectionLink = ROOT_PATH + "/posts/new";
      header = "Aucune annonce pour le moment ...";
      text = "PUBLIER UNE ANNONCE";
    }
    const { data, status } = await getFilteredContent(url);
    container.innerHTML = "";
    if (data?.length > 0) {
      if (currentElementDataType === "offers") {
        data.map((element) => {
          let offer = getOfferTemplate(element);
          container.appendChild(offer);
        });
      } else if (currentElementDataType === "asks") {
        // data.map((element) => {
        //     let offer = getAskTemplate(element);
        //     container.appendChild(offer)
        // })
      } else if (currentElementDataType === "posts") {
        data.map((element) => {
          let post = getPostTemplate(element, current_user);
          container.appendChild(post);
        });
      }
    } else {
      container.innerHTML = getNoResultTemplate(redirectionLink, text, header);
    }
  }
};

const handleEvents = () => {
  window.addEventListener("click", function (event) {
    handleRadioClick(event);
    handleOfferCardAction(event);
  });
};

$(document).ready(function () {
  // getting current user
  setCurrentUserId(current_user);
  // handleEvents on the page
  handleEvents();
});
