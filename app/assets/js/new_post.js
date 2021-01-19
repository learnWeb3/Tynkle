import { getPlatforms } from './API_CLIENT/index.js'

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
        const platforms = await getPlatforms({
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

handleChangeSelect()
handleClickDropzone();
handlePreviewFiles();