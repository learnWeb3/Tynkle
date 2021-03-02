<main class="d-flex flex-column justify-content-center bg-background" style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <section class="col-12 col-xl-4 d-flex flex-column align-items-center justify-content-center p-6 rounded-3 bg-white" id='sign-container'>
        <form action="<?php echo ROOT_PATH . '/users/'.$user_id.'/reset-password' ?>" class="w-100 d-block overflow-auto" method="post">
            <h1 class="font-weight-bold">Réinitialisation du mot de passe</h1>
            <h5 class="my-4">Informations obligatoires *</h5>
            <div class="form-group my-2">
                <label for="password" style="cursor: help;" data-placement="top" data-toggle="tooltip" title="Veuillez choisir un mot de passe d'une logueur minimum de 6 caractères">Entrez un mot de passe</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group my-2">
                <label for="password_confirmation" style="cursor: help;" data-placement="top" data-toggle="tooltip" title="Les mots de passe doivent être identiques">Confirmer le mot de passe *</label>
                <input type="password" id="password_confirmation" name="password_confirmation" class="form-control" data-bouncer-match="#password" data-bouncer-mismatch-message="Les mots de passes ne sont pas identiques" required>
            </div>

            <input type="hidden" name="user_id" value="<?php echo $user_id ?>">
            <input type="hidden" name="reset_password_token" value="<?php echo $reset_password_token ?>">

            <button type="submit" class='btn btn-lg btn-success col-12 my-4'>VALIDER</button>
        
        </form>
        <?php include_once './app/views/templates/_shared_links.php'?>
    </section>

</main>