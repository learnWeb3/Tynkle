<main class="d-flex flex-column bg-background" style='background-image: url(<?php echo $background_image_path ?>);min-height:100vh;'>

    <?php require_once '_nav_menu.php'?>

    <section class="col-12 col-xl-8 offset-xl-3 d-flex flex-column align-items-start bg-light p-4"
        style="min-height:100vh;">

        <h2>Gérer les utlisateurs</h2>

        <form class="col-12 my-4 user-search" action="" method="get">
            <input type="text" name="" id="" class="col-12 form-control form-control-lg rounded-pill shadow" placeholder="Rechercher un utilisateur par email">
        </form>

        <table class="table table-light table-hover shadow">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">identifiant</th>
                    <th scope="col">email</th>
                    <th scope="col">helper</th>
                    <th scope="col">admin</th>
                </tr>
            </thead>
            <tbody>

                <?php foreach ($users['data'] as $user): ?>
                <tr>
                    <th scope="row"><a href="<?php echo ROOT_PATH.'/users/'. $user['id'] ?>"><?php echo $user['id'] ?></a></th>
                    <td><a href="<?php echo ROOT_PATH.'/users/'. $user['id'] ?>"><?php echo $user['username'] ?></a></td>
                    <td><?php echo $user['email'] ?></td>
                    <td>
                        <form class="user-update" action="" method="post">
                            <div class="form-check form-check-inline">
                                <?php if ($user['is_helper']): ?>
                                <input class="form-check-input" data-userid="<?php echo $user['id'] ?>" type="radio" name="is_helper" id="is_helper_1" value="1"
                                    checked>
                                <?php else: ?>
                                <input class="form-check-input" data-userid="<?php echo $user['id'] ?>" type="radio" name="is_helper" id="is_helper_1"
                                    value="1">
                                <?php endif;?>
                                <label class="form-check-label" for="is_helper_1">oui</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <?php if (!$user['is_helper']): ?>
                                <input class="form-check-input" data-userid="<?php echo $user['id'] ?>" type="radio" name="is_helper" id="is_helper_0" value="0"
                                    checked>
                                <?php else: ?>
                                <input class="form-check-input" data-userid="<?php echo $user['id'] ?>" type="radio" name="is_helper" id="is_helper_0"
                                    value="1">
                                <?php endif;?>
                                <label class="form-check-label" for="is_helper_0">non</label>
                            </div>
                        </form>
                    </td>
                    <td>
                        <form class="user-update" action="" method="post">
                            <div class="form-check form-check-inline">
                                <?php if ($user['is_admin']): ?>
                                <input class="form-check-input" data-userid="<?php echo $user['id'] ?>" type="radio" name="is_admin" id="is_admin_1" value="1"
                                    checked>
                                <?php else: ?>
                                <input class="form-check-input" data-userid="<?php echo $user['id'] ?>" type="radio" name="is_admin" id="is_admin_1" value="1">
                                <?php endif;?>
                                <label class="form-check-label" for="is_admin_1">oui</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <?php if (!$user['is_admin']): ?>
                                <input class="form-check-input" data-userid="<?php echo $user['id'] ?>" type="radio" name="is_admin" id="is_admin_0" value="0"
                                    checked>
                                <?php else: ?>
                                <input class="form-check-input" data-userid="<?php echo $user['id'] ?>" type="radio" name="is_admin" id="is_admin_0" value="1">
                                <?php endif;?>
                                <label class="form-check-label" for="is_admin_0">non</label>
                            </div>
                        </form>
                    </td>
                </tr>

                <?php endforeach;?>

            </tbody>
            <tfoot>
                <tr>
                    <td class="text-start">
                        <a href="<?php echo ROOT_PATH.$users['previous'] ?>"><i class="fas fa-chevron-left fa-2x"></i></a>
                    </td>
                    <td colspan="3"></td>
                    <td class="text-end">
                        <a href="<?php echo ROOT_PATH.$users['next'] ?>"><i class="fas fa-chevron-right fa-2x"></i></a>
                    </td>
                </tr>
            </tfoot>
        </table>

    </section>

</main>

<script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/admin/admin_users.js' ?> "></script>