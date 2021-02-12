<main class="bg-computer" style='min-height:100vh;padding-top:3rem'>
    <section id="map-container-header" class="container-xl w-100 p-0 bg-white" style="height:33vh; background-image:url(https://images.pexels.com/photos/205316/pexels-photo-205316.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940); background-position:center; background-size:contain;background-repeat:no-repeat">
    </section>
    <section class="container-xl relative d-flex flex-column align-items-center bg-light p-4 rounded" style='min-height:100vh;'>
        <h1 class="font-weight-bold text-center my-4" id="title"><?php echo htmlspecialchars($post['title']) ?></h1>
        <div class="row w-100">
            <div class="col-12 col-xl-6">
                <div class="card shadow-sm p-4 rounded">
                    <div class="d-flex align-items-center justify-content-start my-2">
                        <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/tags.svg" height="36" width="36" alt="breakdown category">
                        <p class="m-3 font-weight-bold" id="breakdown-type"><?php echo htmlspecialchars($post['platform_name']) ?>-<?php echo htmlspecialchars($post['breakdown_category_name']) ?></p>
                    </div>
                    <div class="d-flex align-items-center justify-content-start my-2">
                        <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/cash-stack.svg" height="36" width="36" alt="budget">
                        <p class="m-3 font-weight-bold" id="budget"><?php echo htmlspecialchars($post['budget']) ?> &euro;</p>
                    </div>
                    <div class="d-flex align-items-center justify-content-start my-2">
                        <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/pointer.svg" height="36" width="36" alt="map pointer">
                        <p class="m-3 font-weight-bold" id='location'><?php echo htmlspecialchars($post['city']) ?> <?php echo htmlspecialchars($post['postal_code']) ?></p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-xl-6">
                <div class="card shadow-sm p-4 rounded">
                    <div class="row w-100">
                        <div class="col-12 col-xl-6 d-flex flex-column justify-content-center">
                            <div id="avatar" class="shadow-sm bg-white my-4">
                                <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/img/commons/avatar_placeholder.svg" alt="map pointer icon">
                            </div>
                        </div>
                        <div class="col-12 col-xl-6 d-flex flex-column justify-content-center">
                            <a class="font-weight-bold font-italic m-2" href="/users/<?php echo $post['user_id'] ?>"><?php echo htmlspecialchars($post['username']) ?></a>
                            <p class="font-weight-bold m-2">18 annonces - 3 offres</p>
                            <div class="d-flex w-100 align-items-center">
                                <div class="rating m-2" data-rate-value='5'></div>
                                <p class="font-weight-bold m-2">5/5</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row w-100 my-4">
            <div class="col-12">
                <h4 class="my-2 font-weight-bold">Description: </h4>
                <div class="card shadow-sm p-4 rounded">
                    <p id="content"><?php echo htmlspecialchars($post['content']) ?></p>
                </div>
            </div>
        </div>
        <div class="row w-100 my-4">
            <div class="col-12">
                <h4 class="font-weight-bold">Localisation :</h4>
                <div id="map" data-lon="<?php echo htmlspecialchars($post['lon'])  ?>" data-lat="<?php echo htmlspecialchars($post['lat'])  ?>" class="relative bg-white shadow-sm" style="height:50vh">
                </div>
            </div>
        </div>
        <div class="row w-100 my-4">
            <div class="col-12">
                <h4 class="font-weight-bold">Images - screenshots :</h4>
                <div class="card-columns" style="min-height:50vh">
                    <?php foreach (json_decode($post['images']) as $image_url) : ?>
                        <div class="card">
                            <img class="img-fluid" src="<?php echo $image_url ?>" alt="post screenshot">
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
        <div class="row w-100 my-4">
            <div class="col-12 align-items-center justify-content-between flex-wrap my-4">
                <div class="row my-4">
                    <h2 class="font-weight-bold">Cette annonce vous interesse ?</h2>
                </div>
                <div class="row d-flex justify-content-around">
                    <?php if ($current_user) : ?>
                        <button type="button" class="btn btn-lg btn-red-crayola col-12 col-lg-3 m-2" data-bs-toggle="modal" data-bs-target="#new-offer">
                            FAIRE UNE OFFRE
                        </button>
                        <button class=" btn btn-lg btn-outline-red-crayola active col-12 col-lg-3 m-2" data-bs-toggle="modal" data-bs-target="#new-message">POSER UNE QUESTION</button>
                    <?php else : ?>
                        <a href="<?php echo ROOT_PATH ?>/signin" class="btn btn-lg btn-brand active col-12 col-lg-3 m-2">
                            CONNEXION
                        </a>
                        <a href="<?php echo ROOT_PATH ?>/register"  class="btn btn-lg btn-brand active col-12 col-lg-3 m-2">
                            INSCRIPTION
                        </a>
                    <?php endif; ?>
                    <?php if ($current_user === $post["user_id"]) : ?>
                        <a class="btn btn-lg btn-brand active col-12 col-lg-3 m-2" href="<?php echo ROOT_PATH . '/posts/' . $post['id'] . '/edit' ?>">EDITER</a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
        <div class="row w-100 my-4">
            <div class="col-12 align-items-center justify-content-between flex-wrap my-4">
                <div class="row my-4">
                    <h2 class="font-weight-bold">Vous pourriez être intéressé par :</h2>
                </div>
                <div class="col-12 d-flex flex-wrap" id="posts-container">
                    <?php foreach ($similar_posts as $post) : ?>
                        <?php include '_publication_card.php' ?>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </section>

    <!-- Modal -->
    <div class="modal fade" id="new-offer" tabindex="-1" aria-labelledby="new-offerLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title front-weight-bold" id="new-offerLabel">FAIRE UNE OFFRE</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-block overflow-auto" style="min-height: 35vh">
                    <form action="" data-idPost="<?php echo $post['id'] ?>" data-idUser="<?php echo $current_user  ?>" class="form-lg" method="post" id="new-offer-form">
                        <small>* champs obligatoires</small>
                        <div class="form-group my-2">
                            <label for="amount">Montant de l'offre : </label>
                            <input required type="number" name="amount" id="amount" class="form-control">
                        </div>
                        <div class="form-group my-2">
                            <label for="object">Choisir le titre de l'offre :</label>
                            <input required name="object" id="object" type="text" class="form-control" placeholder="Proposition de dépannage">
                        </div>

                        <div class="form-group my-2">
                            <label for="">Rediger un message :</label>
                            <textarea required name="content" id="content" class="form-control" placeholder="Je vous propose de vous dépanner pour la panne ...."></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-brand active" data-bs-dismiss="modal">FERMER</button>
                    <button type="submit" form="new-offer-form" class="btn btn-success">ENVOYER</button>
                </div>
            </div>
        </div>
    </div>


        <!-- Modal -->
        <div class="modal fade" id="new-message" tabindex="-1" aria-labelledby="new-messageLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title front-weight-bold" id="new-messageLabel">POSER UNE QUESTION</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-block overflow-auto" style="min-height: 35vh">
                    <form action="" data-idAuthor="<?php  echo $post['user_id'] ?>" data-idPost="<?php echo $post['id'] ?>" data-idUser="<?php echo $current_user  ?>" class="form-lg" method="post" id="new-message-form">
                        <small>* champs obligatoires</small>
                        <div class="form-group my-2">
                            <label for="">Rediger votre message :</label>
                            <textarea required name="content" id="content" class="form-control" rows="10" placeholder="Je vous propose de vous dépanner pour la panne ...."></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-brand active" data-bs-dismiss="modal">FERMER</button>
                    <button type="submit" form="new-message-form" class="btn btn-success">ENVOYER</button>
                </div>
            </div>
        </div>
    </div>


</main>


<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/post.js' ?>"></script>