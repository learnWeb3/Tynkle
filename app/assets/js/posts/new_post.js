import { getPlatforms } from '../API_CLIENT/index.js';
import { geocode } from '../commons/geolocation.js';

const handleClickDropzone = () => {
    Array.from(document.querySelectorAll('.dropzone-layer'))
        .map((domElement) => domElement.addEventListener('click', function (event) {
            Array.from(domElement.parentElement.children)[0].click();
        }));
}

const handlePreviewFiles = () => {
    const dropzones = Array.from(document.querySelectorAll('.dropzone'));
    dropzones.map((dropzone) => dropzone.addEventListener('change', function (event) {
        const targetedInput = event.target;
        const files = Array.from(targetedInput.files);
        if (files.length > 0) {
            const previewUrlBlob = URL.createObjectURL(files[0]);
            const targetedElementChildren = Array.from(targetedInput.parentElement.children);
            const dropzoneLayer = targetedElementChildren[1];
            if (dropzoneLayer) {
                const text = Array.from(targetedElementChildren[1].children)[0]
                text.classList.add('text-white');
                dropzoneLayer.style.backgroundImage = `url(${previewUrlBlob})`;
            }
        }
    }))
}

const handleChangeSelect = async () => {
    document.querySelector('#id_platform').addEventListener('change', async () => {
        const breakdown_type_select_input = document.querySelector('#id_breakdown_category');
        const id_platform = document.querySelector('#id_platform').selectedOptions[0].value;
        const {status, data : platforms} = await getPlatforms({
            id_platform
        });
        if (platforms) {
            Array.from(breakdown_type_select_input.children).map((child) => child.remove());
            platforms.map((platform) => {
                const option = document.createElement('option');
                option.value = platform.id;
                const text = document.createTextNode(platform.name);
                option.appendChild(text);
                breakdown_type_select_input.appendChild(option)
            })
        }
    });

}


var componentForm = {
    locality: "long_name",
    postal_code: "short_name",
};
let autocomplete;

function initAutocomplete(){
    autocomplete = new google.maps.places.Autocomplete(
        document.getElementById("adress"),
        { types: ["geocode"] });
    autocomplete.setFields(["address_component"]);
    autocomplete.addListener("place_changed", fillInAddress);
}

async function fillInAddress(){
    const place = autocomplete.getPlace();
    for (const component in componentForm) {
        document.getElementById(component).value = "";
        document.getElementById(component).disabled = false;
    }
    for (const component of place.address_components) {
        const addressType = component.types[0];
        if (componentForm[addressType]) {
            const val = component[componentForm[addressType]];
            document.getElementById(addressType).value = val;
        }
    }
    const postal_code = document.querySelector('#postal_code').value
    const locality = document.querySelector("#locality").value
    const {lat, lng} = await geocode(locality, postal_code, API_KEY);
    if (lat && lng)
    {
        document.querySelector("#lat").value = lat
        document.querySelector("#lng").value = lng
    }
}
const API_KEY = document.querySelector('#maps').dataset.apikey
initAutocomplete();
handleChangeSelect()
handleClickDropzone();
handlePreviewFiles();