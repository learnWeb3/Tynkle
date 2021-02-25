<main style="background-image: url(<?php echo $background_image_path ?>);" class="bg-background">
    <?php include '_submenu.php'?>
    <section>
        <div class="row w-100">

            <div data-aos="zoom-in" data-aos-duration="1000"  class="col-12 col-lg-6 d-flex flex-column justify-content-center">
                <h1><b>Tynkle,</b> LA première plateforme exclusivement dédiée à l'entraide
                    informatique et multimédia
                </h1>
                <a data-aos="fade-up"  data-aos-duration="1000" href="<?php echo ROOT_PATH . "/posts" ?>"
                    class="btn btn-lg btn-yellow-tynkle my-4 col-9 col-lg-4">VOIR LES ANNONCES</a>
            </div>
            <div class="d-none d-lg-block col-lg-6">

                <img  data-aos="fade-right"  data-aos-duration="1000"  class="img-fluid"
                    src="<?php echo ABSOLUTE_ASSET_PATH . "/img/commons/repair.svg" ?>" alt="">

            </div>

        </div>
        </div>
    </section>
    <section>
        <h2 data-aos="fade-up"  data-aos-duration="1000" class="display-5 text-center">Réparer plutot que jeter !</h2>

        <div class="row w-100 d-flex align-items-center justify-content-around my-4">
            <div data-aos="flip-left" data-aos-duration="1000" class="icon-card">
                <div class="icon-circle"><i class="fa-5x fab fa-envira"></i></div>
                <p class="font-weight-bold my-2">Ecologique</p>
            </div>
            <div data-aos="flip-left" data-aos-duration="1000" class="icon-card">
                <div class="icon-circle"><i class="fa-5x fas fa-euro-sign"></i></div>
                <p class="font-weight-bold my-2">Budget Maîtrisé</p>
            </div>
            <div data-aos="flip-left" data-aos-duration="1000" class="icon-card">
                <div class="icon-circle"><i class="fa-5x fas fa-shipping-fast"></i></div>
                <p class="font-weight-bold my-2">Intervention Rapide</p>
            </div>
            <div data-aos="flip-left" data-aos-duration="1000" class="icon-card">
                <div class="icon-circle"><i class="fa-5x fas fa-users"></i></div>
                <p class="font-weight-bold my-2">Large Choix</p>
            </div>
        </div>
        <img class="wave-separator" src="<?php echo ABSOLUTE_ASSET_PATH . "/img/commons/wave_separator.png" ?>"
            alt="wave separator">

    </section>
    <section>
        <div class="row w-100">
            <div data-aos="zoom-in" data-aos-duration="1000"  class="col-12 col-lg-6 d-flex flex-column justify-content-center">
                <h2  class="display-5"><b>Tynkle,</b> un moyen simple de trouver des spécialistes</h2>
                <p class="font-weight-bold my-4">Un appareil qui fait des siennes et une solution à portée de main en
                    quelques
                    clics <br>
                    Trouver rapidement la solution à votre problème grâce à une intervention à distance ou sur le lieu
                    de
                    votre choix <br>
                    Tout est possible ! dépannage, installation, formation, à vous de choisir !
                </p>
                <button data-aos="fade-up"  data-aos-duration="1000" class="btn btn-lg btn-yellow-tynkle my-4 col-12 col-lg-4">
                    C'est parti !
                </button>
            </div>
            <div class="d-none d-lg-block col-lg-6">

                <img data-aos="fade-right"  data-aos-duration="1000" class="img-fluid" src="<?php echo ABSOLUTE_ASSET_PATH . "/img/commons/collaboration.svg" ?>"
                    alt="">

            </div>
        </div>
    </section>
    <section>
        <h2 data-aos="fade-up"  data-aos-duration="1000" class="display-5 text-center">Comment ça marche ? <br> Ton problème, notre solution.</h2>
        <div class="row w-100 d-flex align-items-center justify-content-around my-4">
            <div data-aos="flip-left"  data-aos-duration="1000" class="icon-card">
                <div class="icon-circle"><i class="fa-5x fas fa-phone-volume"></i></div>
                <p class="font-weight-bold my-2">Contact des Helpers</p>
            </div>
            <div data-aos="flip-left"  data-aos-duration="1000" class="icon-card">
                <div class="icon-circle"><i class="fa-5x far fa-lightbulb"></i></div>
                <p class="font-weight-bold my-2">Trouve ta solution</p>
            </div>
            <div data-aos="flip-left"  data-aos-duration="1000" class="icon-card">
                <div class="icon-circle"><i class="fa-5x far fa-star"></i></div>
                <p class="font-weight-bold my-2">Note ton intervention</p>
            </div>
        </div>
        <div class="row w-100 d-flex align-items-center justify-content-center">

            <h3 data-aos="fade-up"  data-aos-duration="1000" class="text-center font-weight-bold">Tu as besoin d'aide ? <br> Il te suffit de contacter des Helpers ou
                de poster une annonce <br></h3>

        </div>
        <img class="wave-separator" src="<?php echo ABSOLUTE_ASSET_PATH . "/img/commons/wave_separator.png" ?>"
            alt="wave separator">

    </section>

    <section>
        <h2 data-aos="fade-up"  data-aos-duration="1000" class="display-5 text-center">Ils ont fait confiance à <b>Tynkle</b></h2>
        <div class="row w-100 d-flex align-items-center justify-content-around my-4">

            <?php for ($i = 0; $i < 4; $i++): ?>

            <?php include '_testimony_card.php'?>

            <?php endfor;?>


        </div>
        <button data-aos="fade-up"  data-aos-duration="1000" class="btn btn-lg btn-yellow-tynkle my-4 col-9 col-lg-3">
            faire comme Ben
        </button>
    </section>
    <section>
        <h2 data-aos="fade-up"  data-aos-duration="1000" class="display-5 text-center">Tu veux aider la communauté ? <br>Deviens Helper !</h2>
        <div class="row w-100 d-flex align-items-center justify-content-around my-4">

            <div data-aos="flip-left"  data-aos-duration="1000" class="icon-card">
                <div class="icon-circle"><i class="fa-5x fas fa-search-location"></i></div>
                <p class="font-weight-bold my-2">Trouve des missions autour de chez toi</p>
            </div>
            <div data-aos="flip-left"  data-aos-duration="1000" class="icon-card">
                <div class="icon-circle"><i class="fa-5x fas fa-coins"></i></div>
                <p class="font-weight-bold my-2">Diversifie tes revenus</p>
            </div>
            <div data-aos="flip-left"  data-aos-duration="1000" class="icon-card">
                <div class="icon-circle"><i class="fa-5x fas fa-globe-americas"></i></div>
                <p class="font-weight-bold my-2">Travaille ou tu veux et quand tu veux</p>
            </div>
            <div data-aos="flip-left"  data-aos-duration="1000" class="icon-card">
                <div class="icon-circle"><i class="fa-5x fas fa-users"></i></div>
                <p class="font-weight-bold my-2">Fais partis d'une communauté de passionnés</p>
            </div>

        </div>
        <div class="row w-100 d-flex align-items-center justify-content-center">

            <h3 data-aos="fade-up"  data-aos-duration="1000" class="text-center font-weight-bold">En tant que dépanneur je peux répondre à une demande, <br>
                consulter
                les annonces en cours, <br> proposer mes services aux personnes qui en ont besoin</h3>

        </div>
        <img class="wave-separator" src="<?php echo ABSOLUTE_ASSET_PATH . "/img/commons/wave_separator_dark.png" ?>"
            alt="wave separator">

    </section>
</main>