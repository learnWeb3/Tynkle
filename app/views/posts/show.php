<main class="bg-brand-blue" style='min-height:100vh;padding-top:4rem'>
    <section id="map-container-header" class="container w-100 p-0 bg-white" style="height:33vh; background-image:url(https://images.pexels.com/photos/205316/pexels-photo-205316.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940); background-position:center; background-size:contain;background-repeat:no-repeat">
    </section>
    <section class="container relative d-flex flex-column align-items-center bg-light p-4 rounded" style='min-height:100vh;'>
        <div id="avatar" class="shadow-sm bg-white my-4">
        </div>
        <a class="font-weight-bold font-italic m-2" href="/users/<?php echo $post['user_id'] ?>"><?php echo htmlspecialchars($post['username']) ?></a>
        <h1 class="font-weight-bold text-center my-4" id="title"><?php echo htmlspecialchars($post['title']) ?></h1>
        <div class="w-100 d-flex align-items-center justify-content-start my-2">
            <img src="" alt="">
            <h3 class="m-2 font-weight-bold" id="breakdown-type"><?php echo htmlspecialchars($post['platform_name']) ?>-<?php echo htmlspecialchars($post['breakdown_category_name']) ?></h3>
        </div>
        <div class="w-100 d-flex align-items-center justify-content-start my-2">
            <img src="" alt="">
            <h3 class="m-2 font-weight-bold" id="budget"><?php echo htmlspecialchars($post['budget']) ?> &euro;</h3>
        </div>
        <div class="w-100 d-flex align-items-center justify-content-start my-2">
            <img src="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/pointer.svg" height="24" width="24" alt="map pointer">
            <h3 class="m-2 font-weight-bold" id='location'><?php echo htmlspecialchars($post['city']) ?> <?php echo htmlspecialchars($post['postal_code']) ?></h3>
        </div>
        <div class="row my-4 px-0">
            <h4 class="my-2 font-weight-bold">Description: </h4>
            <p id="content"><?php echo htmlspecialchars($post['content']) ?></p>
        </div>
        <div class="w-100 my-4 px-0">
            <h4 class="font-weight-bold">Localisation :</h4>
            <div id="pictures-container" class="relative bg-white shadow-sm" style="height:50vh">
            </div>
        </div>
        <div class="w-100 my-4 px-0">
            <h4 class="font-weight-bold">Images - screenshots :</h4>
            <div class="card-columns" style="min-height:50vh">
                <?php foreach (json_decode($post['images']) as $image_url) : ?>
                    <div class="card">
                        <img class="img-fluid" src="<?php echo $image_url ?>" alt="post screenshot">
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
        <div class="col-12 d-flex align-items-center justify-content-between flex-wrap my-4">
            <button class="btn btn-lg btn-brand active col-12 col-lg-3 m-2">CONTACTER</button>
            <button class="btn btn-lg btn-brand active col-12 col-lg-3 m-2">PROPOSER UN DEVIS</button>
            <a class="btn btn-lg btn-brand active col-12 col-lg-3 m-2" href="<?php echo ROOT_PATH.'/posts/'.$post['id'].'/edit' ?>">EDITER</a>
        </div>
    </section>
</main>