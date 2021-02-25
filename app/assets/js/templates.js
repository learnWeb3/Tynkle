import { ROOT_PATH } from "./API_CLIENT/index.js";

const getAdminUserRowTemplate = ({
  username,
  email,
  id,
  is_helper,
  is_admin,
}) => {
  const getIsHelperInputs = (is_helper, id) => {
    if (parseInt(is_helper) === 1) {
      return `
      <div class="form-check form-check-inline">
        <input class="form-check-input" data-userid="${id}" type="radio" name="is_helper" id="is_helper_1" value="1" checked>
        <label class="form-check-label" for="is_helper_1">oui</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" data-userid="${id}" type="radio" name="is_helper" id="is_helper_0" value="0">
      </div>
      `.trim();
    } else {
      return `
        <div class="form-check form-check-inline">
          <input class="form-check-input" data-userid="${id}" type="radio" name="is_helper" id="is_helper_1" value="1">
          <label class="form-check-label" for="is_helper_1">oui</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input" data-userid="${id}" type="radio" name="is_helper" id="is_helper_0" value="0" checked>
          <label class="form-check-label" for="is_helper_0">non</label>
        </div>
        `.trim();
    }
  };

  const getIsAdminInputs = (is_admin, id) => {
    if (parseInt(is_admin) === 1) {
      return `
      <div class="form-check form-check-inline">
        <input class="form-check-input" data-userid="${id}" type="radio" name="is_admin" id="is_admin_1" value="1" checked>
        <label class="form-check-label" for="is_admin_1">oui</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" data-userid="${id}" type="radio" name="is_admin" id="is_admin_0" value="0">
        <label class="form-check-label" for="is_admin_0">non</label>
      </div>
      `.trim();
    } else {
      return `
        <div class="form-check form-check-inline">
          <input class="form-check-input" data-userid="${id}" type="radio" name="is_admin" id="is_admin_1" value="1">
          <label class="form-check-label" for="is_admin_1">oui</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input" data-userid="${id}" type="radio" name="is_admin" id="is_admin_0" value="0" checked>
          <label class="form-check-label" for="is_admin_0">non</label>
        </div>
        `.trim();
    }
  };

  return `
              <tr>
                    <th scope="row">${id}</th>
                    <td>${username}</td>
                    <td>${email}</td>
                    <td>
                        <form class="user-update" action="" method="post">
                         ${getIsHelperInputs(is_helper, id)}
                        </form>
                    </td>
                    <td>
                        <form class="user-update" action="" method="post">
                          ${getIsAdminInputs(is_admin, id)}
                        </form>
                    </td>
              </tr>
    `.trim();
};

const getBreakdownCategoriesCheckInputTemplate = ({ id, name }) => {
  return `
        <input class="form-check-input" type="checkbox" id="breakdown_category-${id}" data-breakdownId="${id}">
        <label class="form-check-label" for="breakdown_category-${id}">
            ${name}
        </label>`.trim();
};

const getMessageTemplate = (
  { username, id_user, content, created_at },
  current_user
) => {
  return `<div class="row">
          <div class="col-1 d-flex flex-column justify-content-center">
              <img src="${ROOT_PATH}/app/assets/img/commons/avatar_placeholder.svg" height="48" width="48" alt="map pointer icon" class="img-fluid">
          </div>
          <div class="col">
              <p class="font-weight-bold mb-0">${username}</p>
              <p class="font-italic text-muted mb-0">${created_at}</p>
          </div>
      </div>
      <div class="row my-2">
          <p>
              ${content}
          </p>
      </div>`.trim();
};

const getPostTemplate = (
  {
    id,
    title,
    platform_name,
    breakdown_category_name,
    postal_code,
    city,
    username,
    user_id,
    created_at,
    cover_image,
  },
  current_user
) => {
  const getAuthorActions = (user_id, current_user) => {
    if (current_user.id === user_id) {
      return `
    <div class="col-6 d-flex justify-content-end">
      <img src="${ROOT_PATH}/app/assets/partials/publication_card/img/trash.svg" height="16" width="16" alt="delete publication" class="m-2 img-fluid">
      <img src="${ROOT_PATH}/app/assets/partials/publication_card/img/edit.svg" height="16" width="16" alt="edit publication" class="m-2 img-fluid">
    </div>
    `.trim();
    } else {
      return "";
    }
  };
  const innerHTML = `
    <img src="${cover_image}" height="450px" alt="" class="card-img-top">
    <div class="card-body">
        <div class="row">
            <div class="col-12 d-flex flex-column justify-content-start">
                <h5 class="font-weight-bold">${title}</h5>
                <p>${platform_name}-${breakdown_category_name}</p>
            </div>
            <div class="col-12 d-flex align-items-start">
                <div class="d-flex align-items-center w-100">
                    <img src="${ROOT_PATH}/app/assets/partials/publication_card/img/pointer.svg" height="16" width="16" alt="map pointer icon" class="img-fluid">
                    <p class="m-2">${city} ${postal_code}</p>
                </div>
            </div>
        </div>
        <div class="row d-none d-lg-block">
            <div class="d-flex align-items-center w-100">
                <img src="${ROOT_PATH}/app/assets/partials/publication_card/img/avatar_placeholder.svg" height="16" width="16" alt="map pointer icon" class="img-fluid">
                <a class="font-italic m-2" href="${ROOT_PATH}/users/${user_id}">${username}</a>
            </div>
        </div>
        <div class="row">
            <div class="col-6 d-flex align-items-center">
                <img src="${ROOT_PATH}/app/assets/partials/publication_card/img/clock.svg" height="16" width="16" alt="edit publication" class="img-fluid mr-2">
                <small class="m-2 mb-0">Posté le ${created_at}</small>
            </div>
           ${getAuthorActions(user_id, current_user)}
        </div>

        <div class="row my-4">
            <a class="btn btn-lg btn-brand active" href="${
              ROOT_PATH + "/posts/" + id
            }">VOIR LES DETAILS</a>
        </div>
    </div>
    `.trim();
  const card = document.createElement("div");
  card.setAttribute("id", `post-${id}`);
  card.classList.add(
    "card",
    "card-publication",
    "col-12",
    "col-xl-6",
    "shadow",
    "p-4",
    "my-4"
  );
  card.innerHTML = innerHTML;
  return card;
};

const getAsktemplate = ({}) => {};

const getOfferTemplate = ({
  id,
  object,
  content,
  amount,
  id_post,
  username,
  user_id,
  is_accepted,
  is_declined,
}) => {
  const getButtons = (is_accepted, is_declined, id) => {
    if (is_accepted === "0" && is_declined === "0") {
      return `<button class="btn btn-md btn-success offer-action" data-action="1" data-offerId="${id}">ACCEPTER</button>
            <button class="btn btn-md btn-red-crayola offer-action" data-action="0" data-offerId="${id}">DECLINER</button>`;
    } else if (is_accepted === "1" && is_declined === "0") {
      return `<p class='w-100 text-xl-end font-weight-bold text-success'>ANNONCE ACCEPTEE</p>`;
    } else if (is_accepted === "0" && is_declined === "1") {
      return `<p class='w-100 text-xl-end font-weight-bold text-danger'>ANNONCE DECLINEE</p>`;
    }
  };
  const innerHTML = `
    <div class="row my-2">
        <div class="col-12 col-xl-8 d-flex align-items-center my-2">
            <h5 class="font-weight-bold">Objet : </h5>
            <h5 class="font-weight-bold">${object}</h5>
        </div>
        <div class="col-12 col-xl-4 d-flex align-items-center justify-content-xl-end my-2">
            <img src="${ROOT_PATH}/app/assets/partials/publication_card/img/avatar_placeholder.svg" class="m-2" height="36" width="36" alt="map pointer icon" class="img-fluid">
            <a href="${
              ROOT_PATH + "/users/" + user_id
            }" class="font-weight-bold my-2">${username}</a>
        </div>
    </div>
    <div class="row my-2">
        <div class="col-12 col-xl-8 my-2">
            <h5 class="font-weight-bold">Contenu du message :</h5>
            <p class="mb-0">${content}</p>
        </div>
        <div class="col-12 col-xl-4 d-flex align-items-center justify-content-xl-end my-2">
            <p class="font-weight-bold text-end mb-0">Montant proposé : ${amount} &euro;</p>
        </div>
    </div>
    <div class="row d-flex justify-content-end my-2">
        <div class="col-12 col-xl-8 d-flex align-items-center">
            <a class="font-weight-bold" href="${
              ROOT_PATH + "/posts/" + id_post
            }" class=""> Voir l'annonce</a>
        </div>
        <div class="col col-xl-4 d-flex align-items-center justify-content-between my-2">
           ${getButtons(is_accepted, is_declined, id)}
        </div>
    </div>
    `.trim();

  const card = document.createElement("div");
  card.setAttribute("id", `offer-${id}`);
  card.classList.add(
    "card",
    "card-proposition",
    "col-12",
    "col-xl-8",
    "shadow",
    "p-4",
    "my-4"
  );
  card.innerHTML = innerHTML;
  return card;
};

const getNoResultTemplate = (redirectionLink, text, header) => {
  return `
    <h2>${header}</h2>
    <a class="my-4 btn btn-brand btn-lg active" href="${redirectionLink}">${text}</a>
    
    `.trim();
};

export {
  getNoResultTemplate,
  getPostTemplate,
  getOfferTemplate,
  getAsktemplate,
  getBreakdownCategoriesCheckInputTemplate,
  getMessageTemplate,
  getAdminUserRowTemplate
};
