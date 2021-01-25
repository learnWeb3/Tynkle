<main class="d-flex bg-brand-blue" style='min-height:100vh;'>=
    <nav class="d-none col-xl-3 d-xl-flex flex-column justify-content-around p-4 fixed-bottom" style="height:100vh" id="menu-navigation">
        <ul class="nav flex-column w-100">
            <li class="nav-item d-flex align-items-center w-100 my-2">
                <img src="./assets/icons/message_light.svg" height="36" width="36" alt="my chats">
                <a class="nav-link active display-6 m-2 text-white font-weight-bold" href="<?php echo ROOT_PATH.'/chats' ?>">Mes messages</a>
            </li>
            <li class="nav-item d-flex align-items-center w-100 my-2">
                <img src="./assets/icons/account_light.svg" height="36" width="36" alt="account informations">
                <a class="nav-link active display-6 m-2 text-white font-weight-bold" href="<?php echo ROOT_PATH.'/profile' ?>">Mon profil</a>
            </li>
        </ul>
        <ul class="nav flex-column w-100">
            <li class="nav-item d-flex align-items-center w-100 my-2">
                <img src="./assets/icons/home_light.svg" height="36" width="36" alt="home">
                <a class="nav-link active display-6 m-2 text-white font-weight-bold" href="<?php echo ROOT_PATH.'/' ?>">Accueil</a>
            </li>
        </ul>
    </nav>
    <section class="col-12 col-xl-8 offset-xl-3 d-block overflow-auto bg-white p-4 position-absolute" style="height:95vh; margin-top:3rem;left:0">
        <?php foreach ($chats as $index=>$chat) : ?>
            <?php include './app/views/chats/_chat.php' ?>
        <?php endforeach; ?>
    </section>
</main>