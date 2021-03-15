<main class="d-flex flex-column justify-content-center align-items-center bg-background"
    style="min-height:100vh; background:#1266f1;
background: linear-gradient(180deg, #1266f1 0%, #1266f1 33%, #fbfbfb 33%, #fbfbfb 100%);">

    <section class="col-12 col-lg-6 d-flex flex-column shadow p-4"
        id="general-container">

        <div class="row my-4">
            <div class="progress">
                <div class="progress-bar progress-bar-animated bg-info" role="progressbar"
                    style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>

        <h2 class="text-center" id="step-label"></h2>

    </section>

</main>


<script>
const platforms = <?php echo $json_platforms ?>

const breakdowns = <?php echo $json_breakdowns ?>
</script>


<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/asks/new_ask.js' ?> "></script>