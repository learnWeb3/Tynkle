<nav class="d-none col-xl-3 d-xl-flex flex-column justify-content-around p-4 fixed-bottom" style="height:100vh;" id="menu-navigation">
    <ul class="nav flex-column w-100">
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/account_light.svg" height="36" width="36" alt="account informations">
            <a class="nav-link active display-6 m-2 font-weight-bold text-white" href="#account_informations">Informations générales</a>
        </li>
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/details_light.svg" height="36" width="36" alt="personnal informations">
            <a class="nav-link display-6 m-2 font-weight-bold text-white" href="#personnal_informations">Informations personnelles</a>
        </li>
        <li class="nav-item w-100 my-2">

            <ul class="nav d-block overflow-auto w-100" style="height:33vh">
                <li class="font-weight-bold mb-2 d-flex align-items-center"> <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/skills_light.svg" height="36" width="36" alt="skills">
                    <a class="nav-link display-6 m-2 font-weight-bold text-white" href="#skills">Compétences</a>
                </li>
                <?php foreach ($platforms as $index => $platform) : ?>
                    <li class="font-weight-bold mb-2 mx-5"><a href="#platform-<?php echo $platform['id'] ?>" class="text-white">Compétences : <?php echo $platform['name'] ?></a></li>
                <?php endforeach; ?>
            </ul>
        </li>
    </ul>
    <ul class="nav flex-column">
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/chat_light.svg" height="36" width="36" alt="chats">
            <a href="<?php echo ROOT_PATH ?>/chats" class="nav-link display-6 font-weight-bold m-2 text-white">Messages</a>
        </li>
        <li class="nav-item d-flex align-items-center w-100 my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/home_light.svg" height="36" width="36" alt="home">
            <a href="<?php echo ROOT_PATH ?>/" class="nav-link display-6 font-weight-bold m-2 text-white">Accueil</a>
        </li>
    </ul>
</nav>