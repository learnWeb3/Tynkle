<main style=" background: rgb(227, 227, 227);
    background: linear-gradient(0deg, rgba(227, 227, 227, 1) 0%, rgba(255, 255, 255, 1) 100%);">

    <section id="news" class="container-xl d-flex flex-column justify-content-center align-items-center p-4">

        <h1 class="font-weight-bold text-dark display-4 my-4" style="border-bottom: .25rem solid #000;">Nouveautées</h1>


        <div class="row w-100 d-flex flex-wrap justify-content-center align-items-center" id="articles-container">

            <?php foreach ($articles['data'] as $article): ?>

                <?php include '_card_article.php'?>

            <?php endforeach;?>

        </div>


        <button id="see-more" class="btn btn-lg btn-primary col-9 col-lg-3 mx-auto my-5 font-weight-bold" data-next="<?php echo $articles["next"] ?>">Plus de nouveautées ...</button>

    </section>

</main>

<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/articles/articles.js' ?> "></script>