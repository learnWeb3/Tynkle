<div data-id='<?php echo $message['message_id'] ?>' class="card-message col-12 col-lg-8 d-flex flex-column p-4 my-2 bg-white shadow-sm <?php echo $current_user === $message['user_id'] ? 'sender' : 'recipient'; ?>" id='<?php echo 'message-' . $message['message_id'] ?>'>
    <div class="row">
        <div class="col-1 d-flex flex-column justify-content-center">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/img/commons/avatar_placeholder.svg" height="48" width="48" alt="map pointer icon" class="img-fluid">
        </div>
        <div class="col">
            <p class="font-weight-bold mb-0"><?php echo $message['user_username'] ?></p>
            <p class="font-italic text-muted mb-0"><?php echo $message['message_created_at'] ?></p>
        </div>
    </div>
    <div class="row my-2">
        <p>
            <?php echo $message['message_content'] ?>
        </p>
        <?php if ($message['message_ressource_link']): ?>
        <a href="<?php echo ROOT_PATH . $message['message_ressource_link'] ?>">Détails</a>
        <?php endif;?>
    </div>
</div>