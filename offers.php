<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tynkle: Les annonces</title>
    <meta name="author" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="./assets/css/mdb.min.css">
    <link rel="stylesheet" href="./assets/css/commons/main.css">
</head>

<body>
    <?php include_once './commons/navbar.php' ?>
    <main class="bg-white d-flex" style='min-height:100vh;margin-top:5rem'>

        <aside class="d-none col-lg-4 d-lg-flex flex-column p-4 fixed-bottom" style="height:100vh" id="menu-navigation">

            <form action="" method="GET" class="mb-4" style='margin-top:5rem'>

                <h5>Rechercher par categorie: </h5>

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

            <form action="" class="my-4" method="GET">

                <h5>Rechercher par type de panne: </h5>

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

            <form action="" method="POST" class="col-12 col-lg-6">
                <div class="d-flex w-100 align-items-center">
                    <img src="./assets/img/commons/pointer.svg" height="24" width="24" alt="map pointer">
                    <p class="m-2 mb-0">CHERCHER AUTOUR DE MOI</p>
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

        </aside>

        <section class="col-12 col-lg-8 offset-lg-4 d-flex flex-column align-items-center">
            <div class='col-12'>
                <?php for ($count = 0; $count < 100; $count++) : ?>

                    <?php include './assets/partials/publication_card/publication_card.php' ?>

                <?php endfor; ?>
            </div>
        </section>
    </main>
</body>

</html>