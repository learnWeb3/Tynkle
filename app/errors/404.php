<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>403-Accès interdit</title>
    <link rel="shortcut icon" href="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/favicon.png" type="image/png">
    <!-- MATERIALIZE FOR BOOTSTRAP MDB LIBRARY  -->
    <link rel="stylesheet" href="<?php echo ABSOLUTE_ASSET_PATH ?>/css/mdb.min.css">
       <!-- COMMON CSS -->
       <link rel="stylesheet" href="<?php echo ABSOLUTE_ASSET_PATH ?>/css/commons/main.css">
    <!-- BOOTSTRAP JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous">
    </script>
</head>

<body>

    <?php include_once __DIR__.'/../views/templates/navbar_error.php'?>

    <div class="container-fluid d-flex align-items-center justify-content-center p-4" style="min-height: 100vh">


        <div class="col-lg-6 col-12 d-flex flex-column align-items-center justify-content-center">
          
            <img src="<?php echo ROOT_PATH ?>/app/errors/img/404.svg" alt="" class="img-fluid w-50 h-50">
            <h1 class="text-center display-4"><strong class="font-weight-bold">404</strong> La page n'existe pas.</h1>

        </div>

    </div>

    <?php include_once __DIR__.'/../views/templates/footer.php'?>
</body>

</html>