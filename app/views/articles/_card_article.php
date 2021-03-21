<div class="card m-2 p-4 shadow" style="width: 25rem;">
    <img class="card-img-top"
        src="<?php echo $article['cover_image']?>"
        alt="Card image cap">
    <div class="card-body d-flex flex-column">
        <h5 class="card-title my-2"><?php echo $article['title'] ?></h5>
        <p class="card-text"><?php echo $article['description'] ?></p>
        <a href="<?php echo ROOT_PATH . '/articles/' . $article['id'] ?>" class="align-self-end text-dark font-weight-bold">Lire la suite <i
                class="lni lni-arrow-right"></i></a>
    </div>
</div>
