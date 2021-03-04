<main class="d-flex flex-column bg-background" style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <?php require_once '_nav_menu.php'?>
    <section class="col-12 col-xl-8 offset-xl-3 d-flex flex-column bg-light p-4"
        style="min-height:100vh; margin-top:3.5rem;">

        <h2 class="my-4">Rédiger un nouvel article :</h2>

        <div class="row w-100">
        <div class="col-12 col-lg-8">
            <h5>Les articles figureront dans la partie blog de votre site web: </h5>
        </div>

        <div class="col-12 col-lg-4">
        <a href="<?php echo ROOT_PATH . '/articles' ?>">Voir <i
                    class="lni lni-arrow-right"></i></a>
        </div>

        </div>

        <form id="new-article" action="" method="post" class="col-12">
            <div class="form-group my-2">
                <label style="cursor: help;" data-placement="top" data-toggle="tooltip" title="Veuillez choisir un titre comportant des mot clefs pertinents" for="title">Titre :</label>
                <input name="title" id="title" type="text" class="form-control col-12" required>
            </div>

            <div class="form-group my-2">
                <label for="description" data-placement="top" data-toggle="tooltip" title="Veuillez choisir une description comportant des mot clefs pertinents">Description :</label>
                <textarea name="description" id="description" class="form-control col-12" required></textarea>
            </div>
        </form>
        <div id="toolbar" class="col-12"></div>
        <div id="editor" class="col-12 my-2"></div>

        <button form="new-article" type="submit" class="btn-lg btn-primary rounded-pill col-3 my-4">PUBLIER</button>

    </section>

</main>

<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/new_article.js' ?> "></script>