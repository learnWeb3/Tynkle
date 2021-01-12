<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tynkle: Mon compte</title>
    <meta name="author" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="./assets/css/mdb.min.css">
    <link rel="stylesheet" href="./assets/css/commons/main.css">
    <link rel="stylesheet" href="./assets/css/pages/chat.css">
</head>

<body>

    <?php include_once './commons/navbar.php' ?>


    <main class="d-flex bg-white" style='min-height:100vh;'>


        <aside class="d-none col-lg-4 d-lg-flex flex-column justify-content-around p-4 fixed-bottom" style="height:100vh" id="menu-navigation">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active display-6" href="">Mes messages</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link display-6" href="">Mon Profil</a>
                </li>
            </ul>

            <ul class="nav flex-column">
                <li class="nav-item display-6"><a href="" class="nav-link">Accueil</a></li>
            </ul>
        </aside>

        <section class="col-12 col-lg-6 offset-lg-4 d-block overflow-auto" style="height:95vh; margin-top:5rem;">
            <?php for ($count = 0; $count <= 100; $count++) : ?>

                <?php include './assets/partials/chat/chat.php'?>
             
            <?php endfor; ?>

        </section>

    </main>

</body>

</html>