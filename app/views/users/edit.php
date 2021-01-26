<main class="d-flex bg-brand-blue" style='min-height:100vh;'>

    <?php require_once './app/views/users/_edit_nav_menu.php' ?>

    <div class="col-12 col-xl-8 offset-xl-3 d-flex flex-column align-items-start bg-light p-4" style="min-height:100vh; margin-top:3.5rem">

        <section style="min-height:95vh" class="w-100 d-flex align-items-center" id="account_informations">
            <form action="<?php echo ROOT_PATH . '/users/' . $user['id'] ?>" class="w-100 mb-4 p-4" method="POST">
                <h2 class="font-weight-bold">Information générales</h2>
                <h5 class="my-4">Informations obligatoires *</h5>
                <div class="form-group my-2">
                    <label for="username">Adresse email *</label>
                    <input type="text" name="username" id="username" class="form-control" placeholder="prenom.nom" value="<?php echo $user['username'] ?>">
                </div>
                <div class="form-group my-2">
                    <label for="email">Adresse email *</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="prenom-nom@email.com" value="<?php echo $user['email'] ?>">
                </div>
                <div class="form-group my-2">
                    <label for="password">Mot de passe *</label>
                    <input type="password" name="password" id="password" class="form-control">
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
                            <?php if ($user['is_helper']) : ?>
                                <input class="form-check-input" type="radio" name="is_helper" id="is_helper_1" value="1" checked>
                            <?php else : ?>
                                <input class="form-check-input" type="radio" name="is_helper" id="is_helper_1" value="1">
                            <?php endif; ?>
                            <label class="form-check-label" for="is_helper_1">oui</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <?php if (!$user['is_helper']) : ?>
                                <input class="form-check-input" type="radio" name="is_helper" id="is_helper_0" value="0" checked>
                            <?php else : ?>
                                <input class="form-check-input" type="radio" name="is_helper" id="is_helper_0" value="1">
                            <?php endif; ?>
                            <label class="form-check-label" for="is_helper_0">non</label>
                        </div>
                    </div>
                </div>
                <button type="submit" class='btn btn-lg btn-primary col-12 col-lg-4 my-2'>VALIDER</button>
            </form>
        </section>

        <section id="personnal_informations" class="w-100 d-flex align-items-center" style="min-height:95vh">
            <form action="<?php echo ROOT_PATH . '/users/' . $user['id'] ?>" class="w-100 my-4 p-4" method="POST">
                <h2 class="font-weight-bold">Information personnelles</h2>
                <h5 class="my-4">Informations obligatoires *</h5>
                <div class="form-group my-2">
                    <label for="lastname">Nom :</label>
                    <input type="text" name="lastname" id="lastname" class="form-control" placeholder="Dupond" value="<?php echo $user['lastname'] ?>">
                </div>
                <div class="form-group my-2">
                    <label for="firstname">Prénom :</label>
                    <input type="text" name="firstname" id="firstname" class="form-control" placeholder="Martin" value='<?php echo $user['firstname'] ?>'>
                </div>
                <div class="form-group my-2">
                    <label for="birthdate">Date de naissance :</label>
                    <input type="date" name="birthdate" id="birthdate" class="form-control" value="<?php echo $user['birthdate'] ?>">
                </div>
                <div class="form-group my-2">
                    <label for="adress">Adresse :</label>
                    <input type="text" name="adress" id="adress" class="form-control" placeholder="221B Baker Street" value="<?php echo $user['adress'] ?>">
                </div>
                <div class="form-group my-2">
                    <label for="city">Ville :</label>
                    <input type="text" name="city" id="city" class="form-control" placeholder="LONDRES" value="<?php echo $user['city'] ?>">
                </div>
                <div class="form-group my-2">
                    <label for="postal_code">Code postal :</label>
                    <input type="text" name="postal_code" id="postal_code" class="form-control" placeholder="28000" value="<?php echo $user['postal_code'] ?>">
                </div>
                <div class="form-group my-2">
                    <label for="phone_number">Téléphone :</label>
                    <input type="text" name="phone_number" id="phone" class="form-control" placeholder="+33799999999" value="<?php echo $user['phone_number'] ?>">
                </div>
                <button type="submit" class='btn btn-lg btn-primary col-12 col-lg-4 my-2'>VALIDER</button>
            </form>
        </section>

        <div id="skills" class="w-100 d-flex align-items-center" style="min-height:95vh">
            <form action="<?php echo ROOT_PATH . '/users/' . $user['id'] . '/skills' ?>" class="w-100 my-4 p-4" method="POST">
                <h2 class="font-weight-bold">Compétences</h2>
                <h5 class="my-4">Informations obligatoires *</h5>
                <?php foreach ($platforms as $i => $platform) : ?>
                    <h4 class="font-weight-bold" id="platform-<?php echo $platform['id'] ?>"><?php echo $platform['name'] ?></h4>
                    <?php foreach ($platform['breakdown_categories'] as $index => $breakdown_category_skill) : ?>
                        <h5><?php echo $breakdown_category_skill['name'] ?></h5>
                        <div class="row">
                            <ul class="col-12">
                                <?php foreach ($breakdown_category_skill['skills'] as $index => $skill) : ?>
                                    <li class="row d-flex align-items-start justify-content-between">
                                        <div class="col-8">
                                            <p class="mb-0"><?php echo $skill['skill_name'] ?></p>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-check form-check-inline">
                                                <?php if ($skill['is_owned']) : ?>
                                                    <input class="form-check-input" type="radio" name="<?php echo $skill['id_skill'] ?>" checked id="yes_<?php echo $skill['id_skill'] ?>" value="1">
                                                <?php else : ?>
                                                    <input class="form-check-input" type="radio" name="<?php echo $skill['id_skill'] ?>" id="yes_<?php echo $skill['id_skill'] ?>" value="1">
                                                <?php endif; ?>
                                                <label class="form-check-label" for="yes_<?php echo $skill['id_skill'] ?>">oui </label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <?php if (!$skill['is_owned']) : ?>
                                                    <input class="form-check-input" type="radio" name="<?php echo $skill['id_skill'] ?>" checked id="no_<?php echo $skill['id_skill'] ?>" value="0">
                                                <?php else : ?>
                                                    <input class="form-check-input" type="radio" name="<?php echo $skill['id_skill'] ?>" id="no_<?php echo $skill['id_skill'] ?>" value="0">
                                                <?php endif; ?>

                                                <label class="form-check-label" for="no_<?php echo $skill['id_skill'] ?>">non</label>
                                            </div>
                                        </div>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                    <?php endforeach; ?>
                <?php endforeach; ?>
                <button type="submit" class='btn btn-lg btn-primary col-12 col-lg-4 my-2'>VALIDER</button>
            </form>
        </div>
    </div>

</main>