<div class="card my-4 col-lg-3">
    <div>
        <div class="avatar shadow-sm bg-white my-2 mx-auto">
            <i class="lni lni-user lni-64"></i>
        </div>
        <p class="card-title font-weight-bold text-center">
            <a class="font-italic m-2 stretched-link" href="<?php echo ROOT_PATH . "/users/" . $user['id'] ?>">
                <?php echo $user['username'] ?></a>
        </p>
    </div>
    <div class="card-body">
        <p class="font-weight-bold m-2 w-100"><span id="followers_count"><?php echo $user['follower_count'] ?></span>
            abonné(s) -
            <?php echo $user['followed_count'] ?> abonnements </p>
        <div class="d-flex align-items-center w-100">
            <i class="lni lni-pointer lni-16"></i>
            <p class="m-2"><?php echo $user['city'] ?>
                <?php echo $user['postal_code'] ?></p>
        </div>
        <div class="d-flex align-items-center w-100">
            <div class="rating"
                data-rate-value='<?php echo $user['reviews_score'] ? $user['reviews_score'] : '0' ?>'>
            </div>
            <p class="font-weight-bold m-2">
                <?php echo $user['reviews_score'] ? $user['reviews_score'] : '0' ?>/5</p>
        </div>
        <div class="row my-4">
            <a href="<?php echo ROOT_PATH . "/users/" . $user['id'] ?>"
                class="align-self-end font-weight-bold text-start text-lg-end">Voir le profil <i class="lni lni-arrow-right"></i></a>
        </div>
    </div>
</div>