<main class="d-flex bg-light"
    style='min-height:100vh;margin-top:3rem;'>
    <div class='bg-background d-flex' style="min-height: 100vh;width:100vw">
        <section class="d-none col-xl-3 d-xl-flex flex-column p-4 fixed-bottom" style="height:100vh;"
            id="menu-navigation">
            <div class="container bg-white w-100 shadow p-4 d-block overflow-auto" style="margin-top: 15%;">
                <h4 class="font-weight-bold">Rechercher une annonce:</h4>
                <hr>
                <form action="" method="GET" class="bg-white">
                <div class="d-flex w-100 align-items-center">
                        <i class="lni lni-search-alt lni-32"></i>
                        <h5 class="m-2 font-weight-bold">Rechercher par type d'appareil : </h5>
                    </div>
                    <div class='d-block overflow-auto px-2'>
                        <div class="form-group my-2">
                            <label for="id_platform" class='font-weight-bold'> 1 - Selectionner une catégorie : </label>
                            <select name="id_platform" id="id_platform" class="form-control col-12">
                                <option value="0">Toutes</option>
                                <?php foreach ($platforms as $platform): ?>
                                <option value="<?php echo $platform['id'] ?>"> <?php echo $platform['name'] ?></option>
                                <?php endforeach;?>
                            </select>
                        </div>
                    </div>

                </form>
                <hr>
                <form action="" class="bg-white overflow-auto px-2" method="GET">
                    <p class="font-weight-bold mb-0">2 - Choisir un/plusieurs type de panne : </p>
                    <div class='d-block overflow-auto px-2' style="height:15vh" id="breakdown_categories">
                        <p class="my-2">Veuillez selectionner une plateforme</p>
                    </div>
                </form>
                <hr>
                <form action="" method="GET" class="col-12 bg-white">
                    <div class="d-flex w-100 align-items-center">
                        <i class="lni lni-pointer lni-32"></i>
                        <h5 class="m-2 font-weight-bold">Chercher autour de moi</h5>
                    </div>
                    <div class="form-group my-2">
                        <select name="search_radius" id="search_radius" class="form-control col-12">
                            <option value="10">10 km</option>
                            <option value="25">25 km</option>
                            <option value="50">50 km</option>
                            <option value="100">100 km</option>
                            <option value="150">150 km</option>
                            <option value="200">200 km</option>
                            <option value="250">250 km</option>
                            <option value="500">500 km</option>
                        </select>
                    </div>
                    <button class="btn btn-primary mt-2 mb-4" id="geosearch">FILTRER MA RECHERCHE</button>
                </form>
                <hr>
                <div class="d-flex w-100 align-items-center">
                    <i class="lni lni-map lni-32"></i>
                    <h5 class="m-2 font-weight-bold"><a href="<?php echo ROOT_PATH . '/admin/posts' ?>">Voir la
                            carte</a></h5>
                </div>
            </div>

        </section>


        <section class="col-12 col-xl-8 offset-xl-3 d-flex flex-column justify-content-center align-items-center">
            <div class="card-columns col-12 p-4" id="posts-container"
                data-nextpage="<?php echo $next_page ?>">
                <?php foreach ($posts as $post): ?>
                <?php include '_publication_card.php'?>
                <?php endforeach;?>
            </div>
        </section>

    </div>

</main>

<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/posts/posts.js' ?> "></script>