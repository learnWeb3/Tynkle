<main class="d-flex flex-column justify-content-center bg-signup" style='min-height:100vh;'>

    <section class="col-12 col-xl-4 offset-xl-1 d-flex align-items-center p-4 rounded-3 bg-white" id='sign-container'>
        <form action="<?php echo ROOT_PATH . '/users' ?>" class="w-100 d-block overflow-auto p-lg-4" method="post">
            <h1 class="font-weight-bold">Rejoindre Tynkle</h1>
            <h5 class="my-4">Informations obligatoires *</h5>
            <div class="form-group my-2">
                <label for="email">Identifiant *</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Prenom94">
            </div>
            <div class="form-group my-2">
                <label for="email">Adresse email *</label>
                <input type="email" id="email" name="email" class="form-control" placeholder="prenom-nom@email.com">
            </div>
            <div class="form-group my-2">
                <label for="password">Mot de passe *</label>
                <input type="password" class="form-control" name="password">
            </div>
            <div class="form-group my-2">
                <label for="password_confirmation">Confirmer le mot de passe *</label>
                <input type="password" id="password_confirmation" name="password_confirmation" class="form-control">
            </div>

            <div class="form-group my-2 d-flex col-12">
                <div class="col-4">
                    <label class="font-weight-bold">Devenir Helper ?</label>
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
            <a href="" class="col-12 btn btn-lg btn-white d-flex align-items-center justify-content-center position-relative font-weight-bold my-2"><img src="./assets/icons/google_brand.png" class="position-absolute mx-2" alt="signin with google" style='left:0;'>S'inscrire avec google</a>

            <?php include_once './app/views/templates/_shared_links.php' ?>
        </form>
    </section>

</main>