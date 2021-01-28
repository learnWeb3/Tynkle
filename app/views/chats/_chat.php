<div class="card card-chat bg-white col-12 col-xl-9 shadow-sm p-4 my-4">
    <div class="row">
        <div class="col-12 col-xl-2 d-flex align-items-center">
            <div class="avatar p-4 m-2">
                <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/img/commons/avatar_placeholder.svg" height="64" width="64" alt="map pointer icon" class="img-fluid">
            </div>
        </div>
        <div class="col-12 col-xl-6 d-flex flex-column justify-content-center">
            <small class="font-weight-bold font-sm my-2"><?php echo $chat["subscriber_third_party"]['user_username'] ?></small>
            <p class="font-weight-bold"><?php echo $chat['preview_last_message']['content'] ?></p>
        </div>
        <div class="col-12 col-xl-4 d-flex flex-column justify-content-start align-items-end">
            <p class="font-italic mb-0"><?php echo $chat['created_at'] ?></p>
            <p class="font-italic m-2"><?php echo $chat['subscriber_count'] ?> membres</p>
            <p class="font-italic m-2"><?php echo $chat['message_count'] ?> messages</p>
        </div>
        <a href="<?php echo ROOT_PATH . '/chats/' . $chat['id'] ?>" class="stretched-link"></a>
    </div>
</div>