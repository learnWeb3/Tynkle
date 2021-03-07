<main class="d-flex flex-column justify-content-center bg-background" style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <section class="col-12 col-xl-4 d-flex flex-column align-items-center justify-content-center p-6 rounded-3 bg-white" id='sign-container'>
        <form action="<?php echo ROOT_PATH . '/users/password/reset' ?>" class="w-100 d-block overflow-auto" method="post">
            <h1 class="font-weight-bold">Mot de passe oublié</h1>
            <h5 class="my-4">Informations obligatoires *</h5>
            <div class="form-group my-2">
                <label for="email" style="cursor: help;" data-placement="top" data-toggle="tooltip" title="Veuillez saisir votre adresse mail">Adresse email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <small>En demandant la réinitialisation du mot de passe, un mail contenant un lien unique vous sera envoyé à l'adrese email spécifiée dans le champ ci dessous. Ce lien vous permettra de reinitilaiser votre mot de passe.</small>

            <button type="submit" class='btn btn-lg btn-success col-12 my-4'>ENVOYER</button>
        
        </form>
        <?php include_once './app/views/templates/_shared_links.php'?>
    </section>

</main>