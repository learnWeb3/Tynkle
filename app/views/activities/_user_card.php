<div class="col-12 col-xl-6 m-4">
    <div class="card shadow-sm p-4 rounded">
        <div class="row w-100">
            <div class="col-12 col-xl-6 d-flex flex-column justify-content-center">
                <div id="avatar" class="shadow-sm bg-white my-4">
                    <i class="lni lni-user lni-64"></i>
                </div>
            </div>
            <div class="col-12 col-xl-6 d-flex flex-column justify-content-center">
                <a class="font-weight-bold font-italic m-2"
                    href="<?php echo ROOT_PATH . "/users/" . $user['id_followed'] ?>"><?php echo $user['followed_username'] ?></a>
                <p class="font-weight-bold m-2"><?php echo $user['posts_count'] ?> annonces -
                    <?php echo $user['offers_count'] ?> offres</p>
                <p class="font-weight-bold m-2"><span id="followers_count"><?php echo $user['follower_count'] ?></span>
                    abbonné(s) - <?php echo $user['followed_count'] ?> abbonnements </p>
                <div class="d-flex w-100 align-items-center">
                    <div class="rating m-2"
                        data-rate-value='<?php echo $user['reviews_score'] ? $user['reviews_score'] : '0' ?>'>
                    </div>
                    <p class="font-weight-bold m-2">
                        <?php echo $user['reviews_score'] ? $user['reviews_score'] : '0' ?>/5</p>
                </div>
            </div>
        </div>
    </div>
</div>