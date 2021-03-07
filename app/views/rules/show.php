<main class="d-flex flex-column justify-content-center align-items-center bg-background"
    style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <section id="editor" class="container-xl d-flex flex-column bg-light p-4" style="min-height:100vh; margin-top:3.5rem;">

    </section>

    <section class="container-xl bg-light d-flex align-items-center justify-content-center">
        <?php if ($is_user_admin): ?>
            <a href="<?php echo ROOT_PATH . '/rules/' . $rule['id'] . '/edit' ?>" class="btn btn-lg btn-primary rounded-pill col-3 my-4">EDITER</a>
        <?php endif;?>
    </section>

</main>

<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script>
const content = <?php echo $rule['content'] ?>;
</script>
<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/rule.js' ?> "></script>