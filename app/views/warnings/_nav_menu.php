<nav class="d-none col-xl-3 d-xl-flex flex-column justify-content-around fixed-bottom p-4" style="margin-top: 15%;height:100vh" id="menu-navigation">
    <ul class="nav flex-column bg-white shadow w-100 p-4 rounded">
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <i class="fas fa-chart-line fa-2x"></i>
            <a class="nav-link font-weight-bold" href="<?php echo ROOT_PATH."/admin/insights" ?>">Votre activité</a>
        </li>
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/details.svg" height="32" width="32" alt="plateforme">
            <a class="nav-link font-weight-bold" href="<?php echo ROOT_PATH."/admin/platform" ?>">Votre plateforme</a>
        </li>
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/account.svg" height="32" width="32" alt="users">
            <a class="nav-link font-weight-bold" href="<?php echo ROOT_PATH."/admin/users" ?>">Vos utilisateurs</a>
        </li>
        <li class="nav-item d-flex align-items-center w-100 my-2">
        <i class="fas fa-exclamation-circle fa-2x"></i>
            <a class="nav-link font-weight-bold" href="<?php echo ROOT_PATH."/warnings" ?>">Modération</a>
        </li>
    </ul>
    <ul class="nav flex-column bg-white shadow p-4 rounded">
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/home.svg" height="32" width="32" alt="home">
            <a class="nav-link active font-weight-bold" href="<?php echo ROOT_PATH . '/' ?>">Accueil</a>
        </li>
    </ul>
</nav>