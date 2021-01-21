<main class="d-flex bg-map" style='min-height:100vh;margin-top:3rem;'>
    <div class='bg-brand-blue d-flex' style="min-height: 100vh;width:100vw">
        <section class="d-none col-xl-3 d-xl-flex flex-column p-4 fixed-bottom" style="height:100vh;" id="menu-navigation">

            <div class="container bg-white w-100 shadow p-4" style="margin-top: 15%;">
                <h4 class="font-weight-bold">Rechercher une annonce:</h4>
                <hr>
                <form action="" method="GET" class="bg-light">
                    <h5 class="font-weight-bold">Rechercher par type d'appareil : </h5>

                    <div class='d-block overflow-auto px-2' style="height:15vh">
                        <?php foreach ($platforms as $platform) : ?>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="<?php echo htmlspecialchars($platform['id']) ?>" id="platform-<?php echo htmlspecialchars($platform['id']) ?>">
                                <label class="form-check-label" for="platform-<?php echo htmlspecialchars($platform['id']) ?>">
                                    <?php echo htmlspecialchars($platform['name']) ?>
                                </label>
                            </div>
                        <?php endforeach; ?>
                    </div>

                </form>
                <hr>
                <form action="" class="bg-light overflow-auto px-2" method="GET">
                    <h5 class="font-weight-bold">Rechercher par type de panne : </h5>
                    <div class='d-block overflow-auto px-2' style="height:15vh">
                        <?php foreach ($breakdown_categories as $breakdown_category) : ?>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="<?php echo htmlspecialchars($breakdown_category['id']) ?>" id="breakdown_category-<?php echo htmlspecialchars($breakdown_category['id']) ?>">
                                <label class="form-check-label" for="breakdown_category-<?php echo htmlspecialchars($breakdown_category['id']) ?>">
                                    <?php echo htmlspecialchars($breakdown_category['name']) ?>
                                </label>
                            </div>
                        <?php endforeach; ?>
                    </div>

                </form>
                <hr>
                <form action="" method="POST" class="col-12 bg-light">
                    <div class="d-flex w-100 align-items-center">
                        <img src="./assets/img/commons/pointer.svg" height="24" width="24" alt="map pointer">
                        <h5 class="m-2 font-weight-bold">Chercher autour de moi</h5>
                    </div>

                    <div class="form-group my-2">
                        <select name="search_radius" id="search_radius" class="col-12">
                            <option value="50">50 km</option>
                            <option value="100">100 km</option>
                            <option value="250">250 km</option>
                            <option value="500">500 km</option>
                        </select>
                    </div>
                </form>
            </div>

        </section>

        <section class="col-12 col-xl-8 offset-xl-3 bg-white d-flex flex-wrap" id="posts-container" data-nextpage="<?php echo $next_page ?>">
            <?php foreach ($posts as $post) : ?>
                <?php include '_publication_card.php' ?>
            <?php endforeach; ?>
        </section>

    </div>

</main>

<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/posts.js' ?> "></script>
