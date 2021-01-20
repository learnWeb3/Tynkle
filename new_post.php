<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Offre de dépanage : Titre de l'offre</title>
    <meta name="author" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="./assets/css/mdb.min.css">
    <link rel="stylesheet" href="./assets/css/commons/main.css">
    <link rel="stylesheet" href="./assets/css/pages/offer.css">
    <link rel="shortcut icon" href="./assets/icons/favicon.png" type="image/png">
</head>

<body>
    <?php include_once './commons/navbar.php' ?>
    <main class="bg-brand-blue" style='min-height:100vh;padding-top:3rem'>
        <section id="map-container-header" class="container w-100 p-0 bg-white" style="height:33vh; background-image:url(https://images.pexels.com/photos/205316/pexels-photo-205316.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940); background-position:center; background-size:contain;background-repeat:no-repeat">
        </section>
        <section class="container relative d-flex flex-column align-items-center bg-light p-4 rounded" style='min-height:100vh;'>
            <h1 class="my-4">Publier une annonce :</h1>
            <form action="" method="post" class="col-12 col-md-8 col-lg-6">
                <div class="row">
                    <div class="form-group col-12 col-lg-6 my-2">
                        <label for="">Platforme de l'appareil : </label>
                        <select name="" id="" class="form-control">
                            <option value=""></option>
                        </select>
                    </div>
                    <div class="form-group col-12 col-lg-6 my-2">
                        <label for="">Type de panne : </label>
                        <select name="" id="" class="form-control">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group my-2 col-12 col-lg-6">
                        <label for="">Ville :</label>
                        <input type="text" class="form-control" name="" id="">
                    </div>
                    <div class="form-group my-2 col-12 col-lg-6">
                        <label for="">Code postal :</label>
                        <input type="text" class="form-control" name="" id="">
                    </div>
                </div>
                <div class="form-group my-2">
                    <label for="">Votre budget :</label>
                    <input type="number" class="form-control" name="" id="">
                </div>
                <div class="form-group my-2">
                    <label for="">Choisir un titre pour votre annonce :</label>
                    <input type="text" class="form-control" name="" id="">
                </div>
                <div class="form-group my-2">
                    <label for="">Decriver votre problème : </label>
                    <textarea name="" id="" cols="30" rows="10" class="form-control"></textarea>
                </div>

                <div class="form-group">
                    <label for="">Images / Screenshots</label>
                    <div class="row">
                        <div class="dropzone-group m-4 col-12 col-lg-5">
                            <input type="file" name="" id="" class='dropzone'>
                            <div class="dropzone-layer">
                                <p>cliquer pour ajouter une image</p>
                            </div>
                        </div>
                        <div class="dropzone-group m-4 col-12 col-lg-5">
                            <input type="file" name="" id="" class='dropzone'>
                            <div class="dropzone-layer">cliquer pour ajouter une image</div>
                        </div>
                        <div class="dropzone-group m-4 col-12 col-lg-5">
                            <input type="file" name="" id="" class='dropzone'>
                            <div class="dropzone-layer">cliquer pour ajouter une image</div>
                        </div>
                        <div class="dropzone-group m-4 col-12 col-lg-5">
                            <input type="file" name="" id="" class='dropzone'>
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
</body>

</html>