<nav class="d-none col-xl-3 d-xl-flex flex-column justify-content-around p-4 fixed-bottom" style="height:100vh" id="menu-navigation">
    <ul class="nav flex-column w-100 bg-light shadow rounded p-4">
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/message.svg" height="36" width="36" alt="my chats">
            <a class="nav-link active display-6 m-2 font-weight-bold" href="<?php echo ROOT_PATH . '/chats' ?>">Mes messages</a>
        </li>
    </ul>
    <ul class="nav flex-column w-100 bg-light shadow rounded p-4">
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/account.svg" height="36" width="36" alt="account informations">
            <a class="nav-link active display-6 m-2 font-weight-bold" href="<?php echo ROOT_PATH . '/profile' ?>">Mon profil</a>
        </li>
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/home.svg" height="36" width="36" alt="home">
            <a class="nav-link active display-6 m-2 font-weight-bold" href="<?php echo ROOT_PATH . '/' ?>">Accueil</a>
        </li>
    </ul>
</nav>