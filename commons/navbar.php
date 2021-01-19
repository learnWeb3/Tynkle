<header class="fixed-top" style='z-index:1200'>
    <nav class="navbar bg-white px-2">
        <a class="navbar-brand font-weight-bold" href="#"><img src="./assets/icons/logo_tynkle.png" height="36" width="64" alt="Tynkle Logo">Tynkle</a>
        <ul class="navbar-nav d-flex flex-row justify-content-around  ml-auto" style='width:15%'>
            <?php if ($is_current_user_logged_in) : ?>
                <li class="nav-item"><a class='nav-link' href="">LES POSTS</a></li>
                <li class="nav-item"><a class='nav-link btn btn-md btn-danger' href="">Déconnexion</a></li>
            <?php else : ?>
                <li class="nav-item"><a class='nav-link' href="">Connexion</a></li>
                <li class="nav-item"><a class='nav-link' href="">Inscription</a></li>
            <?php endif; ?>
        </ul>
    </nav>
</header>