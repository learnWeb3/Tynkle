<main class="bg-computer" style='min-height:100vh;padding-top:3rem'>
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
            <?php foreach ($platforms as $i => $platform): ?>
            <div class="accordion-flush card shadow-sm" id="accordionSkills">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="<?php echo "heading-".$i ?>">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="<?php echo "#collapse"."tynklePlatform".$i ?>" aria-expanded="true"
                            aria-controls="<?php echo "#collapse-".$i ?>">
                            <?php echo $platform['name'] ?></h4>
                        </button>
                    </h2>
                    <div id="<?php echo "collapse"."tynklePlatform".$i ?>" class="accordion-collapse collapse"
                        aria-labelledby="<?php echo "heading-".$i ?>" data-bs-parent="#accordionSkills">
                        <div class="accordion-body">
                            <?php foreach ($platform['breakdown_categories'] as $index => $breakdown_category_skill): ?>
                            <h5><?php echo $breakdown_category_skill['name'] ?></h5>
                            <div class="row">
                                <ul class="col-12">
                                    <?php foreach ($breakdown_category_skill['skills'] as $index => $skill): ?>
                                    <li class="row d-flex align-items-start justify-content-between">
                                        <div class="col-8">
                                            <p class="mb-0"><?php echo $skill['name'] ?></p>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-check form-check-inline">
                                                <?php if ($skill['is_owned']): ?>
                                                <input class="form-check-input" type="radio"
                                                    name="<?php echo $skill['id'] ?>" checked
                                                    id="yes_<?php echo $skill['id'] ?>" value="1">
                                                <?php else: ?>
                                                <input class="form-check-input" type="radio"
                                                    name="<?php echo $skill['id'] ?>"
                                                    id="yes_<?php echo $skill['id'] ?>" value="1">
                                                <?php endif;?>
                                                <label class="form-check-label" for="yes_<?php echo $skill['id'] ?>">oui
                                                </label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <?php if (!$skill['is_owned']): ?>
                                                <input class="form-check-input" type="radio"
                                                    name="<?php echo $skill['id'] ?>" checked
                                                    id="no_<?php echo $skill['id'] ?>" value="0">
                                                <?php else: ?>
                                                <input class="form-check-input" type="radio"
                                                    name="<?php echo $skill['id'] ?>" id="no_<?php echo $skill['id'] ?>"
                                                    value="0">
                                                <?php endif;?>

                                                <label class="form-check-label"
                                                    for="no_<?php echo $skill['id'] ?>">non</label>
                                            </div>
                                        </div>
                                    </li>
                                    <?php endforeach;?>
                                </ul>
                            </div>
                            <?php endforeach;?>
                        </div>
                    </div>
                </div>
            </div>

            <?php endforeach;?>

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

                <h2 class="font-weight-bold w-100 text-center my-4">Me contacter :</h2>

                <div class="row d-flex justify-content-around">
                    <?php if ($current_user): ?>
                    <button type="button" class="btn btn-lg btn-red-crayola col-12 col-lg-3 m-2" data-bs-toggle="modal"
                        data-bs-target="#new-offer">
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