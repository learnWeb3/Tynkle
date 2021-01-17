<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tynkle: Les annonces</title>
    <meta name="author" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="./assets/icons/favicon.png" type="image/png">
    <link rel="stylesheet" href="./assets/css/mdb.min.css">
    <link rel="stylesheet" href="./assets/css/commons/main.css">
</head>

<body class="bg-light-grey">
    <?php include_once './commons/navbar.php' ?>
    <main class="d-flex bg-map" style='min-height:100vh;margin-top:3rem;'>
        <div class='bg-brand-blue d-flex' style="min-height: 100vh;width:100vw">
            <section class="d-none col-lg-3 d-lg-flex flex-column p-4 fixed-bottom" style="height:100vh;" id="menu-navigation">

                <div class="container bg-white w-100 shadow p-4" style="margin-top: 15%;">
                    <h4 class="font-weight-bold">Rechercher une annonce:</h4>
                    <hr>
                    <form action="" method="GET" class="bg-light">
                        <h5 class="font-weight-bold">Rechercher par categorie: </h5>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="category-1">
                            <label class="form-check-label" for="category-1">
                                Titre Categorie 1
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="category-2">
                            <label class="form-check-label" for="category-2">
                                Titre Categorie 2
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="category-3">
                            <label class="form-check-label" for="category-3">
                                Titre Categorie 3
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="category-4">
                            <label class="form-check-label" for="category-4">
                                Titre Categorie 4
                            </label>
                        </div>
                    </form>
                    <hr>
                    <form action="" class="bg-light" method="GET">
                        <h5 class="font-weight-bold">Rechercher par type de panne: </h5>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="breakdown_type-1">
                            <label class="form-check-label" for="breakdown_type-1">
                                Libellé type de panne 1
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="breakdown_type-2">
                            <label class="form-check-label" for="breakdown_type-2">
                                Libellé type de panne 2
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="breakdown_type-3">
                            <label class="form-check-label" for="breakdown_type-3">
                                Libellé type de panne 3
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="breakdown_type-4">
                            <label class="form-check-label" for="breakdown_type-4">
                                Libellé type de panne 4
                            </label>
                        </div>
                    </form>
                    <hr>
                    <form action="" method="POST" class="col-12 bg-light">
                        <div class="d-flex w-100 align-items-center">
                            <img src="./assets/img/commons/pointer.svg" height="24" width="24" alt="map pointer">
                            <h5 class="m-2 font-weight-bold">Chercher autour de moi</h5>
                        </div>

                        <div class="form-group my-2">
                            <select name="search_radius" id="search_radius" class="col-12">
                                <option value="50">50 km</option>
                                <option value="100">100 km</option>
                                <option value="250">250 km</option>
                                <option value="500">500 km</option>
                            </select>
                        </div>
                    </form>
                </div>

            </section>

            <section class="col-12 col-lg-8 offset-lg-3 bg-white d-flex flex-wrap">
                <?php for ($count = 0; $count < 100; $count++) : ?>
                    <?php include './assets/partials/publication_card/publication_card.php' ?>
                <?php endfor; ?>
            </section>

        </div>

    </main>
</body>

</html>