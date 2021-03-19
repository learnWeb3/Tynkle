<div class="card m-4 col-12 col-lg-3">
    <div class="avatar shadow-sm bg-white my-2 mx-auto">
        <i class="lni lni-user lni-64"></i>
    </div>
    <div class="card-body">
        <p class="card-title font-weight-bold text-center">
            <a class="font-italic m-2 stretched-link"
                href="<?php echo ROOT_PATH . "/users/" . $user['id'] ?>">
                <?php echo $user['username'] ?></a>
        </p>

        <p class="font-weight-bold m-2 text-center"><span id="followers_count"><?php echo $user['follower_count'] ?></span>
            abbonné(s) -
            <?php echo $user['followed_count'] ?> abbonnements </p>
        <div class="d-flex align-items-center justify-content-center">
            <div class="rating m-2"
                data-rate-value='<?php echo $user['reviews_score'] ? $user['reviews_score'] : '0' ?>'>
            </div>
            <p class="font-weight-bold m-2">
                <?php echo $user['reviews_score'] ? $user['reviews_score'] : '0' ?>/5</p>
        </div>

    </div>
</div>