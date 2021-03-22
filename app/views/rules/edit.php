<main class="d-flex flex-column justify-content-center align-items-center bg-background"
    style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>
    <section id="map-container-header" class="container-xl w-100 p-0 bg-white"
        style="height:33vh; background-image:url(https://images.pexels.com/photos/205316/pexels-photo-205316.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940); background-position:center; background-size:contain;background-repeat:no-repeat;margin-top:3.5rem;">
    </section>
    <section id="editor-container" class="container-xl d-flex flex-column align-items-center bg-light p-4"
        style="min-height:100vh;">

        <h1 class="my-4 font-weight-bold">Editer les règles d'utilisation</h1>
        <strong><small>* champs obligatoires</small></strong>
        <form action="#" method="post" class="col-12">

            <div class="form-group my-4">
                <label for="">Rédiger votre article :</label>
                <div id="editor" class="col-12"></div>
            </div>

        </form>

        <button id="save-rule" class="btn-lg btn-primary col-3 my-4">METTRE A JOUR</button>
    </section>

</main>

<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script>
const content = <?php echo $rule['content'] ?>;
const id = <?php echo $rule['id'] ?>
</script>
<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/rules/edit_rule.js' ?> "></script>