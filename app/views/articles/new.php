<main class="d-flex flex-column bg-background"
    style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <?php require_once '_nav_menu.php'?>
    <section class="col-12 col-xl-8 offset-xl-3 d-flex flex-column bg-light p-4"
        style="min-height:100vh; margin-top:3.5rem;">

        <h2 class="my-4">Rédiger un nouvel article :</h2>

        <div class="row w-100 my-2">
            <div class="col-12 col-lg-8">
                <h5>Les articles figureront dans la partie blog de votre site web: </h5>
            </div>

            <div class="col-12 col-lg-4">
                <a href="<?php echo ROOT_PATH . '/articles' ?>">Voir <i class="lni lni-arrow-right"></i></a>
            </div>
        </div>

        <form action="#" method="post" class="col-12">

            <div class="form-group my-4">
                <label for="title" style="cursor: help;" data-placement="top" data-toggle="tooltip"
                    title="Veuillez choisir le titre de l'article qui figurera sur la carte de présentation de ce dernier">Titre
                    :</label>
                <input id="title" name="title" type="text" class="form-control"
                    placeholder="Une belle histoire qui commence ..." required>
            </div>

            <div class="form-group my-4">
                <label for="description" data-placement="top" style="cursor: help;" data-toggle="tooltip"
                    title="Veuillez choisir la description de l'article qui figurera sur la carte de présentation de ce dernier">Description
                    :</label>
                <textarea id="description" name="description" type="text" class="form-control"
                    placeholder="Une invitation à aller plus loin avec Tynkle" required></textarea>
            </div>

            <div class="form-group my-4">
                <label for="cover_image">Choisir une image de couverture :</label>
                <input type="file" class="form-control" name="cover_image" id="cover_image">
            </div>

            <div class="form-group my-4">
                <label for="">Rédiger votre article :</label>
                <div id="editor" class="col-12"></div>
            </div>


        </form>

        <button id="save-article" class="btn-lg btn-primary rounded-pill col-3 my-4">SAUVEGARDER</button>

    </section>

</main>

<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/new_article.js' ?> "></script>
