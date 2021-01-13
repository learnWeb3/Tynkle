<!DOCTYPE html>
<html lang="fr">

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
                    <label for="email">Adresse email *</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="prenom-nom@email.com">
                </div>
                <div class="form-group my-2">
                    <label for="password">Mot de passe *</label>
                    <input type="password" class="form-control">
                </div>
                <div class="form-group my-2">
                    <label for="password_confirmation">Confirmer le mot de passe *</label>
                    <input type="password" id="password_confirmation" name="password_confirmation" class="form-control">
                </div>

                <div class="form-group my-2 d-flex col-12">
                    <div class="col-4">
                        <label for="helper_role">Devenir Helper ?</label>
                    </div>
                    <div class="col-6">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="helper_role" id="helper_role_1" value="option1">
                            <label class="form-check-label" for="helper_role">oui</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="helper_role" id="helper_role_2" value="option2">
                            <label class="form-check-label" for="helper_role_2">non</label>
                        </div>
                    </div>
                </div>
                <button type="submit" class='btn btn-lg btn-success col-12 my-2'>INSCRIPTION</button>

                <?php include_once './commons/shared_links.php' ?>
            </form>
        </section>

    </main>

</body>

</html>