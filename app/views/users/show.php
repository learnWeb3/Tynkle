<main class="bg-background"
    style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;padding-top:3rem'>
    <?php include '_new_message_modal.php'?>
    <?php include '_warning_modal.php'?>
    <?php include '_new_review_modal.php'?>
    <section class="container-xl bg-light d-flex flex-column justify-content-center align-items-center p-4 shadow-sm">
        <div class="col-12" id="user-profile-header">
            <div class="p-4 rounded" style="background-color: rgba(255,255,255,.75);">
                <div class="row w-100">
                    <div class="col-12 d-flex flex-column justify-content-center align-items-center">
                        <div class="avatar shadow-sm bg-white my-4">
                            <i class="lni lni-user lni-64"></i>
                        </div>
                        <h1 class="my-4">
                            <a class="font-weight-bold font-italic m-2"
                                href="/users/<?php echo $user['user_id'] ?>"><?php echo $user['username'] ?>
                            </a>
                        </h1>
                    </div>
                    <div class="col-12 d-flex flex-column justify-content-center align-items-center">
                        <p class="font-weight-bold m-2"><?php echo $user['posts_count'] ?> annonces -
                            <?php echo $user['offers_count'] ?> offres</p>

                        <p class="font-weight-bold m-2"><span
                                id="followers_count"><?php echo $user['follower_count'] ?></span> abbonné(s) -
                            <?php echo $user['followed_count'] ?> abbonnements </p>
                        <div class="d-flex align-items-center">
                            <div class="rating m-2"
                                data-rate-value='<?php echo $user['reviews_score'] ? $user['reviews_score'] : '0' ?>'>
                            </div>
                            <p class="font-weight-bold m-2">
                                <?php echo $user['reviews_score'] ? $user['reviews_score'] : '0' ?>/5</p>
                        </div>

                        <?php if ($current_user): ?>
                        <div class="col-12 d-flex align-items-center justify-content-center flex-wrap"
                            id="follow-actions">
                            <button type="button" class="btn btn-lg bg-yellow-tynkle text-dark col-12 col-lg-3 m-2"
                                data-bs-toggle="modal" data-bs-target="#new-review">
                                <i class="lni lni-star mx-2"></i>LAISSER UN AVIS
                            </button>
                            <?php if ($follow_id): ?>
                            <button id="unfollow" data-follow="<?php echo $follow_id ?>"
                                data-user="<?php echo  $user['id']  ?>"
                                class="btn btn-lg btn-red-crayola col-12 col-lg-3 m-2"> <i
                                    class="lni lni-heart mx-2"></i>NE PLUS SUIVRE</button>
                            <?php else : ?>
                            <button id="follow" data-user="<?php echo  $user['id']  ?>"
                                class="btn btn-lg btn-primary col-12 col-lg-3 m-2"> <i
                                    class="lni lni-heart mx-2"></i>SUIVRE</button>
                            <?php endif; ?>

                        </div>

                        <?php endif; ?>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="p-4 rounded">
                <div class="col-12 d-flex flex-column justify-content-center">
                    <h2 class="font-weight-bold">Les avis :</h2>
                </div>
                <div class="col-12 d-flex flex-column justify-content-center">
                    <?php if (!empty($reviews)): ?>
                    <?php foreach ($reviews as $review): ?>
                    <?php include "_review_card.php"?>
                    <?php endforeach;?>
                    <?php else: ?>
                    <div class="card shadow-sm p-4">
                        <p class="m-2 font-weight-bold">Pas d'avis pour le moment</p>
                    </div>
                    <?php endif;?>
                </div>
            </div>
        </div>
        <div class="col-12 d-flex flex-column my-4 p-4">
            <h2 class="font-weight-bold">Les compétences :</h2>
            <?php include '_public_profile_skills.php'?>
        </div>
        <div class="col-12">
            <div class="p-4 rounded">
                <div class="col-12 d-flex flex-column justify-content-center">
                    <h2 class="font-weight-bold">Les annonces :</h2>
                </div>
                <div class="card-columns col-12" id="posts-container">
                    <?php foreach ($posts as $post): ?>
                    <?php include '_publication_card.php'?>
                    <?php endforeach;?>
                </div>
            </div>
        </div>

        <?php if ($current_user): ?>

        <div class="d-flex align-items-center my-4 col-12">
            <div class="card shadow-sm p-4 w-100">
                <div class="d-flex align-items-center justify-content-lg-between justify-content-center flex-wrap">
                    <h3 class="font-weight-bold col-12 col-lg-3 my-4 text-lg-start text-center">Contact :</h3>
                    <button type="button" class="btn btn-lg btn-red-crayola mx-4 col-9 col-lg-3" data-bs-toggle="modal"
                        data-bs-target="#new-message">
                        POSER UNE QUESTION
                    </button>
                </div>
            </div>
        </div>
        <div class="d-flex align-items-center my-4 col-12">
            <div class="card shadow-sm p-4 w-100">
                <div class="d-flex align-items-center justify-content-lg-between justify-content-center flex-wrap">
                    <h3 class="font-weight-bold col-12 col-lg-3 my-4 text-lg-start text-center">Signaler cet utilisateur
                        ?</h3>
                    <button type="button" class="btn btn-lg btn-primary mx-4 col-9 col-lg-3" data-bs-toggle="modal"
                        data-bs-target="#warning">
                        SIGNALER
                    </button>
                </div>
            </div>
        </div>
        <?php else: ?>

        <div class="row w-100 my-4">
            <div class="col-12 my-4">
                <div class="row my-4">
                    <h2 class="font-weight-bold text-center">Contacter <strong><?php echo $user['username'] ?></strong>
                        ?</h2>
                </div>
                <div class="row my-4 d-flex align-items-center justify-content-center flex-wrap ">
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
    </section>
</main>


<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/users/user.js' ?>"></script>