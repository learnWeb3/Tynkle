<div class="card card-publication col-12 col-lg-6 shadow p-4 my-4" id="post-<?php echo $post['id'] ?>">
    <img src="<?php echo htmlspecialchars($post['cover_image']) ?>" height="450px" alt="" class="card-img-top">
    <div class="card-body">
        <div class="row">
            <div class="col-12 d-flex flex-column justify-content-start">
                <h5 class="font-weight-bold"><?php echo htmlspecialchars($post['title']) ?></h5>
                <p><?php echo htmlspecialchars($post['platform_name']) ?>-<?php echo htmlspecialchars($post['breakdown_category_name']) ?></p>
            </div>
            <div class="col-12 d-flex align-items-start">
                <div class="d-flex align-items-center w-100">
                    <i class="lni lni-pointer lni-16"></i>
                    <p class="m-2"><?php echo htmlspecialchars($post['city']) ?> <?php echo htmlspecialchars($post['postal_code']) ?></p>
                </div>
            </div>
        </div>
        <div class="row d-none d-lg-block">
            <div class="d-flex align-items-center w-100">
            <i class="lni lni-user lni-16"></i>
                <a class="font-italic m-2" href="<?php echo ROOT_PATH ."/users/". $post['user_id'] ?>"><?php echo htmlspecialchars($post['username']) ?></a>
            </div>
        </div>
        <div class="row">
            <div class="col-6 d-flex align-items-center">
                <i class="lni lni-calendar lni-16"></i>
                <small class="m-2 mb-0">Posté le <?php echo htmlspecialchars($post['created_at']) ?></small>
            </div>
            <div class="col-6 d-flex justify-content-end">
                <?php if ($post['user_id'] === $current_user): ?>
                    <a href="<?php echo ROOT_PATH."/posts/".$post['id']."/destroy" ?>"><img src="<?php echo ABSOLUTE_ASSET_PATH ?>/partials/publication_card/img/trash.svg" height="16" width="16" alt="delete publication" class="m-2 img-fluid"></a>
                    <a href="<?php echo ROOT_PATH."/posts/".$post['id']."/edit" ?>"><img src="<?php echo ABSOLUTE_ASSET_PATH ?>/partials/publication_card/img/edit.svg" height="16" width="16" alt="edit publication" class="m-2 img-fluid"></a>
                <?php endif; ?>
            </div>
        </div>

        <div class="row my-4">
            <a class="btn btn-lg btn-brand active" href=<?php echo ROOT_PATH . "/posts/" . $post['id'] ?>>VOIR LES DETAILS</a>
        </div>
    </div>
</div>