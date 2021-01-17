<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tynkle: Mon compte</title>
    <meta name="author" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="./assets/icons/favicon.png" type="image/png">
    <link rel="stylesheet" href="./assets/css/mdb.min.css">
    <link rel="stylesheet" href="./assets/css/commons/main.css">
    <link rel="stylesheet" href="./assets/css/pages/profile.css">
</head>

<body>

    <?php include_once './commons/navbar.php' ?>


    <main class="d-flex bg-brand-blue" style='min-height:100vh;'>


        <nav class="d-none col-lg-3 d-lg-flex flex-column justify-content-around p-4 fixed-bottom" style="height:100vh;" id="menu-navigation">
            <ul class="nav flex-column w-100">
                <li class="nav-item d-flex align-items-center w-100 my-2">
                    <img src="./assets/icons/account_light.svg" height="36" width="36" alt="account informations">
                    <a class="nav-link active display-6 m-2 font-weight-bold text-white" href="#account_informations">Informations générales</a>
                </li>
                <li class="nav-item d-flex align-items-center w-100 my-2">
                    <img src="./assets/icons/details_light.svg" height="36" width="36" alt="personnal informations">
                    <a class="nav-link display-6 m-2 font-weight-bold text-white" href="#personnal_informations">Informations personnelles</a>
                </li>
                <li class="nav-item w-100 my-2">

                    <ul class="nav flex-column w-100">
                        <li class="font-weight-bold mb-2 d-flex align-items-center"> <img src="./assets/icons/skills_light.svg" height="36" width="36" alt="skills">
                            <a class="nav-link display-6 m-2 font-weight-bold text-white" href="#skills">Compétences</a>
                        </li>
                        <li class="font-weight-bold mb-2 mx-5"><a href="" class="text-white">Catégorie de skill 1</a></li>
                        <li class="font-weight-bold mb-2 mx-5"><a href="" class="text-white">Catégorie de skill 1</a></li>
                        <li class="font-weight-bold mb-2 mx-5"><a href="" class="text-white">Catégorie de skill 1</a></li>
                    </ul>
                </li>
            </ul>

            <ul class="nav flex-column">
                <li class="nav-item d-flex align-items-center w-100 my-2">
                    <img src="./assets/icons/home_light.svg" height="36" width="36" alt="home">
                    <a href="" class="nav-link display-6 font-weight-bold m-2 text-white">Accueil</a>
                </li>
            </ul>

        </nav>

        <div class="col-12 col-lg-8 offset-lg-3 d-flex flex-column align-items-start bg-light p-4" style="min-height:100vh">

            <section style="min-height:95vh" class="w-100 d-flex align-items-center" id="account_informations">
                <form action="" class="w-100 mb-4 p-4">
                    <h2 class="font-weight-bold">Information générales</h2>

                    <h5 class="my-4">Informations obligatoires *</h5>
                    <div class="form-group my-2">
                        <label for="email">Adresse email *</label>
                        <input type="email" name="email" id="email" class="form-control" placeholder="prenom-nom@email.com">
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
                            <label>Devenir Helper ?</label>
                        </div>
                        <div class="col-6">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="helper_role" id="helper_role_1" value="option1">
                                <label class="form-check-label" for="helper_role_1">oui</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="helper_role" id="helper_role_2" value="option2">
                                <label class="form-check-label" for="helper_role_2">non</label>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class='btn btn-lg btn-primary col-12 col-lg-4 my-2'>VALIDER</button>
                </form>
            </section>

            <section id="personnal_informations" class="w-100 d-flex align-items-center" style="min-height:95vh">
                <form action="" class="w-100 my-4 p-4">
                    <h2 class="font-weight-bold">Information personnelles</h2>

                    <h5 class="my-4">Informations obligatoires *</h5>
                    <div class="form-group my-2">
                        <label for="name">Nom *</label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="Dupond">
                    </div>
                    <div class="form-group my-2">
                        <label for="firstname">Prénom *</label>
                        <input type="text" name="firstname" id="firstname" class="form-control" placeholder="Martin">
                    </div>
                    <div class="form-group my-2">
                        <label for="date_of_birth">Date de naissance: *</label>
                        <input type="date" name="date_of_birth" id="date_of_birth" class="form-control">
                    </div>
                    <div class="form-group my-2">
                        <label for="adress">Adresse *</label>
                        <input type="text" name="adress" id="adress" class="form-control" placeholder="221B Baker Street, LONDRES">
                    </div>
                    <div class="form-group my-2">
                        <label for="phone">Téléphone: *</label>
                        <input type="text" name="phone" id="phone" class="form-control" placeholder="+33799999999">
                    </div>
                    <button type="submit" class='btn btn-lg btn-primary col-12 col-lg-4 my-2'>VALIDER</button>
                </form>
            </section>

            <section id="skills" class="w-100 d-flex align-items-center" style="min-height:95vh">
                <form action="" class="w-100 my-4 p-4">
                    <h2 class="font-weight-bold">Compétences</h2>
                    <h5 class="my-4">Informations obligatoires *</h5>


                    <h5>Catégorie de skill 1 : </h5>
                    <div class="row">
                        <ul class="col-12">
                            <li class="row d-flex align-items-start justify-content-between">
                                <div class="col-8">
                                    <p class="mb-0">Je sais diagnostiquer et réparer les ordinateurs et tablettes:</p>
                                </div>
                                <div class="col-4">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_1" value="option1">
                                        <label class="form-check-label" for="helper_role">oui</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_2" value="option2">
                                        <label class="form-check-label" for="helper_role_2">non</label>
                                    </div>
                                </div>
                            </li>
                            <li class="row d-flex align-items-start justify-content-between">
                                <div class="col-8">
                                    <p class="mb-0">Je sais diagnostiquer et réparer les ordinateurs et tablettes:</p>
                                </div>
                                <div class="col-4">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_1" value="option1">
                                        <label class="form-check-label" for="helper_role">oui</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_2" value="option2">
                                        <label class="form-check-label" for="helper_role_2">non</label>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <h5>Catégorie de skill 2 : </h5>
                    <div class="row">
                        <ul class="col-12">
                            <li class="row d-flex align-items-start justify-content-between">
                                <div class="col-8">
                                    <p class="mb-0">Je sais diagnostiquer et réparer les ordinateurs et tablettes:</p>
                                </div>
                                <div class="col-4">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_1" value="option1">
                                        <label class="form-check-label" for="helper_role">oui</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_2" value="option2">
                                        <label class="form-check-label" for="helper_role_2">non</label>
                                    </div>
                                </div>
                            </li>
                            <li class="row d-flex align-items-start justify-content-between">
                                <div class="col-8">
                                    <p class="mb-0">Je sais diagnostiquer et réparer les ordinateurs et tablettes:</p>
                                </div>
                                <div class="col-4">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_1" value="option1">
                                        <label class="form-check-label" for="helper_role">oui</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_2" value="option2">
                                        <label class="form-check-label" for="helper_role_2">non</label>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <h5>Catégorie de skill 3 : </h5>
                    <div class="row">
                        <ul class="col-12">
                            <li class="row d-flex align-items-start justify-content-between">
                                <div class="col-8">
                                    <p class="mb-0">Je sais diagnostiquer et réparer les ordinateurs et tablettes:</p>
                                </div>
                                <div class="col-4">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_1" value="option1">
                                        <label class="form-check-label" for="helper_role">oui</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_2" value="option2">
                                        <label class="form-check-label" for="helper_role_2">non</label>
                                    </div>
                                </div>
                            </li>
                            <li class="row d-flex align-items-start justify-content-between">
                                <div class="col-8">
                                    <p class="mb-0">Je sais diagnostiquer et réparer les ordinateurs et tablettes:</p>
                                </div>
                                <div class="col-4">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_1" value="option1">
                                        <label class="form-check-label" for="helper_role">oui</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_2" value="option2">
                                        <label class="form-check-label" for="helper_role_2">non</label>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <h5>Catégorie de skill 4 : </h5>
                    <div class="row">
                        <ul class="col-12">
                            <li class="row d-flex align-items-start justify-content-between">
                                <div class="col-8">
                                    <p class="mb-0">Je sais diagnostiquer et réparer les ordinateurs et tablettes:</p>
                                </div>
                                <div class="col-4">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_1" value="option1">
                                        <label class="form-check-label" for="helper_role">oui</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_2" value="option2">
                                        <label class="form-check-label" for="helper_role_2">non</label>
                                    </div>
                                </div>
                            </li>
                            <li class="row d-flex align-items-start justify-content-between">
                                <div class="col-8">
                                    <p class="mb-0">Je sais diagnostiquer et réparer les ordinateurs et tablettes:</p>
                                </div>
                                <div class="col-4">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_1" value="option1">
                                        <label class="form-check-label" for="helper_role">oui</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="helper_role" id="helper_role_2" value="option2">
                                        <label class="form-check-label" for="helper_role_2">non</label>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <button type="submit" class='btn btn-lg btn-primary col-12 col-lg-4 my-2'>VALIDER</button>
                </form>
            </section>
        </div>

    </main>

</body>

</html>