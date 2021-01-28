import { ROOT_PATH, makeOffers } from './API_CLIENT/index.js'

const options = {
    max_value: 5,
    step_size: 0.5,
    initial_value: 0,
    cursor: 'default',
    readonly: true
};

const initMap = (lat, lng) => {
    map = new google.maps.Map(document.getElementById("map"), {
        center: { lat, lng },
        zoom: 8,
    });
    const marker = new google.maps.Marker({
        position: { lat, lng },
        map: map
    });
}

const handleSubmit = (modalBody, sendButton, form, id_post, id_user) => {
    form.addEventListener('submit', async function (event) {
        event.preventDefault();
        if (id_user) {
            let data = {};
            const formData = new FormData(form);
            for (const pair of formData.entries()) {
                data[pair[0]] = pair[1];
            }
            data.id_post = parseInt(id_post);
            data.id_user = parseInt(id_user);
            const { data: responseData, status } = await makeOffers(data);
            if (status === 200) {
                form.remove();
                const img = new Image(64, 64);
                const p = document.createElement('p');
                const text = document.createTextNode('Offre envoyé avec succès');
                p.classList.add('font-weight-bold', 'my-2');
                p.appendChild(text);
                img.src = ROOT_PATH + '/app/assets/icons/success.svg';
                modalBody.classList.remove('d-block', 'overflow-auto');
                modalBody.classList.add('d-flex', 'justify-content-center', 'align-items-center', 'flex-column');
                modalBody.appendChild(img);
                modalBody.appendChild(p);
                sendButton.remove();
            } else {

                console.log(responseData);
                alert('error');
            }
        }
    });
}


$(".rating").rate(options);
const lat = parseInt(document.querySelector('#map').dataset.lat)
const lng = parseInt(document.querySelector('#map').dataset.lon)
initMap(lat, lng)
const sendButton = document.querySelector(".modal-footer .btn.btn-success");
const form = document.querySelector("#new-offer-form");
const modalBody = document.querySelector(".modal-body");
const id_post = form.dataset.idpost;
const id_user = form.dataset.iduser;
handleSubmit(modalBody, sendButton, form, id_post, id_user);
