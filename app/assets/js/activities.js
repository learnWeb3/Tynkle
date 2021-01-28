import { getFilteredContent, updateOffer, ROOT_PATH } from './API_CLIENT/index.js';
import { getAsktemplate, getNoResultTemplate, getOfferTemplate, getPostTemplate } from './templates.js';

const handleOfferCardAction = async (event) => {
    const currentElement = event.target;
    const currentElementClassNames = Array.from(currentElement.classList)
    if (currentElementClassNames.includes('offer-action')) {
        const id_offer = currentElement.dataset.offerid;
        const action = parseInt(currentElement.dataset.action);
        const parameters = (action === 1) ? { is_accepted: true } : { is_declined: true };
        const { data: offerData, status: offerStatus } = await updateOffer(parameters, id_offer);
        const { data, status } = await getFilteredContent('/offers?type=all');
        if (status === 200) {
            const container = document.querySelector('#offers-container')
            container.innerHTML = '';
            data.map((element) => {
                let offer = getOfferTemplate(element);
                container.appendChild(offer)
            })
        }
    }
}

const handleRadioClick = async (event) => {
    const targetedElements = [
        'offers_filter_all', 'offers_filter_current', 'offers_filter_old',
        'posts_filter_all', 'posts_filter_current', 'posts_filter_old',
        'asks_filter_all', 'asks_filter_current', 'asks_filter_old'
    ]
    const currentElement = event.target
    const currentElementid = currentElement.id
    if (targetedElements.includes(currentElementid) && currentElement.checked) {
        const currentElementDataType = currentElement.dataset.filtertype;
        const currentElementValue = currentElement.value;
        let url, container, redirectionLink, text, header;
        if (currentElementDataType === 'offers') {
            url = `/offers?type=${currentElementValue}`
            container = document.querySelector('#offers-container')
            redirectionLink = ROOT_PATH + '/offers';
            header = "Aucune offre pour le moment ..."
            text = "VENIR EN AIDE A LA COMMUNAUTE"
        }
        else if (currentElementDataType === 'asks') {
            url = `/asks?type=${currentElementValue}`
            container = document.querySelector('#asks-container')
            redirectionLink = ROOT_PATH + '/posts';
            header = "Aucune demande pour le moment ..."
            text = "VOIR LES ANNONCES"
        }
        else if (currentElementDataType === 'posts') {
            url = `/posts?type=${currentElementValue}`
            container = document.querySelector('#posts-container')
            redirectionLink = ROOT_PATH + '/posts/new';
            header = "Aucune annonce pour le moment ..."
            text = "PUBLIER UNE ANNONCE";
        }
        const { data, status } = await getFilteredContent(url);
        container.innerHTML = '';
        if (data?.length > 0) {
            if (currentElementDataType === 'offers') {
                data.map((element) => {
                    let offer = getOfferTemplate(element);
                    container.appendChild(offer)
                })
            }
            else if (currentElementDataType === 'asks') {
                // data.map((element) => {
                //     let offer = getAskTemplate(element);
                //     container.appendChild(offer)
                // })
            }
            else if (currentElementDataType === 'posts') {
                data.map((element) => {
                    let offer = getPostTemplate(element);
                    container.appendChild(offer)
                })
            }
        } else {
            container.innerHTML = getNoResultTemplate(redirectionLink, text, header);
        }
    }
}

const handleEvents = () => {
    window.addEventListener('click', function (event) {
        handleRadioClick(event);
        handleOfferCardAction(event);
    })
}

handleEvents();