<main class="d-flex flex-column justify-content-center align-items-center bg-background"
    style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <section id="editor" class="container-xl d-flex flex-column bg-light p-4 shadow" style="min-height:100vh; margin-top:3.5rem;">


    </section>

</main>

<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script>
const content = <?php echo $article['content'] ?>;
</script>
<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/article.js' ?> "></script>