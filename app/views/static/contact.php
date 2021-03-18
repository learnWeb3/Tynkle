<main style="background-image: url(<?php echo $background_image_path ?>);" class="bg-background">
    <section class="bg-white p-4" style="min-height: 100vh;">
        <div class="row col-12 h-100 flex-column-reverse flex-lg-row-reverse">
        <div class="col-12 col-lg-6 d-flex align-items-center justify-content-center flex-column">
            <h1 data-aos="zoom-in" data-aos-duration="1000" class="font-weight-bold" style="cursor: help;"
                data-placement="top" data-toggle="tooltip"
                title="Dans le cas ou ce formulaire ne fonctionnerai pas vous pouvez nous contacter à contact@tynkle.com">
                Nous contacter <a href="mailto:contact@tynkle.com">@</a></h1>
            <small class="my-2 font-weight-bold">* champs obligatoires</small>
            <form id="contact-form" data-aos="zoom-in" data-aos-duration="1000" action="#" method="post"
                class="col-12 col-lg-6">
                <div class="form-group my-2">
                    <label style="cursor: help;" data-placement="top" data-toggle="tooltip"
                        title="Veuillez entrer une adresse email valide" for="email">Adresse email * :</label>
                    <input id="email" name="email" type="text" class="form-control" placeholder="john.doe@email.com"
                        required>
                </div>
                <div class="form-group my-2">
                    <label for="firstname">Prénom * :</label>
                    <input id="firstname" name="firstname" type="text" class="form-control" placeholder="John" required>
                </div>
                <div class="form-group my-2">
                    <label for="lastname">Nom * :</label>
                    <input id="lastname" name="lastname" type="text" class="form-control" placeholder="Doe" required>
                </div>
                <div class="form-group my-2">
                    <label style="cursor: help;" data-placement="top" data-toggle="tooltip"
                        title="Pour quelle(s) raison(s) souhaitez vous nous contacter ?" for="subject">Sujet * :</label>
                    <input id="subject" name="subject" type="text" class="form-control"
                        placeholder="Demande de renseignement" required>
                </div>
                <div class="form-group my-2">
                    <label style="cursor: help;" data-placement="top" data-toggle="tooltip"
                        title="Décrivez ce pourquoi vous souhaitez nous contacter" for="message">Message * :</label>
                    <textarea id="message" name="message" class="form-control" required></textarea>
                </div>
                <button type="submit" class="btn btn-lg btn-success col-12 my-4">Envoyer</button>
            </form>
        </div>
        <div class="col-lg-6 d-flex align-items-center justify-content-center">
            <img data-aos="zoom-in" data-aos-duration="1000"
                src="<?php echo ABSOLUTE_ASSET_PATH . "/img/commons/contact.svg" ?>" class="img-fluid"
                style="max-height: 25rem;" alt="">
        </div>
    </section>

</main>

<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/static/contact.js' ?> "></script>