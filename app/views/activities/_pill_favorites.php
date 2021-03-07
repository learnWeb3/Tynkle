<div class="tab-pane fade show" id="pills-favorites" role="tabpanel" aria-labelledby="pills-favorites-tab">
    <div class="d-flex flex-column justify-content-center align-items-center" style="min-height: 100vh;" id="favorites-container">
    <h2>Mes helpers préférés</h2>
        <?php if (!empty($favorites_users)) : ?>
            <?php foreach ($favorites_users as $user) : ?>
                <?php include '_user_card.php' ?>
            <?php endforeach; ?>
        <?php else : ?>
            <h2>Pas de favoris pour le moment ...</h2>
            <a class="my-4 btn btn-brand btn-lg active" href="<?php echo ROOT_PATH ?>/posts/new">DEMANDER DE L'AIDE</a>
        <?php endif; ?>
    </div>
</div>

<script>

// init js-rater library
const options = {
  max_value: 5,
  step_size: 0.5,
  initial_value: 0,
  cursor: "default",
  readonly: true,
};
$(".rating").rate(options);

</script>