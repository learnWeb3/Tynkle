<div class="tab-pane fade show" id="pills-offers" role="tabpanel" aria-labelledby="pills-offers-tab">
    <div class="d-flex flex-wrap w-100 align-self-start px-2 py-4">
        <div class="form-check form-check-inline m-2">
            <input data-filterType="offers" class="form-check-input" type="radio" name="offers_filter" id="offers_filter_all" value="all" checked>
            <label class="form-check-label" for="offers_filter_all">toutes</label>
        </div>
        <div class="form-check form-check-inline m-2">
            <input data-filterType="offers" class="form-check-input" type="radio" name="offers_filter" id="offers_filter_sent" value="sent">
            <label class="form-check-label" for="offers_filter_sent">envoyées</label>
        </div>
        <div class="form-check form-check-inline m-2">
            <input data-filterType="offers" class="form-check-input" type="radio" name="offers_filter" id="offers_filter_received" value="received">
            <label class="form-check-label" for="offers_filter_received">reçues</label>
        </div>
        <div class="form-check form-check-inline m-2">
            <input data-filterType="offers" class="form-check-input" type="radio" name="offers_filter" id="offers_filter_current" value="current">
            <label class="form-check-label" for="offers_filter_current">en cours</label>
        </div>
        <div class="form-check form-check-inline m-2">
            <input data-filterType="offers" class="form-check-input" type="radio" name="offers_filter" id="offers_filter_old" value="old">
            <label class="form-check-label" for="offers_filter_old">déclinées</label>
        </div>
    </div>
    <div class="d-flex flex-column justify-content-center align-items-center" style="min-height: 75vh;" id="offers-container">
        <?php if (!empty($offers)) : ?>
            <?php foreach ($offers as $offer) : ?>
                <?php include '_offer_card.php' ?>
            <?php endforeach; ?>
        <?php else : ?>
            <h2>Pas d'offre pour le moment ...</h2>
            <a class="my-4 btn btn-brand btn-lg active" href="<?php echo ROOT_PATH ?>/posts">VENIR EN AIDE A LA COMMUNAUTE</a>
        <?php endif; ?>
    </div>
</div>