<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Offre de dépanage : Titre de l'offre</title>
    <meta name="author" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="./assets/css/mdb.min.css">
    <link rel="stylesheet" href="./assets/css/commons/main.css">
    <link rel="stylesheet" href="./assets/css/pages/offer.css">
    <link rel="shortcut icon" href="./assets/icons/favicon.png" type="image/png">
</head>

<body>
    <?php include_once './commons/navbar.php' ?>
    <main class="bg-brand-blue" style='min-height:100vh;padding-top:4rem'>
        <section id="map-container-header" class="container w-100 p-0 bg-white" style="height:33vh; background-image:url(https://images.pexels.com/photos/205316/pexels-photo-205316.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940); background-position:center; background-size:contain;background-repeat:no-repeat">
        </section>
        <section class="container relative d-flex flex-column align-items-center bg-light p-4 rounded" style='min-height:100vh;'>
            <div id="avatar" class="shadow-sm bg-white my-4">

            </div>

            <p class="font-weight-bold font-italic">Identifiant</p>

            <h1 class="font-weight-bold text-center my-4">Titre de l'annonce</h1>



            <div class="w-100 d-flex align-items-center justify-content-start my-2">
                <img src="" alt="">
                <h3 class="m-2 font-weight-bold">Catégorie - Sous Catégorie</h3>
            </div>
            <div class="w-100 d-flex align-items-center justify-content-start my-2">
                <img src="" alt="">
                <h3 class="m-2 font-weight-bold"> 20.00 &euro;</h3>
            </div>
            <div class="w-100 d-flex align-items-center justify-content-start my-2">
                <img src="./assets/icons/pointer.svg" height="24" width="24" alt="map pointer">
                <h3 class="m-2 font-weight-bold">Marseille (13003)</h3>
            </div>
            <div class="row my-4 px-0">
                <h4 class="my-2 font-weight-bold">Description: </h4>
                <p>
                    Lorem ipsum dolor sit, amet consectetur adipisicing elit. Itaque distinctio eveniet recusandae, architecto temporibus illo error esse rerum magni illum fugit explicabo iste vero tempora nulla voluptate omnis reiciendis expedita!
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Rerum amet assumenda aliquam. Architecto, blanditiis vel obcaecati, possimus nesciunt quis laboriosam doloremque eos cum rerum distinctio similique mollitia at omnis nisi?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium, facere veniam. At veniam omnis praesentium, quos provident molestiae fugit deleniti commodi nostrum, perferendis, reprehenderit suscipit minus amet et dicta rem.
                </p>
            </div>


            <div class="w-100 my-4 px-0">
                <h4 class="font-weight-bold">Localisation :</h2>
                    <div id="pictures-container" class="relative bg-white shadow-sm" style="height:50vh">
                    </div>
            </div>

            <div class="w-100 my-4 px-0">
                <h4 class="font-weight-bold">Images - screenshots :</h2>
                    <div class="card-columns" style="min-height:50vh">
                        <div class="card">
                            <img class="img-fluid" src="https://images.pexels.com/photos/1476321/pexels-photo-1476321.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="">
                        </div>
                        <div class="card">
                            <img class="img-fluid" src="https://images.pexels.com/photos/2628105/pexels-photo-2628105.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="">
                        </div>
                        <div class="card">
                            <img class="img-fluid" src="https://images.pexels.com/photos/257736/pexels-photo-257736.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="">
                        </div>

                    </div>
            </div>

            <div class="col-12 d-flex align-items-center justify-content-between flex-wrap my-4">
                <button class="btn btn-lg btn-brand active col-12 col-lg-4 m-2">CONTACTER</button>

                <button class="btn btn-lg btn-brand active col-12 col-lg-4 m-2">PROPOSER UN DEVIS</button>
            </div>


        </section>
    </main>
</body>

</html>