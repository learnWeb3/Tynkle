import { signout, ROOT_PATH } from '../API_CLIENT/index.js';

const getTemplate = () => (`
    <li class="nav-item"><a class='nav-link' href='${ROOT_PATH}/signin'>Connexion</a></li>
    <li class="nav-item"><a class='nav-link' href='${ROOT_PATH}/register'>Inscription</a></li>
`).trim()

const logout = async (logoutButton, navbarLink) => {
    logoutButton?.addEventListener('click', async (event) => {
        event.preventDefault();
        const response = await signout();
        if (response.status === 204) {
            navbarLink.innerHTML = getTemplate()
        }
    });
}
const navbarLink = document.querySelector('nav .navbar-nav');
const logoutButton = document.querySelector('#logout');
logout(logoutButton, navbarLink);

