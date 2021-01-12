<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Se connecter</title>
    <meta name="author" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="./assets/css/mdb.min.css">
    <link rel="stylesheet" href="./assets/css/commons/main.css">
    <link rel="stylesheet" href="./assets/css/pages/signup.css">
</head>

<body>

    <?php include_once './commons/navbar.php' ?>


    <main class="d-flex flex-column justify-content-center bg-signup" style='min-height:100vh;'>

        <section class="col-12 col-lg-4 offset-lg-1 d-flex align-items-center p-4 rounded-3 bg-white-overlay" id='sign-container'>
            <form action="" class="w-100 d-block overflow-auto">
                <h1>Rejoindre Tynkle</h1>

                <h5 class="my-4">Informations obligatoires *</h5>
                <div class="form-group my-2">
                    <div class="label">Adresse email *</div>
                    <input type="email" class="form-control">
                </div>
                <div class="form-group my-2">
                    <div class="label">Mot de passe *</div>
                    <input type="password" class="form-control">
                </div>
                <div class="form-group my-2">
                    <div class="label">Confirmer le mot de passe *</div>
                    <input type="password" class="form-control">
                </div>

                <div class="form-check form-switch my-2">
                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>
                    <label class="form-check-label" for="flexSwitchCheckChecked">Devenir Helper ?</label>
                </div>
                <button type="submit" class='btn btn-lg btn-success col-12 my-4'>INSCRIPTION</button>

                <?php include_once './commons/shared_links.php' ?>
            </form>
        </section>

    </main>

</body>

</html>