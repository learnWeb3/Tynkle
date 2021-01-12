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
    <link rel="stylesheet" href="./assets/css/pages/signin.css">
</head>

<body>

    <?php include_once './commons/navbar.php' ?>


    <main class="d-flex flex-column justify-content-center bg-signin" style='min-height:100vh;'>

        <section class="col-12 col-lg-4 offset-lg-1 d-flex align-items-center p-4 rounded-3 bg-white-overlay" id='sign-container'>
            <form action="" class="w-100">
                <h1>De retour parmis nous ?</h1>

                <h5 class="my-4">Informations obligatoires *</h5>
                <div class="form-group my-2">
                    <label for="email">Adresse email *</label>
                    <input type="email" name="email" id="email" class="form-control">
                </div>
                <div class="form-group my-2">
                    <label for="password">Mot de passe *</label>
                    <input type="password" id="password" name="password" class="form-control">
                </div>
                <button type="submit" class='btn btn-lg btn-primary col-12 my-2'>CONNEXION</button>
                <?php include_once './commons/shared_links.php' ?>
            </form>
        </section>

    </main>

</body>

</html>