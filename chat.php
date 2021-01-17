<!DOCTYPE html>
<html lang="fr">

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
    <main class="d-flex bg-brand-blue" style='min-height:100vh;'>
        <nav class="d-none col-lg-3 d-lg-flex flex-column justify-content-around p-4 fixed-bottom" style="height:100vh" id="menu-navigation">
            <ul class="nav flex-column w-100">
                <li class="nav-item d-flex align-items-center w-100 my-2">
                    <img src="./assets/icons/message_light.svg" height="36" width="36" alt="my chats">
                    <a class="nav-link active display-6 m-2 text-white font-weight-bold" href="">Mes messages</a>
                </li>
                <li class="nav-item d-flex align-items-center w-100 my-2">
                    <img src="./assets/icons/account_light.svg" height="36" width="36" alt="account informations">
                    <a class="nav-link active display-6 m-2 text-white font-weight-bold" href="">Mon profil</a>
                </li>
            </ul>

            <ul class="nav flex-column w-100">
                <li class="nav-item d-flex align-items-center w-100 my-2">
                    <img src="./assets/icons/home_light.svg" height="36" width="36" alt="home">
                    <a class="nav-link active display-6 m-2 text-white font-weight-bold" href="">Accueil</a>
                </li>
            </ul>
        </nav>
        <section class="col-12 col-lg-8 offset-lg-3 d-flex flex-column overflow-auto bg-white p-4" style="height:95vh; margin-top:3rem;" id="current-conversation">
        <div class="row py-2">
        <div class="col-2 d-flex justify-content-start align-items-center"><img src="./assets/icons/chevron-left.svg" height="48" width="36" alt="back to conversations" style="cursor:pointer"></div>
        <div class="col-10 d-flex justify-content-end align-items-center"><p class="font-weight-bold mb-0">18 messages</p></div>
        </div>
            <?php for ($count = 0; $count <= 10; $count++) : ?>
                
                <?php $sender = $count % 5 === 0 ? true : false;  ?>
                <?php include './assets/partials/message/message.php' ?>
            <?php endfor; ?>
        </section>
    </main>
</body>

</html>