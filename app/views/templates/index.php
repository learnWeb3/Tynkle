<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $title; ?></title>
    <title><?php echo $description; ?></title>
    <meta name="author" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/favicon.png" type="image/png">
    <link rel="stylesheet" href="<?php echo ABSOLUTE_ASSET_PATH ?>/css/mdb.min.css">
    <link rel="stylesheet" href="<?php echo ABSOLUTE_ASSET_PATH ?>/css/commons/main.css">
    <link rel='stylesheet' href="<?php echo ABSOLUTE_ASSET_PATH ?>/css/pages/<?php echo $style_file_name ?>.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>

</head>

<body class='bg-light-grey'>

    <?php include_once 'navbar.php' ?>
    <?php include_once '_flash.php' ?>
    <?php echo $current_view ?>
    <?php include_once 'footer.php' ?>

    <script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/navbar.js' ?>"></script>
    <script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/flash.js' ?>"></script>
</body>

</html>