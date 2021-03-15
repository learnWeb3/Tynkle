import { ROOT_PATH } from "../API_CLIENT/index.js";

const getUserTemplate = ({
  id,
  username,
  posts_count,
  offers_count,
  reviews_score,
  created_at,
  distance
}) =>
  `
<div class="col-12 col-xl-9 m-4">
    <div class="card shadow p-4 rounded">
        <div class="row w-100">
            <div class="col-12 col-xl-6 d-flex flex-column justify-content-center">
                <div class="avatar shadow-sm bg-white my-4">
                    <i class="lni lni-user lni-64"></i>
                    <a class=" font-italic m-2 stretched-link"
                    href="${
                      ROOT_PATH + "/users/" + id
                    }">${username}</a>
                </div>
               
            </div>
            <div class="col-12 col-xl-6 d-flex flex-column justify-content-center">
                <p class=" m-2">${posts_count} annonces -
                    ${offers_count} offres</p>
                <div class="row">
                    <div class="col-12 d-flex align-items-center">
                        <div class="rating m-2"
                            data-rate-value='${
                              reviews_score ? reviews_score : 0
                            }'>
                        </div>
                        <p class=" m-2">
                            ${reviews_score ? reviews_score : 0}/5</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 d-flex align-items-center">
                        <i class="lni lni-calendar lni-16"></i>
                        <small class="m-2 mb-0">Inscrit le ${created_at}</small>
                    </div>
                </div>
                <div class="row">
                <div class="col-12 d-flex align-items-center">
                    <i class="lni lni-pointer lni-16"></i>
                    <small class="m-2 mb-0 font-weight-bold">A ${distance} Km</small>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>
`.trim();
const getBreakdownTemplate = ({
  created_at,
  description,
  id,
  id_platform,
  name,
  updated_at,
}) => `<div class="radio-card-group bg-white shadow" style="position:relative">
<p class="my-2 text-center ">${name}</p>
<input style="position:absolute; z-index:1; left:0" type='radio' class='radio-card' name='platform' id="platform" value='${id}'/>
</div>`;

const getBreakdownTemplateChecked = ({
  created_at,
  description,
  id,
  id_platform,
  name,
  updated_at,
}) => `<div class="radio-card-group bg-white shadow-sm" style="position:relative">
    <p class="my-2 text-center ">${name}</p>
    <input checked style="position:absolute; z-index:1; left:0" type='radio' class='radio-card' name='platform' id="platform" value='${id}'/>
    </div>`;

const getPlatformTemplate = ({ id, name, icon, description }) => {
  return `<div class="radio-card-group bg-white shadow-sm" style="position:relative">
    <div class="row w-100">
      <div class="col-6 col-lg-3 d-flex align-items-center justify-content-center"><i class='lni lni-32 lni-${icon}'/></div>
      <div class="col-6 col-lg-3 d-flex align-items-center justify-content-center"><p class="my-2 text-center ">${name}</p></div>
      <div class="d-none d-lg-flex col-lg-6 align-items-center"><p class="my-2 text-left">${description}</p></div>
    </div>
    <input style="position:absolute; z-index:1; left:0" type='radio' class='radio-card' name='platform' id="platform" value='${id}'/>
    </div>`;
};

const getPlatformTemplateChecked = ({ id, name, icon, description }) => {
  return `<div class="radio-card-group bg-white shadow-sm" style="position:relative">
  <div class="row w-100">
    <div class="col-6 col-lg-3 d-flex align-items-center justify-content-center"><i class='lni lni-32 lni-${icon}'/></div>
    <div class="col-6 col-lg-3 d-flex align-items-center justify-content-center"><p class="my-2 text-center ">${name}</p></div>
    <div class="d-none d-lg-flex col-lg-6 d-flex align-items-center"><p class="my-2 text-left">${description}</p></div>
  </div>
  <input checked style="position:absolute; z-index:1; left:0" type='radio' class='radio-card' name='platform' id="platform" value='${id}'/>
  </div>`;
};
const getArticleTemplate = (
  { cover_image, title, description, id },
  ROOT_PATH
) => {
  return `
  <div class="card m-2 p-4 shadow" style="width: 25rem;">
    <img class="card-img-top"
        src="${cover_image}"
        alt="Card image cap">
    <div class="card-body d-flex flex-column">
        <h5 class="card-title my-2">${title}</h5>
        <p class="card-text">${description}</p>
        <a href="${
          ROOT_PATH + "/articles/" + id
        }" class="align-self-end text-brand-blue font-weight-bold">Lire la suite <i
                class="lni lni-arrow-right"></i></a>
    </div>
</div>

  `.trim();
};

const getAlertTemplate = (messages, type) => {
  const displayMessages = (messages) =>
    messages.map((message) => `<p class="p-0 m-0">${message}</p>`);

  return `<div class="alert alert-${type} alert-dismissible fade show m-0 fixed-top" role="alert">
      <div class="w-100 d-flex justify-content-center align-items-center flex-column">
            ${displayMessages(messages)}
      </div>
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
      </button>
    </div>`.trim();
};

const getUnfollowButton = (followId, userId) =>
  `<button id="unfollow" data-follow="${followId}" data-user="${userId}" class="btn btn-lg btn-red-crayola col-12 col-lg-3 m-2"> <i class="lni lni-heart mx-2"></i>NE PLUS SUIVRE</button>`;
const getFollowButton = (userId) => {
  return ` <button id="follow" data-user="${userId}" class="btn btn-lg btn-primary col-12 col-lg-3 m-2"> <i class="lni lni-heart mx-2"></i>SUIVRE</button>`;
};

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

const getTypingAreaTemplate = (subscibersIds, chatId, currentUserId) => {
  return `
  <form id="new-message" action="#" class="bg-light d-flex align-items-center px-4" style="height: 10vh;">
      <div class="input-group">
      <input name="content" data-subscibersIds='${subscibersIds}' data-current='${currentUserId}' data-id='${chatId}' id="content" placeholder="Rediger votre message..." aria-describedby="button-addon2"
      class="form-control rounded-0 border-0 py-4 bg-light"></input>
          <div class="input-group-append">
              <button id="button-addon2" type="submit" class="btn btn-link"><i class="lni lni-facebook-messenger lni-32"></i></button>
          </div>
      </div>
  </form>`.trim();
};

const getMessageTemplate = (
  { user_username, user_id, message_id, message_content, message_created_at },
  current_user
) => {
  if (parseInt(current_user.id) !== parseInt(user_id)) {
    return `
  <div id="message-${message_id}" class="media sender w-50 mb-3 d-flex"> <i class="lni lni-user lni-32"></i>
      <div class="media-body mx-3">
          <div class="bg-light rounded py-2 px-3 mb-2">
              <p class="text-small mb-0 text-muted"> ${message_content}</p>
          </div>
          <p class="small text-muted">${message_created_at}</p>
      </div>
  </div>
  `.trim();
  } else {
    return `
    <div id="message-${message_id}" class="media recipient w-50 ml-auto mb-3">
    <div class="media-body">
        <div class="bg-primary rounded py-2 px-3 mb-2">
            <p class="text-small mb-0 text-white">${message_content}</p>
        </div>
        <p class="small text-muted">${message_created_at}</p>
    </div>
</div>
    `.trim();
  }
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
      <i class="lni lni-trash lni-16"></i>
      <i class="lni lni-spinner-arrow lni-16"></i>
    </div>
    `.trim();
    } else {
      return "";
    }
  };
  const innerHTML = `
    <img src="${cover_image}" alt="" class="card-img-top">
    <div class="card-body">
        <div class="row">
            <div class="col-12 d-flex flex-column justify-content-start">
                <h5 class="font-weight-bold">${title}</h5>
                <p>${platform_name}-${breakdown_category_name}</p>
            </div>
            <div class="col-12 d-flex align-items-start">
                <div class="d-flex align-items-center w-100">
                <i class="lni lni-pointer lni-16"></i>
                    <p class="m-2">${city} ${postal_code}</p>
                </div>
            </div>
        </div>
        <div class="row d-none d-lg-block">
            <div class="d-flex align-items-center w-100">
                <i class="lni lni-user lni-16"></i>
                <a class="font-italic m-2" href="${ROOT_PATH}/users/${user_id}">${username}</a>
            </div>
        </div>
        <div class="row">
            <div class="col-12 d-flex align-items-center">
              <i class="lni lni-calendar lni-16"></i>
                <small class="m-2 mb-0">Posté le ${created_at}</small>
            </div>
        </div>
        <div class="row">
          ${getAuthorActions(user_id, current_user)}
        </div>
        <div class="row my-4">
        <a href="${
          ROOT_PATH + "/posts/" + id
        }" class="align-self-end font-weight-bold text-end">Voir les détails <i
        class="lni lni-arrow-right"></i></a>
  
        </div>
    </div>
    `.trim();
  const card = document.createElement("div");
  card.setAttribute("id", `post-${id}`);
  card.classList.add(
    "card",
    "card-publication",
    "shadow",
    "p-4",
    "m-2",
    "rounded"
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
          <i class="lni lni-user lni-16 mx-2"></i>
            <a href="${
              ROOT_PATH + "/users/" + user_id
            }" class="font-weight-bold m-0">${username}</a>
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
    <a class="my-4 btn btn-primary btn-lg " href="${redirectionLink}">${text}</a>
    
    `.trim();
};

export {
  getNoResultTemplate,
  getPostTemplate,
  getOfferTemplate,
  getAsktemplate,
  getBreakdownCategoriesCheckInputTemplate,
  getMessageTemplate,
  getAdminUserRowTemplate,
  getTypingAreaTemplate,
  getAlertTemplate,
  getUnfollowButton,
  getFollowButton,
  getArticleTemplate,
  getBreakdownTemplate,
  getBreakdownTemplateChecked,
  getPlatformTemplate,
  getPlatformTemplateChecked,
  getUserTemplate,
};
