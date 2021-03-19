<main>
    <section class="d-none col-xl-3 d-xl-flex flex-column p-4 fixed-bottom" style="height:100vh;"
            id="menu-navigation">
            <div class="container bg-white w-100 shadow p-4 d-block overflow-auto" style="margin-top: 15%;">
                <h4 class="font-weight-bold">Rechercher une annonce:</h4>
                <hr>
                <form action="" method="GET" class="bg-white">
                    <div class="d-flex w-100 align-items-center">
                        <i class="lni lni-search-alt lni-32 text-dark"></i>
                        <h5 class="m-2 font-weight-bold text-dark">Rechercher par type d'appareil : </h5>
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
                        <i class="lni lni-pointer lni-32 text-dark"></i>
                        <h5 class="m-2 font-weight-bold text-dark">Chercher autour de moi</h5>
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
                    <i class="lni lni-arrow-left lni-32 text-dark"></i>
                    <h5 class="m-2"><a class="text-dark font-weight-bold" href="<?php echo ROOT_PATH.'/posts' ?>">Voir les annonces</a></h5>
                </div>
            </div>

        </section>
    <div id="map"></div>
</main>
<script>
const posts = <?php echo $posts; ?>
</script>
<script src="https://api.mapbox.com/mapbox-gl-js/v2.1.1/mapbox-gl.js"></script>
<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/admin/map_posts.js' ?> "></script>