import { getFollowingPosts, getPlatforms, ROOT_PATH } from './API_CLIENT/index.js'


const getBreakdownCategoriesCheckInputTemplate = ({ id, name }) => {
    return (`
        <input class="form-check-input" type="checkbox" value="${id}" id="breakdown_category-${id}">
        <label class="form-check-label" for="breakdown_category-${id}">
            ${name}
        </label>`).trim()
}

const handleChangeSelect = async () => {
    document.querySelector('#id_platform').addEventListener('change', async () => {
        const breakdown_categories = document.querySelector('#breakdown_categories');
        const id_platform = document.querySelector('#id_platform').selectedOptions[0].value;
        Array.from(breakdown_categories.children).map((child) => child.remove());
        if (id_platform !== '0') {
            const platforms = await getPlatforms({
                id_platform
            });
            if (platforms) {
                platforms.map((platform) => {
                    const div = document.createElement('div');
                    div.classList.add('form-check');
                    div.innerHTML = getBreakdownCategoriesCheckInputTemplate(platform)
                    breakdown_categories.appendChild(div);
                })
            }
        } else {
            const p = document.createElement('p');
            p.classList.add('my-2')
            p.innerHTML = 'Veuillez selectionner une plateforme'
            breakdown_categories.appendChild(p);
        }
    });

}

const initObserver = () => {

    const postsContainer = document.querySelector('#posts-container');
    const nextPage = postsContainer.dataset.nextpage;

    const options = {
        threshold: 1
    }
    const state = {
        viewedItemCount: 0,
        nextPage
    }

    const getTemplate = ({ cover_image, title, platform_name, breakdown_category_name, city, postal_code, user_id, username, created_at, id }) => {
        const cardPublication = document.createElement('div');
        const cls = ['card', 'card-publication', 'col-12', 'col-lg-6', 'shadow', 'p-4', 'my-4'];
        cardPublication.classList.add(...cls);
        cardPublication.innerHTML = (`
            <img src="${cover_image}" height="450px" alt="" class="card-img-top">
            <div class="card-body">
                <div class="row">
                    <div class="col-12 d-flex flex-column justify-content-start">
                        <h5 class="font-weight-bold">${title}</h5>
                        <p>${platform_name}-${breakdown_category_name}</p>
                    </div>
                    <div class="col-12 d-flex align-items-start">
                        <div class="d-flex align-items-center w-100">
                            <img src="./assets/partials/publication_card/img/pointer.svg" height="16" width="16" alt="map pointer icon" class="img-fluid">
                            <p class="m-2">${city} ${postal_code}</p>
                        </div>
                    </div>
                </div>
                <div class="row d-none d-lg-block">
                    <div class="d-flex align-items-center w-100">
                        <img src="./assets/partials/publication_card/img/avatar_placeholder.svg" height="16" width="16" alt="map pointer icon" class="img-fluid">
                        <a class="font-italic m-2" href="/users/${user_id}">${username}</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 d-flex align-items-center">
                        <img src="./assets/partials/publication_card/img/clock.svg" height="16" width="16" alt="edit publication" class="img-fluid mr-2">
                        <small class="m-2 mb-0">Posté le ${created_at}</small>
                    </div>
                    <div class="col-6 d-flex justify-content-end">
                        <img src="./assets/partials/publication_card/img/trash.svg" height="16" width="16" alt="delete publication" class="m-2 img-fluid">
                        <img src="./assets/partials/publication_card/img/edit.svg" height="16" width="16" alt="edit publication" class="m-2 img-fluid">
                    </div>
                </div>
                <div class="row my-4">
                    <a class="btn btn-lg btn-brand active" href="/posts/${id}">VOIR LES DETAILS</a>
                </div>
            </div>`).trim();
        return cardPublication;
    }

    const appendFollowingPosts = (followingPosts) => followingPosts.data.map((followingPost) => document.querySelector('#posts-container').appendChild(getTemplate(followingPost)))

    function callback(entries) {
        entries.map(element => {
            if (element.intersectionRatio >= 1) {
                element.target.classList.add('active');
                state.viewedItemCount = state.viewedItemCount + 1;
                if (state.viewedItemCount === 10) {
                    getFollowingPosts(nextPage).then((response) => response.json()).then((data) => {
                        appendFollowingPosts(data)
                        postsContainer.dataset.nextpage = data.next;
                        initObserver();
                    }).catch((error) => console.log(error))
                }
            }
        });
    }
    var OBSERVER = new IntersectionObserver(callback, options)
    const init = (targetSelector) => {
        Array.from(document.querySelectorAll(targetSelector)).map((element) => OBSERVER.observe(element))
    }
    init('.card-publication');
}

handleChangeSelect();
initObserver();