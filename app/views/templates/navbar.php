<header class="fixed-top" style='z-index:1200'>
    <nav class="navbar bg-white px-2" id="#navbar">
        <a class="navbar-brand font-weight-bold" href="<?php echo ROOT_PATH . '/' ?>"><img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/logo_tynkle.png" height="36" width="64" alt="Tynkle Logo">Tynkle</a>
        <ul class="navbar-nav d-flex flex-row justify-content-around  ml-auto" style='width:15%'>
            <?php if ($is_current_user_logged_in) : ?>
                <li class="nav-item"><a class='nav-link font-weight-bold' href="<?php echo ROOT_PATH . '/posts' ?>">LES POSTS</a></li>
                <li class="nav-item"><a class='nav-link text-danger font-weight-bold' id='logout' href="<?php echo ROOT_PATH.'/logout' ?>">DECONNEXION</a></li>
            <?php else : ?>
                <li class="nav-item"><a class='nav-link' href="<?php echo ROOT_PATH . '/signin' ?>">Connexion</a></li>
                <li class="nav-item"><a class='nav-link' href="<?php echo ROOT_PATH . '/register' ?>">Inscription</a></li>
            <?php endif; ?>
        </ul>
    </nav>
</header>