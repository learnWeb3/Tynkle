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

</head>

<body class='bg-light-grey'>
    <?php include_once 'navbar.php' ?>
    <?php echo $current_view ?>
    <?php include_once 'footer.php' ?>
</body>

</html>