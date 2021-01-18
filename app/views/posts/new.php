<main class="bg-brand-blue" style='min-height:100vh;padding-top:4rem'>
    <section id="map-container-header" class="container w-100 p-0 bg-white" style="height:33vh; background-image:url(https://images.pexels.com/photos/205316/pexels-photo-205316.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940); background-position:center; background-size:contain;background-repeat:no-repeat">
    </section>
    <section class="container relative d-flex flex-column align-items-center bg-light p-4 rounded" style='min-height:100vh;'>
        <h1 class="my-4">Publier une annonce :</h1>
        <form action="" method="post" class="col-12 col-md-8 col-lg-6">
            <div class="row">
                <div class="form-group col-12 col-lg-6 my-2">
                    <label for="id_platform">Platforme de l'appareil : </label>
                    <select name="id_platform" id="id_platform" class="form-control">
                        <?php foreach ($platforms as $platform) : ?>
                            <option value="<?php echo htmlspecialchars($platform['id']) ?>"> <?php echo htmlspecialchars($platform['name']) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="form-group col-12 col-lg-6 my-2">
                    <label for="id_breakdown_category">Type de panne : </label>
                    <select name="id_breakdown_category" id="id_breakdown_category" class="form-control">
                        <?php foreach ($breakdown_categories as $breakdown_category) : ?>
                            <option value="<?php echo htmlspecialchars($breakdown_category['id']) ?>"><?php echo htmlspecialchars($breakdown_category['name']) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="form-group my-2 col-12 col-lg-6">
                    <label for="city">Ville :</label>
                    <input type="text" class="form-control" name="city" id="city">
                </div>
                <div class="form-group my-2 col-12 col-lg-6">
                    <label for="postal_code">Code postal :</label>
                    <input type="text" class="form-control" name="postal_code" id="postal_code">
                </div>
            </div>
            <div class="form-group my-2">
                <label for="budget">Votre budget :</label>
                <input type="number" class="form-control" name="budget" id="budget">
            </div>
            <div class="form-group my-2">
                <label for="title">Choisir un titre pour votre annonce :</label>
                <input type="text" class="form-control" name="title" id="title">
            </div>
            <div class="form-group my-2">
                <label for="content">Decriver votre problème : </label>
                <textarea name="content" id="content" cols="30" rows="10" class="form-control"></textarea>
            </div>

            <div class="form-group">
                <label>Images / Screenshots</label>
                <div class="row">
                    <div class="dropzone-group m-4 col-12 col-lg-5">
                        <input type="file" name="image_one" id="image_one" class='dropzone'>
                        <div class="dropzone-layer">
                            <p>cliquer pour ajouter une image</p>
                        </div>
                    </div>
                    <div class="dropzone-group m-4 col-12 col-lg-5">
                        <input type="file" name="image_two" id="image_two" class='dropzone'>
                        <div class="dropzone-layer">cliquer pour ajouter une image</div>
                    </div>
                    <div class="dropzone-group m-4 col-12 col-lg-5">
                        <input type="file" name="image_three" id="image_three" class='dropzone'>
                        <div class="dropzone-layer">cliquer pour ajouter une image</div>
                    </div>
                    <div class="dropzone-group m-4 col-12 col-lg-5">
                        <input type="file" name="image_four" id="image_four" class='dropzone'>
                        <div class="dropzone-layer">cliquer pour ajouter une image</div>
                    </div>
                </div>
            </div>
            <button type="submit" class='btn btn-lg btn-brand active col-12 my-4'>publier</button>
        </form>
    </section>
</main>

<script>
    Array.from(document.querySelectorAll('.dropzone-layer'))
        .map((domElement) => domElement.addEventListener('click', function(event) {
            Array.from(domElement.parentElement.children)[0].click();
        }));
</script>