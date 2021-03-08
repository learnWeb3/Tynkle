<div class="tab-pane fade show" id="pills-asks" role="tabpanel" aria-labelledby="pills-asks-tab">
    <div class="d-flex flex-wrap w-100 align-self-start px-2 py-4">
        <div class="form-check form-check-inline m-2">
            <input data-filterType="asks" class="form-check-input" type="radio" name="asks_filter" id="asks_filter_all" value="all" checked>
            <label class="form-check-label" for="asks_filter_all">Toutes</label>
        </div>
        <div class="form-check form-check-inline m-2">
            <input data-filterType="asks" class="form-check-input" type="radio" name="asks_filter" id="asks_filter_current" value="current">
            <label class="form-check-label" for="asks_filter_current">En cours</label>
        </div>
        <div class="form-check form-check-inline m-2">
            <input data-filterType="asks" class="form-check-input" type="radio" name="asks_filter" id="asks_filter_old" value="old">
            <label class="form-check-label" for="asks_filter_old">Archivées</label>
        </div>
    </div>
    <div class="d-flex flex-column justify-content-center align-items-center" style="min-height: 75vh;" id="asks-container">
        <?php if (!empty($asks)) : ?>
            <?php foreach ($asks as $ask) : ?>
                <?php include '_ask_card.php' ?>
            <?php endforeach; ?>
        <?php else : ?>
            <h2>Pas de demande pour le moment ...</h2>
            <a class="my-4 btn btn-primary btn-lg " href="<?php echo ROOT_PATH ?>/posts/new">DEMANDER DE L'AIDE</a>
        <?php endif; ?>
    </div>
</div>