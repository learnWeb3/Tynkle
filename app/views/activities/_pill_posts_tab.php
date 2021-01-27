<div class="tab-pane fade show active" id="pills-posts" role="tabpanel" aria-labelledby="pills-posts-tab">
<div class="d-flex w-100 align-self-start px-2 py-4">
        <div class="form-check form-check-inline">
            <input data-filterType="posts" class="form-check-input" type="radio" name="posts_filter" id="posts_filter_all" value="all" checked>
            <label class="form-check-label" for="posts_filter_all">toutes</label>
        </div>
        <div class="form-check form-check-inline">
            <input data-filterType="posts" class="form-check-input" type="radio" name="posts_filter" id="posts_filter_current" value="current">
            <label class="form-check-label" for="posts_filter_current">En cours</label>
        </div>
        <div class="form-check form-check-inline">
            <input data-filterType="posts" class="form-check-input" type="radio" name="posts_filter" id="posts_filter_old" value="old">
            <label class="form-check-label" for="posts_filter_old">Archivées</label>
        </div>
    </div>
    <div class="d-flex flex-column justify-content-center align-items-center" style="min-height: 75vh;" id="posts-container">
        <?php if (!empty($posts)) : ?>
            <?php foreach ($posts as $post) : ?>
                <?php include '_publication_card.php' ?>
            <?php endforeach; ?>
        <?php else : ?>
            <h2>Pas d'annonce pour le moment ...</h2>
            <a class="my-4 btn btn-brand btn-lg active" href="<?php echo ROOT_PATH ?>/posts/new">PUBLIER UNE ANNONCE</a>
        <?php endif; ?>
    </div>
</div>