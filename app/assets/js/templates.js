import { ROOT_PATH } from "./API_CLIENT/index.js";


const getBreakdownCategoriesCheckInputTemplate = ({ id, name }) => {
    return (`
        <input class="form-check-input" type="checkbox" id="breakdown_category-${id}" data-breakdownId="${id}">
        <label class="form-check-label" for="breakdown_category-${id}">
            ${name}
        </label>`).trim()
}

const getPostTemplate = ({id, platform_name, breakdown_category_name, postal_code, city, user_name, user_id, created_at, cover_image }) => {
    const innerHTML = (`
    <img src="${cover_image}" height="450px" alt="" class="card-img-top">
    <div class="card-body">
        <div class="row">
            <div class="col-12 d-flex flex-column justify-content-start">
                <h5 class="font-weight-bold"><?php echo htmlspecialchars($post['title']) ?></h5>
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
                <a class="font-italic m-2" href="/users/${user_id}">${user_name}</a>
            </div>
        </div>
        <div class="row">
            <div class="col-6 d-flex align-items-center">
                <img src="${ROOT_PATH}/app/assets/partials/publication_card/img/clock.svg" height="16" width="16" alt="edit publication" class="img-fluid mr-2">
                <small class="m-2 mb-0">Posté le ${created_at}</small>
            </div>
            <div class="col-6 d-flex justify-content-end">
                <img src="${ROOT_PATH}/app/assets/partials/publication_card/img/trash.svg" height="16" width="16" alt="delete publication" class="m-2 img-fluid">
                <img src="${ROOT_PATH}/app/assets/partials/publication_card/img/edit.svg" height="16" width="16" alt="edit publication" class="m-2 img-fluid">
            </div>
        </div>

        <div class="row my-4">
            <a class="btn btn-lg btn-brand active" href="${ROOT_PATH+'/posts/'+id}">VOIR LES DETAILS</a>
        </div>
    </div>
    `).trim();
    const card = document.createElement('div');
    card.setAttribute('id', `post-${id}`)
    card.classList.add('card', 'card-publication', 'col-12', 'col-xl-6', 'shadow', 'p-4', 'my-4')
    card.innerHTML = innerHTML;
    return card;

}

const getAsktemplate = ({ }) => {

}

const getOfferTemplate = ({ id, object, content, amount, id_post, username, user_id, is_accepted, is_declined }) => {

    const getButtons = (is_accepted, is_declined, id) => {
        if (is_accepted === '0' && is_declined === '0') {
            return `<button class="btn btn-md btn-success offer-action" data-action="1" data-offerId="${id}">ACCEPTER</button>
            <button class="btn btn-md btn-red-crayola offer-action" data-action="0" data-offerId="${id}">DECLINER</button>`
        } else if (is_accepted  === '1' && is_declined === '0') {
            return `<p class='w-100 text-xl-end font-weight-bold text-success'>ANNONCE ACCEPTEE</p>`
        } else if (is_accepted === '0' && is_declined === '1') {
            return `<p class='w-100 text-xl-end font-weight-bold text-danger'>ANNONCE DECLINEE</p>`
        }
    }
    const innerHTML = (`
    <div class="row my-2">
        <div class="col-12 col-xl-4 d-flex align-items-center my-2">
            <h5 class="font-weight-bold">Objet:</h5>
            <h5 class="font-weight-bold">${object}</h5>
        </div>
        <div class="col-12 col-xl-8 d-flex align-items-center justify-content-xl-end my-2">
            <img src="./assets/partials/publication_card/img/avatar_placeholder.svg" class="m-2" height="36" width="36" alt="map pointer icon" class="img-fluid">
            <a href="${ROOT_PATH + '/users/' + user_id}" class="font-weight-bold my-2">${username}</a>
        </div>
    </div>
    <div class="row my-2">
        <div class="col-12 col-xl-8 my-2">
            <h5 class="font-weight-bold">Contenu du message :</h5>
            <p class="mb-0">${content}</p>
        </div>
        <div class="col-12 col-xl-4 d-flex align-items-center justify-content-xl-end my-2">
            <p class="font-weight-bold text-end mb-0">Montant proposé:${amount} &euro;</p>
        </div>
    </div>
    <div class="row d-flex justify-content-end my-2">
        <div class="col-12 col-xl-8 d-flex align-items-center">
            <a class="font-weight-bold" href="${ROOT_PATH + '/posts/' + id_post}" class=""> Voir l'annonce</a>
        </div>
        <div class="col col-xl-4 d-flex align-items-center justify-content-between my-2">
           ${getButtons(is_accepted, is_declined, id)}
        </div>
    </div>
    `).trim();

    const card = document.createElement('div');
    card.setAttribute('id', `offer-${id}`)
    card.classList.add('card', 'card-proposition', 'col-12', 'col-xl-8', 'shadow', 'p-4', 'my-4')
    card.innerHTML = innerHTML;
    return card;
}


const getNoResultTemplate = (redirectionLink, text, header) => {
    return (`
    <h2>${header}</h2>
    <a class="my-4 btn btn-brand btn-lg active" href="${redirectionLink}">${text}</a>
    
    `).trim()
}

export { getNoResultTemplate, getPostTemplate, getOfferTemplate, getAsktemplate, getBreakdownCategoriesCheckInputTemplate }