<main class="bg-brand-blue" style='min-height:100vh;margin-top:3rem'>
    <section class="container d-flex flex-column align-items-center bg-light p-4">
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="pills-posts-tab" data-bs-toggle="pill" href="#pills-posts" role="tab" aria-controls="pills-posts" aria-selected="true">Mes annonces</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="pills-offers-tab" data-bs-toggle="pill" href="#pills-offers" role="tab" aria-controls="pills-offers" aria-selected="false">Mes offres</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="pills-asks-tab" data-bs-toggle="pill" href="#pills-asks" role="tab" aria-controls="pills-asks" aria-selected="false">Mes demandes</a>
            </li>
        </ul>
        <div class="d-flex w-100 align-self-start px-2 py-4">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                    En ligne
                </label>
            </div>
            <div class="form-check" style='margin-left:2rem;'>
                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                <label class="form-check-label" for="flexCheckChecked">
                    Archivées
                </label>
            </div>
        </div>
        <div class="tab-content w-100" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-posts" role="tabpanel" aria-labelledby="pills-posts-tab">
                <div class="d-flex flex-column justify-content-center align-items-center" style="min-height: 75vh;">
                    <?php if (!empty($posts)) : ?>
                        <?php foreach ($posts as $post) : ?>
                            <?php include '_publication_card.php' ?>
                        <?php endforeach; ?>
                    <?php else : ?>
                        <h2>Pas d'annonce pour le moment ...</h2>
                        <a class="my-4 btn btn-brand btn-lg active" href="<?php echo ROOT_PATH ?>/posts/new">PUBLIER UNE ANNONCE</a>
                    <?php endif; ?>
                </div>
            </div>
            <div class="tab-pane fade show" id="pills-offers" role="tabpanel" aria-labelledby="pills-offers-tab">
                <div class="d-flex flex-column justify-content-center align-items-center" style="min-height: 75vh;">
                    <?php if (!empty($offers)) : ?>
                        <?php foreach ($offers as $offer) : ?>
                            <?php include '_offer_card.php' ?>
                        <?php endforeach; ?>
                    <?php else : ?>
                        <h2>Pas d'offre pour le moment ...</h2>
                        <a class="my-4 btn btn-brand btn-lg active" href="<?php echo ROOT_PATH ?>/posts">VENIR EN AIDE A LA COMMUNAUTE</a>
                    <?php endif; ?>
                </div>
            </div>
            <div class="tab-pane fade show" id="pills-asks" role="tabpanel" aria-labelledby="pills-asks-tab">
                <div class="d-flex flex-column justify-content-center align-items-center" style="min-height: 75vh;">
                    <?php if (!empty($asks)) : ?>
                        <?php foreach ($asks as $ask) : ?>
                            <?php include '_ask_card.php' ?>
                        <?php endforeach; ?>
                    <?php else : ?>
                        <h2>Pas de demandes pour le moment ...</h2>
                        <a class="my-4 btn btn-brand btn-lg active" href="<?php echo ROOT_PATH ?>/posts/new">DEMANDER DE L'AIDE</a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </section>
</main>