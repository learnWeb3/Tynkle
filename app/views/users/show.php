<main class="bg-computer" style='min-height:100vh;padding-top:3rem'>
<?php include '_new_message_modal.php'?>
    <section class="container-xl bg-light d-flex flex-column justify-content-center align-items-center p-4 shadow-sm">
        <div class="col-12">
            <div class="p-4 rounded">
                <div class="row w-100">
                    <div class="col-12 d-flex flex-column justify-content-center align-items-center">
                        <div id="avatar" class="shadow-sm bg-white my-4">
                            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/img/commons/avatar_placeholder.svg"
                                alt="user avatar">
                        </div>
                        <h1 class="my-4"><a class="font-weight-bold font-italic m-2"
                                href="/users/<?php echo $user['user_id'] ?>"><?php echo htmlspecialchars($user['username']) ?></a>
                        </h1>
                    </div>
                    <div class="col-12 d-flex flex-column justify-content-center align-items-center">
                        <p class="font-weight-bold m-2"><?php echo $user['posts_count'] ?> annonces -
                            <?php echo $user['offers_count'] ?> offres</p>
                        <div class="d-flex align-items-center">
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
                    <h2 class="font-weight-bold">Les publications :</h2>
                </div>
                <div class="col-12 d-flex flex-wrap" id="posts-container">
                    <?php foreach ($posts as $post): ?>
                    <?php include '_publication_card.php'?>
                    <?php endforeach;?>
                </div>
            </div>
        </div>


        <div class="row w-100 my-4">
            <div class="card shadow-sm p-4 d-flex flex-column">

                <h2 class="font-weight-bold w-100 text-center my-4">Contact :</h2>

                <div class="row d-flex justify-content-around">
                    <?php if ($current_user): ?>
                    <button type="button" class="btn btn-lg btn-red-crayola col-12 col-lg-3 m-2" data-bs-toggle="modal"
                        data-bs-target="#new-message">
                        POSER UNE QUESTION
                    </button>
                    <?php else: ?>
                    <a href="<?php echo ROOT_PATH ?>/signin" class="btn btn-lg btn-brand active col-12 col-lg-3 m-2">
                        CONNEXION
                    </a>
                    <a href="<?php echo ROOT_PATH ?>/register" class="btn btn-lg btn-brand active col-12 col-lg-3 m-2">
                        INSCRIPTION
                    </a>
                    <?php endif;?>
                </div>
            </div>
        </div>
    </section>
</main>


<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/user.js' ?>"></script>