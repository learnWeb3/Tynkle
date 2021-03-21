<main class="bg-background row flex-row-reverse w-100"
    style='background-image: url(<?php echo $background_image_path ?>);min-height:94vh;padding-top:3rem;'>

    <?php include '_new_offer_modal.php'?>
    <?php include '_new_message_modal.php'?>
    <?php include '_warning_modal.php'?>

    <section id="map" data-lon="<?php echo $post['lon'] ?>" data-lat="<?php echo $post['lat'] ?>"
        class="col-12 col-lg-6 relative bg-white shadow-sm" style="height:94vh">

    </section>

    <section class="col-12 col-lg-6 relative bg-white shadow p-4 overflow-auto text-black" style='height:94vh;'>
        <h1 class="font-weight-bold text-start w-100 display-4 my-2" id="title"><?php echo $post['title'] ?></h1>
        <hr class="my-4">
        <div class="row w-100">
            <div class="col-12 col-xl-6">
                <div class="d-flex align-items-center justify-content-start my-2">
                    <i class="lni lni-tag lni-32"></i>
                    <p class="m-3 font-weight-bold" id="breakdown-type">
                        <?php echo $post['platform_name'] ?>-<?php echo $post['breakdown_category_name'] ?>
                    </p>
                </div>
                <div class="d-flex align-items-center justify-content-start my-2">
                    <i class="lni lni-euro lni-32"></i>
                    <p class="m-3 font-weight-bold" id="budget"><?php echo $post['budget'] ?>
                        &euro;</p>
                </div>
                <div class="d-flex align-items-center justify-content-start my-2">
                    <i class="lni lni-pointer lni-32"></i>
                    <p class="m-3 font-weight-bold" id='location'><?php echo $post['city'] ?>
                        <?php echo $post['postal_code'] ?></p>
                </div>

            </div>
            <div class="col-12 col-xl-6">
                <div>
                    <div class="row w-100">
                        <div class="col-4 d-flex flex-column justify-content-center">
                            <div class="avatar shadow-sm bg-white my-2">
                                <i class="lni lni-user lni-64"></i>
                            </div>
                        </div>
                        <div class="col-8 d-flex flex-column justify-content-center">
                            <a class="font-italic m-2"
                                href="<?php echo ROOT_PATH . "/users/" . $post['user_id'] ?>"><?php echo $post['username'] ?></a>
                            <p class="m-2"><?php echo $author['posts_count'] ?> annonces -
                                <?php echo $author['offers_count'] ?> offres</p>
                            <div class="d-flex w-100 align-items-center">
                                <div class="rating"
                                    data-rate-value='<?php echo $author['reviews_score'] ? $author['reviews_score'] : '0' ?>'>
                                </div>
                                <p class="m-2">
                                    <?php echo $author['reviews_score'] ? $author['reviews_score'] : '0' ?>/5</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr class="my-4">
        <div class="row w-100">
            <div class="col-12">
                <h4 class="my-2 font-weight-bold text-black">Description: </h4>
                <div class="p-4 rounded">
                    <p id="content"><?php echo $post['content'] ?></p>
                </div>
            </div>
        </div>
        <hr class="my-4">
        <div class="row w-100">
            <div class="col-12">
                <h4 class="font-weight-bold text-black">Images - screenshots :</h4>
                <ul id="lightgallery" style="padding-left: 0;">
                    <?php foreach ($post['images'] as $image_url): ?>
                    <li data-src="<?php echo $image_url ?>"
                        data-sub-html="<h4>Fading Light</h4><p>Classic view from Rigwood Jetty on Coniston Water an old archive shot similar to an old post but a little later on.</p>"
                        data-pinterest-text="Pin it" data-tweet-text="share on twitter ">
                        <a href="">
                            <div class="demo-gallery-poster">
                                <img src="<?php echo $image_url ?>">
                            </div>
                        </a>
                    </li>
                    <?php endforeach;?>
                </ul>
            </div>
        </div>
        <?php if ($current_user): ?>
        <hr class="my-4">
        <div class="row w-100">
            <div class="col-12 align-items-center justify-content-between flex-wrap my-2">
                <div class="row my-2">
                    <h2 class="font-weight-bold text-center text-black">Cette annonce vous interesse ?</h2>
                </div>
                <div class="row d-flex justify-content-around">
                    <button type="button" class="btn btn-lg btn-red-crayola col-12 col-lg-3 m-2" data-bs-toggle="modal"
                        data-bs-target="#new-offer">
                        FAIRE UNE OFFRE
                    </button>
                    <button class=" btn btn-lg btn-outline-red-crayola active col-12 col-lg-3 m-2"
                        data-bs-toggle="modal" data-bs-target="#new-message">POSER UNE QUESTION</button>
                    <?php if ($current_user === $post["user_id"]): ?>
                    <a class="btn btn-lg btn-primary col-12 col-lg-3 m-2"
                        href="<?php echo ROOT_PATH . '/posts/' . $post['id'] . '/edit' ?>">EDITER</a>
                    <?php endif;?>
                </div>
            </div>
        </div>
        <?php else: ?>
        <hr class="my-4">
        <div class="row w-100">
            <div class="col-12 my-2">
                <div class="row my-2">
                    <h2 class="font-weight-bold text-center text-black">Cette annonce vous interesse ?</h2>
                </div>
                <div class="row my-2 d-flex align-items-center justify-content-center flex-wrap ">
                    <a href="<?php echo ROOT_PATH ?>/signin" class="btn btn-lg btn-primary col-12 col-lg-3 m-2">
                        CONNEXION
                    </a>
                    <a href="<?php echo ROOT_PATH ?>/register" class="btn btn-lg btn-primary col-12 col-lg-3 m-2">
                        INSCRIPTION
                    </a>
                </div>
            </div>
        </div>

        <?php endif;?>
        <hr class="my-4">
        <div class="row w-100">
            <div class="col-12 align-items-center justify-content-between flex-wrap my-2">
                <div class="row my-2">
                    <h2 class="font-weight-bold text-center text-black">Vous pourriez être intéressé par :</h2>
                </div>
                <div class="card-columns col-12" id="posts-container">
                    <?php foreach ($similar_posts as $post): ?>
                    <?php include '_publication_card.php'?>
                    <?php endforeach;?>
                </div>
            </div>
        </div>
        <?php if ($current_user): ?>
        <div class="d-flex flex-column justify-content-center align-items-center my-2 col-12">
            <div class="row my-2">
                <h3 class="font-weight-bold my-2 text-center text-black">Signaler cette annonce
                    ?</h3>
            </div>
            <button type="button" class="btn btn-lg btn-primary m-2 col-9 col-lg-3" data-bs-toggle="modal"
                data-bs-target="#warning">
                SIGNALER
            </button>
        </div>
        <?php endif;?>
    </section>


</main>


<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/posts/post.js' ?>"></script>