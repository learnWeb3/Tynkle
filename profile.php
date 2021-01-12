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
    <link rel="stylesheet" href="./assets/css/pages/profile.css">
</head>

<body>

    <?php include_once './commons/navbar.php' ?>


    <main class="d-flex bg-white" style='min-height:100vh;'>


        <aside class="d-none col-lg-4 d-lg-flex flex-column justify-content-around p-4 fixed-bottom" style="height:100vh" id="menu-navigation">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active display-6" href="#account_informations">Informations générales</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link display-6" href="#personnal_informations">Informations personnelles</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link display-6" href="#skills">Compétences</a>
                </li>
            </ul>

            <ul class="nav flex-column">
                <li class="nav-item display-6"><a href="" class="nav-link">Accueil</a></li>
            </ul>
        </aside>

        <div class="col-12 col-lg-6 offset-lg-4 d-flex flex-column align-items-start bg-white p-4" style="min-height:100vh">

            <section style="min-height:95vh" class="w-100 d-flex align-items-center" id="account_informations">
                <form action="" class="w-100 mb-4">
                    <h1>Information générales</h1>

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
                            <label for="helper_role">Devenir Helper ?</label>
                        </div>
                        <div class="col-6">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="helper_role" id="helper_role_1" value="option1">
                                <label class="form-check-label" for="helper_role">oui</label>
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
                <form action="" class="w-100 my-4">
                    <h1>Information personnelles</h1>

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
                <form action="" class="w-100 my-4">
                    <h1>Compétences</h1>
                    <h5 class="my-4">Informations obligatoires *</h5>
                    <div class="row">
                        <ul class="nav col-4 d-block overflow-auto px-2" style='max-height:75vh'>
                            <li class="font-weight-bold mb-2">Catégorie de skill 1</li>
                            <li class="font-weight-bold mb-2">Catégorie de skill 1</li>
                            <li class="font-weight-bold mb-2">Catégorie de skill 1</li>
                            <li class="font-weight-bold mb-2">Catégorie de skill 1</li>
                        </ul>
                        <ul class="col-8">
                            <li class="row d-flex align-items-start justify-content-between">
                                <div class="col-8">
                                    <p class="mb-0"> Je sais diagnostiquer et réparer les ordinateurs et tablettes:</p>
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