<main  style="background-image: url(<?php echo $background_image_path ?>);min-height:100vh;margin-top:3rem" class="bg-background">
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
        <div class="tab-content w-100" id="pills-tabContent">
            <?php include '_pill_posts_tab.php' ?>
            <?php include '_pill_offers_tab.php' ?>
            <?php include '_pill_aks_tab.php' ?>
        </div>
    </section>
</main>

<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/activities.js' ?>"></script>