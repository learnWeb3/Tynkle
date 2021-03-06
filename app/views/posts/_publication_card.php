<div class="card card-publication col-12 col-lg-6 shadow p-4 m-2 rounded" style="width: 25rem;" id="post-<?php echo $post['id'] ?>">
    <img src="<?php echo $post['cover_image']?>" alt="" class="card-img-top">
    <div class="card-body">
        <div class="row">
            <div class="col-12 d-flex flex-column justify-content-start">
                <h5 class="font-weight-bold"><?php echo $post['title']?></h5>
                <p><?php echo $post['platform_name']?>-<?php echo $post['breakdown_category_name']?>
                </p>
            </div>
            <div class="col-12 d-flex align-items-start">
                <div class="d-flex align-items-center w-100">
                    <i class="lni lni-pointer lni-16"></i>
                    <p class="m-2"><?php echo $post['city']?>
                        <?php echo $post['postal_code']?></p>
                </div>
            </div>
        </div>
        <div class="row d-none d-lg-block">
            <div class="d-flex align-items-center w-100">
                <i class="lni lni-user lni-16"></i>
                <a class="font-italic m-2"
                    href="<?php echo ROOT_PATH ."/users/". $post['user_id'] ?>"><?php echo $post['username']?></a>
            </div>
        </div>
        <div class="row">
            <div class="col-12 d-flex align-items-center">
                <i class="lni lni-calendar lni-16"></i>
                <small class="m-2 mb-0">Posté le <?php echo $post['created_at']?></small>
            </div>
        </div>
        <div class="row">
            <div class="col-12 d-flex justify-content-end">
                <?php if ($post['user_id'] === $current_user): ?>
                <a href="<?php echo ROOT_PATH."/posts/".$post['id']."/destroy" ?>">
                    <i class="lni lni-trash lni-16"></i>
                </a>
                <a href="<?php echo ROOT_PATH."/posts/".$post['id']."/edit" ?>">
                    <i class="lni lni-spinner-arrow lni-16"></i>
                </a>
                <?php endif; ?>
            </div>
        </div>

        <div class="row my-4">
            <a href="<?php echo ROOT_PATH . "/posts/" . $post['id'] ?>" class="align-self-end font-weight-bold text-end">Voir les détails <i
            class="lni lni-arrow-right"></i></a>
        </div>
    </div>
</div>