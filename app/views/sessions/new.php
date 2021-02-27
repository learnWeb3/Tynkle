<main class="d-flex flex-column justify-content-center bg-background" style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <section class="col-12 col-xl-4 d-flex flex-column align-items-center justify-content-center p-6 rounded-3 bg-white" id='sign-container'>
        <form action="<?php echo ROOT_PATH.'/login' ?>" class="w-100" method="post">
            <h1 class="font-weight-bold">De retour parmi nous ?</h1>

            <h5 class="my-4">Informations obligatoires *</h5>
            <div class="form-group my-2">
                <label for='login'>Adresse email ou pseudo *</label>
                <input type='text' name='login' id='login' class="form-control" placeholder="prenom-nom@email.com" required>
            </div>
            <div class="form-group my-2">
                <label for="password">Mot de passe *</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class='btn btn-lg btn-primary col-12 my-4'>CONNEXION</button>
            <p class="font-weight-bold text-center">ou</p>
        </form>
        <form class="col-12" action="<?php echo ROOT_PATH."/register/callback" ?>" method="get">
                <button type="submit" class="col-12 btn btn-lg d-flex align-items-center justify-content-center position-relative font-weight-bold my-2"><img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/google_brand.png" class="position-absolute mx-4" alt="signin with google" style='left:0;'>Se connecter avec google</button>
        </form>
        <?php include_once './app/views/templates/_shared_links.php'?>
    </section>
</main>