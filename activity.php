<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon activité sur Tynkle</title>
    <meta name="author" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="./assets/css/mdb.min.css">
    <link rel="stylesheet" href="./assets/css/commons/main.css">
    <link rel="stylesheet" href="./assets/css/pages/activity.css">
</head>

<body>
    <?php include_once './commons/navbar.php' ?>
    <main class="bg-white" style='min-height:100vh;margin-top:5rem'>
        <section class="container d-flex flex-column align-items-center">
            <div class="row col-12 justify-content-center">
                <button class="btn btn-lg btn-brand col-5 col-lg-3 m-2 active">Mes annonces</button>
                <button class="btn btn-lg btn-brand col-5 col-lg-3 m-2">Mes demandes</button>
            </div>
            <div class="d-flex w-100 align-self-start px-2 py-4">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                    <label class="form-check-label" for="flexCheckDefault">
                        En ligne
                    </label>
                </div>
                <div class="form-check" style='margin-left:2rem;'>
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                    <label class="form-check-label" for="flexCheckChecked">
                        Archivées
                    </label>
                </div>
            </div>
            <div class='col-12'>
                <?php for ($count = 0; $count < 100; $count++) : ?>

                    <?php include './assets/partials/publication_card/publication_card.php' ?>

                <?php endfor; ?>
            </div>
        </section>
    </main>
</body>

</html>