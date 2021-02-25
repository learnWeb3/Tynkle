<main class="d-flex flex-column bg-background" style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <?php require_once '_nav_menu.php'?>

    <section class="col-12 col-xl-8 offset-xl-3 d-flex flex-column align-items-start bg-light p-4"
        style="min-height:100vh;">

        <h2>Modifier le contenu des balises de métadonnées</h2>

        <?php foreach ($pages as $page_group): ?>
        <div class="col-12 my-4">
            <h4 id="page_type_<?php echo $page_group["id"] ?>">Type de page: <?php echo $page_group["name"] ?> :</h4>
            <hr class="my-4">
            <?php foreach ($page_group["pages"] as $page): ?>
            <form data-SubmitUrl="<?php echo '/pages/' . $page["id_page"] ?>" class="col-12 col-lg-9"
                action="<?php echo ROOT_PATH . '/pages/' . $page["id_page"] ?>" method="post">
                <div class="row my-2">
                    <div class="col">
                        <h5 class="font-weight-bold">Page : <?php echo $page['name'] ?></h5>
                    </div>
                    <div class="col text-end update-alert">
                        <h5></h5>
                    </div>
                </div>
                <div class="form-group">
                    <label for="title-<?php echo $page["id_page"] ?>">Titre :</label>
                    <input class="form-control" type="text" name="title" id="title-<?php echo $page["id_page"] ?>"
                        value="<?php echo $page["title"] ?>"
                        placeholder="Veuillez choisir un titre descriptif contenant un ensemble de mot clefs pertinents">
                </div>
                <div class="form-group">
                    <label for="description-<?php echo $page["id_page"] ?>">Description :</label>
                    <input class="form-control" type="text" name="description"
                        id="description-<?php echo $page["id_page"] ?>" value="<?php echo $page["description"] ?>"
                        placeholder="Veuillez choisir une description contenant un ensemble de mot clefs pertinents">
                </div>
                <input type="hidden" name="id_page" value="<?php echo $page["id_page"] ?>">
                <input type="hidden" name="page_name" value="<?php echo $page["name"] ?>">
                <button type="submit" class="btn btn-lg btn-primary col-3 my-4">valider</button>
            </form>

            <?php endforeach;?>
        </div>
        <?php endforeach;?>
    </section>

    <section class="col-12 col-xl-8 offset-xl-3 d-flex flex-column align-items-start bg-light p-4"
        style="min-height:100vh;">

        <h2>Modifier les images d'arrière plan</h2>

        <?php foreach ($pages as $page_group): ?>
        <div class="col-12 my-4">
            <h4 id="<?php echo $page_group["id"] ?>">Type de page: <?php echo $page_group["name"] ?> :</h4>
            <hr class="my-4">
            <?php foreach ($page_group["pages"] as $page): ?>
            <div class="row w-100">
                <form class="col-12 col-lg-9 upload" data-SubmitUrl="<?php echo '/pages/' . $page["id_page"] ?>"
                    action="<?php echo ROOT_PATH . '/pages/' . $page["id_page"] ?>" enctype="multipart/form-data"
                    method="post">
                    <div class="row my-2">
                        <div class="col">
                            <h5 class="font-weight-bold">Page : <?php echo $page['name'] ?></h5>
                        </div>
                        <div class="col text-end update-alert">
                            <h5></h5>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="image-<?php echo $page["id_page"] ?>">Image d'arrière plan :</label>
                        <input class="form-control" type="file" name="image" id="image-<?php echo $page["id_page"] ?>"
                            value="<?php echo $page["image_url"] ?>">
                    </div>
                    <input type="hidden" name="id_page" value="<?php echo $page["id_page"] ?>">
                    <input type="hidden" name="page_name" value="<?php echo $page["name"] ?>">
                    <button type="submit" class="btn btn-lg btn-primary col-3 my-4">valider</button>
                </form>
                <div
                    class="d-none d-lg-flex col-lg-3 align-items-center justify-content-center image-preview-container">
                    <?php if (!empty($page['image_url'])): ?>
                    <img src="<?php echo $page['image_url'] ?>" alt="image d'arrière plan de la page"
                        class="h-100 w-100">
                    <?php else: ?>
                    <p>Vous n'avez pas encore choisi d'image d'arrière plan pour cette section</p>
                    <?php endif?>
                </div>
            </div>
            <?php endforeach;?>
        </div>
        <?php endforeach;?>

    </section>

</main>

<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/admin_platform.js' ?> "></script>