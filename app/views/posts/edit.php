<main style="background-image: url(<?php echo $background_image_path ?>);min-height:100vh;padding-top:3rem"
    class="bg-background">
    <section id="map-container-header" class="container-xl w-100 p-0 bg-white"
        style="height:33vh; background-image:url(https://images.pexels.com/photos/205316/pexels-photo-205316.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940); background-position:center; background-size:contain;background-repeat:no-repeat">
    </section>
    <section class="container-xl relative d-flex flex-column align-items-center bg-white p-4 rounded"
        style='min-height:100vh;'>
        <h1 class="my-4 display-4 text-dark">Editer une annonce :</h1>
        <strong><small>* champs obligatoires</small></strong>
        <hr>
        <form action="<?php echo ROOT_PATH . "/posts/" . $post['id'] ?>" method="post" class="col-12 col-md-8 col-lg-6"
            enctype="multipart/form-data">

            <h3 class="text-dark">1 - Panne rencontrée : </h3>

            <hr>
            <div class="form-group col-12 my-2">
                <label for="id_platform">Categorie de l'appareil : * </label>
                <select name="id_platform" id="id_platform" class="form-control" required>
                    <?php foreach ($platforms as $platform): ?>
                    <option value="<?php echo $platform['id'] ?>"> <?php echo $platform['name'] ?></option>
                    <?php endforeach;?>
                </select>
            </div>
            <div class="form-group col-12 my-2">
                <label for="id_breakdown_category">Type de panne : * </label>
                <select name="id_breakdown_category" id="id_breakdown_category" class="form-control" required>
                    <?php foreach ($breakdown_categories as $breakdown_category): ?>
                    <option value="<?php echo $breakdown_category['id'] ?>"
                        <?php echo $post['breakdown_category_id'] === $breakdown_category['id'] && 'selected' ?>>
                        <?php echo $breakdown_category['name'] ?></option>
                    <?php endforeach;?>
                </select>
            </div>

            <div class="form-group col-12 my-2">
                <label class='' for="technical_details">Système d'exploitation / Marque et modèle de l'appareil * : </label>
                <input type="text" name="technical_details" id="technical_details" class="form-control form-control-lg"
                    required placeholder="SAMSUNG GALAXY S5 ANDROID Nougat 7.0">
                  
            </div>

            <h3 class="mt-4 text-dark">2- Localisation : </h3>

            <hr>
            <div class="row" id="maps" data-apiKey="<?php echo $_ENV['GOOGLE_JS_MAPS_API_KEY'] ?>">
                <div class="form-group my-2 col-12">
                    <label class='' for="adress">Entrer votre adresse * :</label>
                    <input type="text" class="form-control form-control-lg" name="adress" id="adress" required>
                    <input type="hidden" name="lat" id="lat" value="<?php echo $post['lat'] ?>">
                    <input type="hidden" name="lng" id="lng" value="<?php echo $post['lon'] ?>">
                </div>
            </div>

            <div class="form-group my-2 col-12">
                <label class='' for="city">Ville : * </label>
                <input type="text" class="form-control form-control-lg" value="<?php echo $post['city'] ?>" name="city" id="locality" maxlength="100"
                    required>
            </div>
            <div class="form-group my-2 col-12">
                <label class='' for="postal_code">Code postal : * </label>
                <input type="text" class="form-control form-control-lg" value="<?php echo $post['postal_code'] ?>" name="postal_code" id="postal_code"
                    pattern="\d{5}" data-bouncer-message="Le code postal n'est pas valide" required>
            </div>

            <h3 class="mt-4 text-dark">3- Votre annonce : </h3>
            <hr>
            <div class="form-group my-2">
                <label for="budget">Votre budget : * </label>
                <input type="number" class="form-control" name="budget" id="budget"
                    value='<?php echo $post['budget'] ?>' required>
            </div>
            <div class="form-group my-2">
                <label for="title">Choisir un titre pour votre annonce : * </label>
                <input type="text" class="form-control" name="title" id="title" value="<?php echo $post['title'] ?>"
                    maxlength="100" required>
            </div>
            <div class="form-group my-2">
                <label for="content">Decriver votre problème : * </label>
                <textarea name="content" id="content" cols="30" rows="10" class="form-control" maxlength="2500"
                    required><?php echo $post['content'] ?></textarea>
            </div>

            <div class="form-group my-2">
                <label>Images / Screenshots</label>
                <div class="row">
                    <?php for ($count = 1; $count <= 4; $count++): ?>
                    <div class="dropzone-group my-4 mx-xl-4 col-12 col-lg-5 p-0">
                        <input type="file" name="image_<?php echo $count ?>" id="image_<?php echo $count ?>"
                            class='dropzone'>
                        <div class="dropzone-layer">
                            <p>cliquer pour ajouter une image</p>
                        </div>
                    </div>
                    <?php endfor;?>
                </div>
            </div>


            <div class="form-group my-2 d-flex col-12">
                <div class="col-4">
                    <label class="font-weight-bold">Panne résolue ?</label>
                </div>
                <div class="col-6">
                    <div class="form-check form-check-inline">
                        <?php if ($post['is_solved']): ?>
                        <input class="form-check-input" type="radio" name="is_solved" id="is_solved_1" value="1"
                            checked>
                        <?php else: ?>
                        <input class="form-check-input" type="radio" name="is_solved" id="is_solved_1" value="1">
                        <?php endif;?>
                        <label class="form-check-label" for="is_solved_1">oui</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <?php if (!$post['is_solved']): ?>
                        <input class="form-check-input" type="radio" name="is_solved" id="is_solved_2" value="0"
                            checked>
                        <?php else: ?>
                        <input class="form-check-input" type="radio" name="is_solved" id="is_solved_2" value="0">
                        <?php endif;?>
                        <label class="form-check-label" for="is_solved_2">non</label>
                    </div>
                </div>
            </div>

            <button type="submit" class='btn btn-lg btn-primary col-12 my-4'>EDITER</button>
        </form>
    </section>
</main>

<script type="module" src="<?php echo ROOT_PATH ?>/app/assets/js/posts/new_post.js"></script>
<script
    src="https://maps.googleapis.com/maps/api/js?key=<?php echo $_ENV['GOOGLE_JS_MAPS_API_KEY']; ?>&libraries=places">