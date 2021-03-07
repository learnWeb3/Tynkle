<main class="d-flex flex-column bg-background"
    style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <?php require_once '_nav_menu.php'?>
    <section class="col-12 col-xl-8 offset-xl-3 d-flex flex-column bg-light p-4"
        style="min-height:100vh; margin-top:3.5rem;">

        <h2 class="my-4">Rédiger les conditions d'utilisation de la plateforme :</h2>

        <div id="editor" class="col-12"></div>

        <button id="save-rule" class="btn-lg btn-primary rounded-pill col-3 my-4">SAUVEGARDER</button>

    </section>

</main>

<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/new_rule.js' ?> "></script>
