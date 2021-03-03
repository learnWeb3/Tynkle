<div class="card shadow-sm p-4">
    <div class="row w-100 d-flex justify-content-between">
        <div class="col d-flex align-items-center">
            <p class="m-2 font-weight-bold"><?php echo $review['created_at'] ?></p>
        </div>
        <div class="col d-flex align-items-center justify-content-end">
            <div class="rating m-2" data-rate-value='<?php echo $review['score'] ? $review['score'] : '0' ?>'></div>
            <p class="font-weight-bold m-2"><?php echo $review['score'] ? $review['score'] : '0' ?>/5</p>
        </div>
    </div>
    <p class="m-2 font-italic"><?php echo $review['comment'] ?></p>
    <div class="row w-100 d-flex justify-content-end">
        <div class="col d-flex align-items-center justify-content-end">
            <i class="lni lni-user lni-16"></i>
            <a href="<?php echo ROOT_PATH."/users/". $review['user_id'] ?>" class="m-2 font-weight-bold"><?php echo $review['username'] ?></a>
        </div>
    </div>
</div>