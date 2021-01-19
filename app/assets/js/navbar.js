import { signout, ROOT_PATH } from './API_CLIENT/index.js';

const logout = async () => {
    const logoutButton = document.querySelector('#logout');
    logoutButton?.addEventListener('click', async (event) => {
        event.preventDefault();
        const response = await signout();
        if (response.status === 204) {
            document.querySelector('nav .navbar-nav').innerHTML = (`
                <li class="nav-item"><a class='nav-link' href='${ROOT_PATH}/signin'>Connexion</a></li>
                <li class="nav-item"><a class='nav-link' href='${ROOT_PATH}/register'>Inscription</a></li>
            `).trim()
        }
    });
}

logout();

