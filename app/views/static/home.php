<main style="background-image: url(<?php echo $background_image_path ?>);" class="bg-background">
    <section id="value-proposition" style="min-height:66vh;">
        <div class="row w-100 p-4" style="min-height:66vh;background-color:rgba(51,51,51,.5)">
            <div data-aos="zoom-in" data-aos-duration="1000"
                class="container-xl d-flex justify-content-center align-items-center">
                <div class="col-12 col-lg-8">
                    <h1 class="text-white font-weight-bold display-4"><b>Tynkle,</b> LA première plateforme
                        exclusivement dédiée à l'entraide
                        informatique, multimédia et électroménager
                    </h1>
                    <h2 class="text-white font-weight-bold my-4">Au sein de la communauté vous pouvez obtenir de l'aide
                        et/ou partager vos services, pour cela il suffit de remplir vos compétences</h2>
                    <?php include '_search_bar.php' ?>
                </div>
            </div>
        </div>
    </section>
    <section class="bg-light">
        <div class="container d-flex flex-column justify-content-center align-items-center">

            <h2 class="display-5 text-dark">Dernières annonces</h2>

            <div data-aos="zoom-in" data-aos-duration="1000" class="card-columns w-100 p-4">
                <?php foreach ($posts as $post): ?>

                <?php include __DIR__.'/../posts/_publication_card.php'?>

                <?php endforeach;?>
            </div>

            <a href="<?php echo ROOT_PATH . "/posts" ?>" data-aos="fade-up" data-aos-duration="1000"
                class="text-center my-4 col-9 col-lg-3 text-dark">
                VOIR LES ANNONCES
                <i class="lni lni-arrow-right"></i>
            </a>

        </div>
    </section>
    <section class="bg-white">

        <div class="container d-flex flex-column justify-content-center align-items-center">
            <div class="pb-lg-4">
                <h2 class="mb-5 display-5 text-center text-dark aos-init aos-animate">Réparer plutot que jeter !</h2>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
                    <div class="px-0 pr-lg-4  d-flex align-items-center justify-content-center text-center" data-aos="flip-left" data-aos-duration="1000">
                        <div class="icon-rounded mb-3 bg-primary-light">
                            <i class="lni lni-32 lni-trees"></i>
                        </div>
                        <h3 class="h6 text-uppercase">Ecologique</h3>
                        <p class="text-muted text-sm">Contribuer à réduire l'impact de l'homme sur l'environnement</p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
                    <div class="px-0 pr-lg-4  d-flex align-items-center justify-content-center text-center" data-aos="flip-left" data-aos-duration="1000">
                        <div class="icon-rounded mb-3 bg-secondary-light">
                            <i class="lni lni-32 lni-euro"></i>
                        </div>
                        <h3 class="h6 text-uppercase">Budget maitrisé</h3>
                        <p class="text-muted text-sm">Faîtes des économies en réparant vos appareils</p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
                    <div class="px-0 pr-lg-4  d-flex align-items-center justify-content-center text-center" data-aos="flip-left" data-aos-duration="1000">
                        <div class="icon-rounded mb-3 bg-primary-light">
                            <i class="lni lni-32 lni-alarm-clock"></i>
                        </div>
                        <h3 class="h6 text-uppercase">Intervention Rapide</h3>
                        <p class="text-muted text-sm">Donnez rendez vous à vos voisins les plus proches</p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
                    <div class="px-0 pr-lg-4  d-flex align-items-center justify-content-center text-center" data-aos="flip-left" data-aos-duration="1000">
                        <div class="icon-rounded mb-3 bg-primary-light">
                            <i class="lni lni-32 lni-zoom-in"></i>
                        </div>
                        <h3 class="h6 text-uppercase">Large Choix</h3>
                        <p class="text-muted text-sm">Chosissez votre interlocuteur parmis une communautée en pleine
                            expansion</p>
                    </div>
                </div>
            </div>
            <a href="<?php echo ROOT_PATH . "/register" ?>" data-aos="fade-up" data-aos-duration="1000"
                class="text-center my-4 col-9 col-lg-3 font-weight-bold text-dark">
                C'est parti !
                <i class="lni lni-arrow-right"></i>
            </a>
        </div>

    </section>
    <section class="bg-light">
        <div class="container d-flex flex-column justify-content-center align-items-center">

            <h2 class="display-5 text-dark"><b>Tynkle,</b> un moyen simple de trouver des spécialistes</h2>
            <p class="font-weight-bold my-4">Un appareil qui fait des siennes et une solution à portée de main
                en
                quelques
                clics <br>
                Trouver rapidement la solution à votre problème grâce à une intervention à distance ou sur le
                lieu
                de
                votre choix <br>
                Tout est possible ! dépannage, installation, formation, à vous de choisir !
            </p>

            <div data-aos="zoom-in" data-aos-duration="1000"
                class="card-columns w-100 p-4">
                <?php foreach ($users as $user): ?>

                <?php include __DIR__.'/_user_card.php'?>

                <?php endforeach;?>
            </div>

            <a href="<?php echo ROOT_PATH . "/users" ?>" data-aos="fade-up" data-aos-duration="1000"
                class="text-center my-4 col-9 col-lg-3 font-weight-bold text-dark">
                Je trouve un dépanneur !
                <i class="lni lni-arrow-right"></i>
            </a>

        </div>
    </section>
    <section class="bg-white">

        <div class="container d-flex flex-column justify-content-center align-items-center">
            <div class="pb-lg-4">
                <h2 class="mb-5 display-5 text-center text-dark aos-init aos-animate">Comment ça marche ? Ton
                    problème, notre solution.</h2>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
                    <div class="px-0 pr-lg-4  d-flex align-items-center justify-content-center text-center" data-aos="flip-left" data-aos-duration="1000">
                        <div class="icon-rounded mb-3 bg-primary-light">
                            <i class="lni lni-32 lni-trees"></i>
                        </div>
                        <h3 class="h6 text-uppercase">Contact des Helpers</h3>
                        <p class="text-muted text-sm">Contribuer à réduire l'impact de l'homme sur l'environnement</p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
                    <div class="px-0 pr-lg-4  d-flex align-items-center justify-content-center text-center" data-aos="flip-left" data-aos-duration="1000">
                        <div class="icon-rounded mb-3 bg-secondary-light">
                            <i class="lni lni-32 lni-euro"></i>
                        </div>
                        <h3 class="h6 text-uppercase">Trouve ta solution</h3>
                        <p class="text-muted text-sm">Faîtes des économies en réparant vos appareils</p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
                    <div class="px-0 pr-lg-4  d-flex align-items-center justify-content-center text-center" data-aos="flip-left" data-aos-duration="1000">
                        <div class="icon-rounded mb-3 bg-primary-light">
                            <i class="lni lni-32 lni-alarm-clock"></i>
                        </div>
                        <h3 class="h6 text-uppercase">Note ton intervention</h3>
                        <p class="text-muted text-sm">Donnez rendez vous à vos voisins les plus proches</p>
                    </div>
                </div>
            </div>
            <a href="<?php echo ROOT_PATH . "/register" ?>" data-aos="fade-up" data-aos-duration="1000"
                class="text-center my-4 col-9 col-lg-3 font-weight-bold text-dark">
                C'est parti !
                <i class="lni lni-arrow-right"></i>
            </a>
        </div>



    </section>

    <section class="bg-light">
        <div class="container d-flex flex-column justify-content-center align-items-center">
            <h2 data-aos="fade-up" data-aos-duration="1000" class="display-5 text-center text-dark">Ils ont fait
                confiance à
                <b>Tynkle</b>
            </h2>

            <div data-aos="zoom-in" data-aos-duration="1000"
                class="row d-flex justify-content-center align-items-center w-100 p-4">
                <?php for ($i = 0; $i < 3; $i++): ?>

                <?php include '_testimony_card.php'?>

                <?php endfor;?>
            </div>

            <a href="<?php echo ROOT_PATH . "/register" ?>" data-aos="fade-up" data-aos-duration="1000"
                class="text-center my-4 col-9 col-lg-3 font-weight-bold text-dark">
                faire comme Ben
                <i class="lni lni-arrow-right"></i>
            </a>
        </div>
    </section>
    <section class="bg-white">

        <div class="container d-flex flex-column justify-content-center align-items-center">
            <div class="pb-lg-4">
                <h2 class="mb-5 display-5 text-center text-dark aos-init aos-animate">Tu veux aider la communauté ?
                    Deviens Helper !</h2>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
                    <div class="px-0 pr-lg-4  d-flex align-items-center justify-content-center text-center" data-aos="flip-left" data-aos-duration="1000">
                        <div class="icon-rounded mb-3 bg-primary-light">
                            <i class="lni lni-32 lni-search-alt"></i>
                        </div>
                        <h3 class="h6 text-uppercase">Trouve des missions autour de chez toi</h3>
                        <p class="text-muted text-sm">Contribuer à réduire l'impact de l'homme sur l'environnement</p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
                    <div class="px-0 pr-lg-4  d-flex align-items-center justify-content-center text-center" data-aos="flip-left" data-aos-duration="1000">
                        <div class="icon-rounded mb-3 bg-secondary-light">
                            <i class="lni lni-32 lni-euro"></i>
                        </div>
                        <h3 class="h6 text-uppercase">Diversifie tes revenus</h3>
                        <p class="text-muted text-sm">Faîtes des économies en réparant vos appareils</p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
                    <div class="px-0 pr-lg-4 d-flex align-items-center justify-content-center text-center  d-flex align-items-center justify-content-center text-center" data-aos="flip-left" data-aos-duration="1000">
                        <div class="icon-rounded mb-3 bg-primary-light">
                            <i class="lni lni-32 lni-direction"></i>
                        </div>
                        <h3 class="h6 text-uppercase">Travaille ou tu veux et quand tu veux</h3>
                        <p class="text-muted text-sm">Donnez rendez vous à vos voisins les plus proches</p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
                    <div class="px-0 pr-lg-4 d-flex align-items-center justify-content-center text-center" data-aos="flip-left" data-aos-duration="1000">
                        <div class="icon-rounded mb-3 bg-primary-light">
                            <i class="lni lni-32 lni-users"></i>
                        </div>
                        <h3 class="h6 text-uppercase">Fais partis d'une communauté de passionnés</h3>
                        <p class="text-muted text-sm">Donnez rendez vous à vos voisins les plus proches</p>
                    </div>
                </div>
            </div>
            <a href="<?php echo ROOT_PATH . "/register" ?>" data-aos="fade-up" data-aos-duration="1000"
                class="text-center my-4 col-9 col-lg-3 font-weight-bold text-dark">
                C'est parti !
                <i class="lni lni-arrow-right"></i>
            </a>

        </div>

    </section>
</main>


<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/static/home.js' ?>"></script>