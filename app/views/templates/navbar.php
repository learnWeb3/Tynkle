<header class="fixed-top" style='z-index:1200'>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" id="#navbar">
        <div class="container-fluid">
            <a class="navbar-brand font-weight-bold" href="<?php echo ROOT_PATH . '/' ?>"><img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/logo_tynkle.png" height="36" width="64" alt="Tynkle Logo">Tynkle</a>
            <button class="navbar-toggler custom-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-lg-flex justify-content-end" id="navbarSupportedContent">
                <ul class="navbar-nav mb-2 mb-lg-0 p-4 p-md-0">
                    <?php if ($is_current_user_logged_in) : ?>
                        <li class="nav-item dropdown">
                            <a class="nav-link font-weight-bold dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Mon compte
                            </a>
                            <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarDarkDropdownMenuLink">
                                <li class="nav-item"><a class='nav-link font-weight-bold' href="<?php echo ROOT_PATH . '/profile' ?>">Mon profil</a></li>
                                <li class="nav-item"><a class='nav-link font-weight-bold' href="<?php echo ROOT_PATH . '/activities' ?>">Mon activitée</a></li>
                                <li class="nav-item"><a class='nav-link font-weight-bold' href="<?php echo ROOT_PATH . '/chats' ?>">Mes messages</a></li>
                                <?php if ($is_user_admin):?>
                                <li class="nav-item"><a class='nav-link font-weight-bold' href="<?php echo ROOT_PATH . '/admin/insights' ?>">Administration</a></li>
                                <?php endif; ?>
                            </ul>
                        </li>
                        <li class="nav-item"><a class='nav-link font-weight-bold' href="<?php echo ROOT_PATH . '/posts/new' ?>">Publier</a></li>
                        <li class="nav-item"><a class='nav-link font-weight-bold' href="<?php echo ROOT_PATH . '/posts' ?>">Les annonces</a></li>
                        <li class="nav-item"><a class='nav-link text-danger font-weight-bold' id='logout' href="<?php echo ROOT_PATH . '/logout' ?>">Déconnexion</a></li>
                    <?php else : ?>
                        <li class="nav-item"><a class='nav-link' href="<?php echo ROOT_PATH . '/signin' ?>">Connexion</a></li>
                        <li class="nav-item"><a class='nav-link' href="<?php echo ROOT_PATH . '/register' ?>">Inscription</a></li>
                    <?php endif; ?>
                </ul>
            </div>
        </div>
    </nav>
</header>