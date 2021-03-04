<a href="<?php echo ROOT_PATH . '/chats/' . $chat['id'] ?>" data-url='<?php echo '/chats/' . $chat['id'] ?>'
    class="list-group-item list-group-item-action list-group-item-light rounded-0 message">
    <div class="media d-flex col-12">
        <i class="lni lni-user lni-32"></i>
        <div class="media-body mx-4 w-100">
            <div class="d-flex align-items-center justify-content-between mb-1">
                <h6 class="mb-0"><?php echo $chat["subscriber_third_party"]['user_username'] ?></h6><small
                    class="small font-weight-bold"><?php echo $chat['created_at'] ?></small>
            </div>
            <p class="font-italic mb-0 text-small"><?php echo $chat['preview_last_message']['content'] ?></p>
        </div>
    </div>
</a>