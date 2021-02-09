<nav class="d-none col-xl-3 d-xl-flex flex-column justify-content-around fixed-bottom p-4" style="margin-top: 15%;height:100vh" id="menu-navigation">
    <ul class="nav flex-column bg-white shadow w-100 p-4 rounded">
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/account.svg" height="32" width="32" alt="account informations">
            <a class="nav-link font-weight-bold" href="#account_informations">Informations générales</a>
        </li>
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/details.svg" height="32" width="32" alt="personnal informations">
            <a class="nav-link font-weight-bold" href="#personnal_informations">Informations personnelles</a>
        </li>

        <li class="nav-item dropdown d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/skills.svg" height="32" width="32" alt="skills">
            <a class="nav-link font-weight-bold dropdown-toggle" href="#" id="skills-dropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Compétences
            </a>
            <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="skills-dropdown">
                <?php foreach ($platforms as $index => $platform) : ?>
                    <li class="dropdown-item"><a href="#platform-<?php echo $platform['id'] ?>">Compétences : <?php echo $platform['name'] ?></a></li>
                <?php endforeach; ?>
            </ul>
        </li>
    </ul>
    <ul class="nav flex-column bg-white shadow p-4 rounded">
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/chat.svg" height="32" width="32" alt="chats">
            <a href="<?php echo ROOT_PATH ?>/chats" class="nav-link font-weight-bold">Messages</a>
        </li>
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/home.svg" height="32" width="32" alt="home">
            <a class="nav-link active font-weight-bold" href="<?php echo ROOT_PATH . '/' ?>">Accueil</a>
        </li>
    </ul>

</nav>