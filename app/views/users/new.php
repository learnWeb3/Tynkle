<main class="d-flex flex-column justify-content-center bg-background" style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <section class="col-12 col-xl-4 d-flex flex-column align-items-center justify-content-center p-6 rounded-3 bg-white" id='sign-container'>
        <form action="<?php echo ROOT_PATH . '/users' ?>" class="w-100 d-block overflow-auto" method="post">
            <h1 class="font-weight-bold">Rejoindre Tynkle</h1>
            <h5 class="my-4">Informations obligatoires *</h5>
            <div class="form-group my-2">
                <label for="username" style="cursor: help;" data-placement="top" data-toggle="tooltip" title="Veuillez choisir un identifiant unique">Identifiant *</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Prenom94" required>
            </div>
            <div class="form-group my-2">
                <label for="email" style="cursor: help;" data-placement="top" data-toggle="tooltip" title="Veuillez entrer une adresse email valide">Adresse email *</label>
                <input type="email" id="email" name="email" class="form-control" placeholder="prenom-nom@email.com" required>
            </div>
            <div class="form-group my-2">
                <label for="password" style="cursor: help;" data-placement="top" data-toggle="tooltip" title="Veuillez choisir un mot de passe d'une logueur minimum de 6 caractères">Mot de passe *</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group my-2">
                <label for="password_confirmation" style="cursor: help;" data-placement="top" data-toggle="tooltip" title="Les mots de passe doivent être identiques">Confirmer le mot de passe *</label>
                <input type="password" id="password_confirmation" name="password_confirmation" class="form-control" data-bouncer-match="#password" data-bouncer-mismatch-message="Les mots de passes ne sont pas identiques" required>
            </div>

            <div class="form-group my-2 d-flex col-12">
                <div class="col-4">
                    <label class="font-weight-bold" style="cursor: help;" data-placement="top" data-toggle="tooltip" title="Souhaitez vous devenir dépanneur et aidez la communauté ?">Devenir Helper ?</label>
                </div>
                <div class="col-6">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="is_helper" id="helper_role_1" value="1">
                        <label class="form-check-label" for="helper_role_1">oui</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="is_helper" id="helper_role_2" value="0" checked>
                        <label class="form-check-label" for="helper_role_2">non</label>
                    </div>
                </div>
            </div>
            <button type="submit" class='btn btn-lg btn-success col-12 my-2'>INSCRIPTION</button>
            <p class="font-weight-bold text-center">ou</p>
        
        </form>
        <form class="w-100 d-block overflow-auto" action="<?php echo ROOT_PATH."/register/callback" ?>" method="get">
                <button type="submit" class="col-12 btn btn-lg btn-white d-flex align-items-center justify-content-center position-relative font-weight-bold my-2"><img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/google_brand.png" class="position-absolute mx-2" alt="signin with google" style='left:0;'>S'inscrire avec google</button>
        </form>
        <?php include_once './app/views/templates/_shared_links.php'?>
    </section>

</main>
<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/new_user.js' ?> "></script>