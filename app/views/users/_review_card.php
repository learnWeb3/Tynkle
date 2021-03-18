<div class="media d-block d-sm-flex review bg-white">
    <div class="d-flex flex-column align-items-center justify-content-center mx-4">
        <i class="lni lni-user lni-64 avatar avatar-xl p-2 mb-2"></i>
    </div>
    <div class="media-body">
        <h6 class="mt-2 mb-1"><a href="<?php echo ROOT_PATH . "/users/" . $review['user_id'] ?>"><?php echo $review['username'] ?></a></h6>
        <div class="mb-2">
            <div class="rating" data-rate-value='<?php echo $review['score'] ? $review['score'] : '0' ?>'></div>
        </div>
        <p class="text-muted text-sm">
            <?php echo $review['comment'] ?>
        </p>
    </div>
</div>