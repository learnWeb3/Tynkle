<main style="background-image: url(<?php echo $background_image_path ?>);" class="bg-background">
    <section id="map-container-header" class="container-xl w-100 p-0 bg-white"
        style="height:33vh;margin-top: 4rem;background-image:url(https://images.pexels.com/photos/205316/pexels-photo-205316.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940); background-position:center; background-size:contain;background-repeat:no-repeat">
    </section>
    <section class="container-xl d-flex align-items-center justify-content-center bg-light p-4">
        <h1 class="text-blue-brand font-weight-bold my-4">FAQ- Questions fréquentes</h1>

        <div class="accordion col-12" id="accordionFaq">
            <?php foreach ($faq_categories as $faq_category): ?>
            <h5 class="font-weight-bold text-left w-100 my-4 px-2"><?php echo $faq_category['name'] ?></h5>
            <?php foreach ($faq_category['faq_items'] as $faq_item): ?>
            <div class="accordion-item col-12">
                <h2 class="accordion-header" id="<?php echo 'heading-' . $faq_item['id'] ?>">
                    <button class="accordion-button collapsed bg-white" type="button" data-bs-toggle="collapse"
                        data-bs-target="<?php echo "#collapse" . "tynkleFaqItem" . $faq_item['id'] ?>"
                        aria-expanded="true" aria-controls="<?php echo "#collapse-" . $faq_item['id'] ?>">
                        <?php echo $faq_item['label'] ?></h4>
                    </button>
                </h2>
                <div id="<?php echo "collapse" . "tynkleFaqItem" . $faq_item['id'] ?>"
                    class="accordion-collapse collapse" aria-labelledby="<?php echo "heading-" . $faq_item['id'] ?>"
                    data-bs-parent="#accordionFaq">
                    <div class="accordion-body">
                        <?php echo $faq_item['content'] ?>
                    </div>
                </div>
            </div>
        </div>
        <?php endforeach?>
        <?php endforeach?>
    </section>

    <section class="container-xl d-flex align-items-center justify-content-center bg-light pt-4" style="padding-bottom: 4rem;">
        <h2 class="my-4">Vous n'avez pas trouver la réponse à votre question ?</h2>

        <a href="<?php echo ROOT_PATH . '/contact' ?>" class="btn btn-lg btn-primary mx-4 col-9 col-lg-3">
            CONTACTEZ NOUS
        </a>
    </section>
</main>