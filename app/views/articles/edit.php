<main class="d-flex flex-column justify-content-center align-items-center bg-background"
    style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>
    <section id="map-container-header" class="container-xl w-100 p-0 bg-white" style="height:33vh; background-image:url(https://images.pexels.com/photos/205316/pexels-photo-205316.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940); background-position:center; background-size:contain;background-repeat:no-repeat;margin-top:3.5rem;">
    </section>
    <section id="editor-container" class="container-xl d-flex flex-column align-items-center bg-light p-4"
        style="min-height:100vh;">

        <h1 class="my-4 font-weight-bold">Editer un article</h1>
        <strong><small>* champs obligatoires</small></strong>
        <form action="#" method="post" class="col-12">
            <div class="form-group my-4">
                <label for="title" style="cursor: help;" data-placement="top" data-toggle="tooltip"
                    title="Veuillez choisir le titre de l'article qui figurera sur la carte de présentation de ce dernier">Titre * :
                    :</label>
                <input id="title" name="title" type="text" class="form-control"
                    placeholder="Une belle histoire qui commence ..." value="<?php echo $article['title'] ?>" required>
            </div>

            <div class="form-group my-4">
                <label for="description" data-placement="top" style="cursor: help;" data-toggle="tooltip"
                    title="Veuillez choisir la description de l'article qui figurera sur la carte de présentation de ce dernier">Description * :
                    :</label>
                <textarea id="description" name="description" type="text"
                    class="form-control" required><?php echo $article['description'] ?></textarea>
            </div>

            <div class="form-group my-4" style="max-height: max-content;
    max-width: max-content;">
                <label for="">Choisir une image de couverture :</label>
                <div id="image" class="col-12"></div>
            </div>

            <div class="form-group my-4">
                <label for="">Rédiger votre article :</label>
                <div id="editor" class="col-12"></div>
            </div>

        </form>

        <button id="save-article" class="btn-lg btn-primary rounded-pill col-3 my-4">METTRE A JOUR</button>
    </section>

</main>

<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script>
const content = <?php echo $article['content'] ?>;
const coverImage = <?php echo $article['cover_image'] ?>;
const id = <?php echo $article['id'] ?>
</script>
<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/edit_article.js' ?> "></script>