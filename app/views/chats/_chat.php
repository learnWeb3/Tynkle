<div class="card card-chat col-12 shadow-sm p-4 my-4">
    <div class="row">
        <div class="col-12 col-lg-3 d-flex flex-column justify-content-center align-items-center">
                <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/img/commons/avatar_placeholder.svg" height="36" width="36" alt="map pointer icon" class="img-fluid">
                <p class="font-weight-bold my-2">Martin Dupont</p>
        </div>
        <div class="col-12 col-lg-6 d-flex align-items-center">
            <p class="text-muted mb-0">Lorem ipsum dolor sit, amet consectetur ...</p>
        </div>
        <div class="col-12 col-lg-3 d-flex align-items-center">
            <p class="font-italic mb-0">Mar 12 Janvier à 10:06</p>
        </div>
        <?php var_dump($chat) ?>
        <a href="<?php echo ROOT_PATH.'/chats/'.$chat['id'] ?>" class="stretched-link"></a>
    </div>
</div>