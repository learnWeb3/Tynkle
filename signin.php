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
    <link rel="stylesheet" href="./assets/css/pages/signin.css">
</head>

<body>

    <?php include_once './commons/navbar.php' ?>


    <main class="d-flex flex-column justify-content-center bg-signin" style='min-height:100vh;'>

        <section class="col-12 col-lg-4 offset-lg-1 d-flex align-items-center p-4 rounded-3 bg-white" id='sign-container'>
            <form action="" class="w-100 p-lg-4">
                <h1 class="font-weight-bold">De retour parmis nous ?</h1>

                <h5 class="my-4">Informations obligatoires *</h5>
                <div class="form-group my-4">
                    <label for="email">Adresse email *</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="prenom-nom@email.com">
                </div>
                <div class="form-group my-4">
                    <label for="password">Mot de passe *</label>
                    <input type="password" id="password" name="password" class="form-control">
                </div>
                <button type="submit" class='btn btn-lg btn-primary col-12 my-4'>CONNEXION</button>
                <p class="font-weight-bold text-center">ou</p>
                <a href="" class="col-12 btn btn-lg btn-white d-flex align-items-center justify-content-center position-relative font-weight-bold mt-4 mb-2"><img src="./assets/icons/google_brand.png" class="position-absolute mx-2" alt="signin with google" style='left:0;'>Se connecter avec google</a>
                <?php include_once './commons/shared_links.php' ?>
            </form>
        </section>
    </main>

</body>

</html>