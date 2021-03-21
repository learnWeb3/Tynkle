<main class="bg-background"
    style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;padding-top:3rem'>
    <section id="map-container-header" class="container-xl w-100 p-0 bg-light"
        style="height:33vh; background-image:url(https://images.pexels.com/photos/205316/pexels-photo-205316.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940); background-position:center; background-size:contain;background-repeat:no-repeat">
    </section>
    <section class="container-xl relative d-flex flex-column align-items-center bg-light p-4 rounded"
        style='min-height:100vh;'>
        <h1 class="my-4 display-4 text-dark">Publier une annonce :</h1>
        <strong><small>* champs obligatoires</small></strong>
        <hr>
        <form action="<?php echo ROOT_PATH.'/posts' ?>" method="post" class="col-12 col-lg-6" method="POST"
            enctype='multipart/form-data'>

            <h3 class="text-dark">1 - Panne rencontrée : </h3>

            <hr>

            <div class="form-group col-12 my-2">
                <label class='' for="id_platform">Catégorie de l'appareil * : </label>
                <select name="id_platform" id="id_platform" class="form-control form-control-lg">
                    <?php foreach ($platforms as $platform) : ?>
                    <option value="<?php echo $platform['id'] ?>"> <?php echo $platform['name'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group col-12 my-2">
                <label class='' for="id_breakdown_category">Type de panne * : </label>
                <select name="id_breakdown_category" id="id_breakdown_category" class="form-control form-control-lg"
                    required>
                    <?php foreach ($breakdown_categories as $breakdown_category) : ?>
                    <option value="<?php echo $breakdown_category['id'] ?>"><?php echo $breakdown_category['name'] ?>
                    </option>
                    <?php endforeach; ?>
                </select>
            </div>

            <h3 class="mt-4 text-dark">2- Localisation : </h3>

            <hr>
            <div class="row" id="maps" data-apiKey="<?php echo $_ENV['GOOGLE_JS_MAPS_API_KEY'] ?>">
                <div class="form-group my-2 col-12">
                    <label class='' for="adress">Entrer votre adresse * :</label>
                    <input type="text" class="form-control form-control-lg" name="adress" id="adress" required>
                    <input type="hidden" name="lat" id="lat">
                    <input type="hidden" name="lng" id="lng">
                </div>
            </div>
            <div class="form-group my-2 col-12">
                <label class='' for="city">Ville : * </label>
                <input type="text" class="form-control form-control-lg" name="city" id="locality" maxlength="100"
                    required>
            </div>
            <div class="form-group my-2 col-12">
                <label class='' for="postal_code">Code postal : * </label>
                <input type="text" class="form-control form-control-lg" name="postal_code" id="postal_code"
                    pattern="\d{5}" data-bouncer-message="Le code postal n'est pas valide" required>
            </div>

            <h3 class="mt-4 text-dark">3- Votre annonce : </h3>
            <hr>
            <div class="form-group my-2">
                <label class='' for="budget">Votre budget : * </label>
                <input type="number" class="form-control form-control-lg" name="budget" id="budget" required>
            </div>
            <div class="form-group my-2">
                <label class='' for="title">Choisir un titre pour votre annonce : * </label>
                <input type="text" class="form-control form-control-lg" name="title" id="title" maxlength="55" required>
            </div>
            <div class="form-group my-2">
                <label class='' for="content">Decriver votre problème : * </label>
                <textarea name="content" id="content" cols="30" rows="10" class="form-control form-control-lg"
                    maxlength="2500" required></textarea>
            </div>

            <div class="form-group">
                <label class=''>Images / Screenshots</label>
                <div class="row">
                    <?php for ($count = 1; $count <= 4; $count++) : ?>
                    <div class="dropzone-group my-4 mx-xl-4 col-12 col-lg-5 p-0">
                        <input type="file" name="image_<?php echo $count ?>" id="image_<?php echo $count ?>"
                            class='dropzone'>
                        <div class="dropzone-layer">
                            <p>cliquer pour ajouter une image</p>
                        </div>
                    </div>
                    <?php endfor; ?>
                </div>
            </div>
            <button type="submit" class='btn btn-lg btn-primary col-12 my-4'>publier</button>
        </form>
    </section>
</main>

<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/posts/new_post.js' ?>"></script>
<script
    src="https://maps.googleapis.com/maps/api/js?key=<?php echo $_ENV['GOOGLE_JS_MAPS_API_KEY']; ?>&libraries=places">