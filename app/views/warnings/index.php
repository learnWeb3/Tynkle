<main class="d-flex flex-column bg-background"
    style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <?php require_once '_nav_menu.php'?>

    <section class="col-12 col-xl-8 offset-xl-3 d-flex flex-column align-items-start bg-light p-4"
        style="min-height:100vh;">

        <h2>Modérer le contenu</h2>

        <h3 class="my-4">Les utilisateurs</h3>

        <table id="warnings-users" class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">identifiant</th>
                    <th scope="col">email</th>
                    <th scope="col">message</th>
                    <th scope="col">crée le</th>
                    <th scope="col">lien</th>
                    <th scope="col">Supprimer</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($users)): ?>

                    <tr><td colspan="8">Pas d'alerte utilisateur pour le moment</td></tr>


                <?php else: ?>
                <?php foreach ($users as $user): ?>
                <tr data-url="<?php echo '/warnings/users/' . $user['user_warning_id'] ?>">
                    <th scope="row"><?php echo $user['id'] ?></th>
                    <td><?php echo $user['username'] ?></td>
                    <td><?php echo $user['email'] ?></td>
                    <td><?php echo $user['message'] ?></td>
                    <td><?php echo $user['user_warning_created_at'] ?></td>
                    <td><a href="<?php echo ROOT_PATH . '/users/' . $user['id'] ?>">Voir le profil</a></td>
                    <td>
                        <a href="#" class="text-danger delete">Supprimer</a>
                    </td>
                </tr>

                <?php endforeach;?>
                <?php endif;?>

            </tbody>
        </table>


        <h3 class="my-4">Les annonces</h3>

        <table id="warnings-posts" class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">titre</th>
                    <th scope="col">plateforme</th>
                    <th scope="col">catégorie</th>
                    <th scope="col">message</th>
                    <th scope="col">crée le</th>
                    <th scope="col">lien</th>
                    <th scope="col">Supprimer</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($posts)): ?>

                <tr><td colspan="8">Pas d'alerte sur les annonces pour le moment</td></tr>

                <?php else: ?>
                <?php foreach ($posts as $post): ?>
                <tr data-url="<?php echo '/warnings/posts/' . $post['post_warning_id'] ?>">
                    <th scope="row"><?php echo $post['id'] ?></th>
                    <td><?php echo $post['title'] ?></td>
                    <td><?php echo $post['platform_name'] ?></td>
                    <td><?php echo $post['breakdown_category_name'] ?></td>
                    <td><?php echo $post['message'] ?></td>
                    <td><?php echo $post['post_warning_created_at'] ?></td>
                    <td><a href="<?php echo ROOT_PATH . '/posts/' . $post['id'] ?>">Voir l'annonce</a></td>
                    <td>
                        <a href="#" class="text-danger delete">Supprimer</a>
                    </td>
                </tr>
                <?php endforeach;?>
                <?php endif;?>
            </tbody>
        </table>
    </section>
</main>
<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/warnings.js' ?>"></script>