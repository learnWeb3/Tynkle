<div class="col-12 col-xl-6 m-4">
    <div class="card shadow-sm p-4 rounded">
        <div class="row w-100">
            <div class="col-12 col-xl-6 d-flex flex-column justify-content-center">
                <div class="avatar shadow-sm bg-white my-2">
                    <i class="lni lni-user lni-64"></i>
                </div>
                <a class=" font-italic m-2 stretched-link" href="<?php echo ROOT_PATH . "/users/" . $user['id_followed'] ?>"> <?php echo $user['followed_username'] ?></a>
            </div>
            <div class="col-12 col-xl-6 d-flex flex-column justify-content-center">
                <p class=" m-2"><?php echo $user['posts_count'] ?> annonces -
                    <?php echo $user['offers_count'] ?> offres</p>
                <div class="row">
                    <div class="col-12 d-flex align-items-center">
                        <div class="rating m-2"
                            data-rate-value='<?php echo $user['reviews_score'] ? $user['reviews_score'] : '0' ?>'>
                        </div>
                        <p class=" m-2">
                            <?php echo $user['reviews_score'] ? $user['reviews_score'] : '0' ?>/5</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 d-flex align-items-center">
                        <i class="lni lni-calendar lni-16"></i>
                        <small class="m-2 mb-0">Inscrit le <?php echo $user['created_at']?></small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>