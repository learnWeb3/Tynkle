<div data-id='<?php echo htmlspecialchars($message['message_id']) ?>' class="card-message col-12 col-lg-8 d-flex flex-column p-4 my-2 shadow-sm <?php echo $current_user === $message['user_id'] ? 'sender' : 'recipient';  ?>" id='<?php echo 'message-' . htmlspecialchars($message['message_id']) ?>'>
    <?php if ($current_user === $message['user_id']) : ?>
        <img src="<?php echo ABSOLUTE_ASSET_PATH . '/icons/trash.svg' ?>" data-id='<?php echo $message['id'] ?>' height="24" width="24" alt="delete message" class="align-self-end delete-message" style="cursor:pointer;">
    <?php endif; ?>
    <div class="row">
        <div class="col-1 d-flex flex-column justify-content-center">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/img/commons/avatar_placeholder.svg" height="48" width="48" alt="map pointer icon" class="img-fluid">
        </div>
        <div class="col">
            <p class="font-weight-bold mb-0"><?php echo htmlspecialchars($message['user_firstname']) ?></p>
            <p class="font-italic text-muted mb-0"><?php echo htmlspecialchars($message['message_created_at']) ?></p>
        </div>
    </div>
    <div class="row my-2">
        <p>
            <?php echo htmlspecialchars($message['message_content']) ?>
        </p>
    </div>
</div>