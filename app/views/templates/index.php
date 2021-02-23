<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $title; ?></title>
    <meta name="author" content="">
    <meta name="description" content="<?php echo $description; ?>">
    <link rel="shortcut icon" href="<?php echo ABSOLUTE_ASSET_PATH ?>/icons/favicon.png" type="image/png">
    <!-- MATERIALIZE FOR BOOTSTRAP MDB LIBRARY  -->
    <link rel="stylesheet" href="<?php echo ABSOLUTE_ASSET_PATH ?>/css/mdb.min.css">
    <!-- COMMON CSS -->
    <link rel="stylesheet" href="<?php echo ABSOLUTE_ASSET_PATH ?>/css/commons/main.css">
    <!-- PAGE SPECIFIC CSS -->
    <?php if (!empty($style_file_name)): ?>
    <link rel='stylesheet' href="<?php echo ABSOLUTE_ASSET_PATH ?>/css/pages/<?php echo $style_file_name ?>.css">
    <?php endif?>
    <!-- AOS LIBRARY STYLES -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <!-- FONTAWESOME ICONS KIT -->
    <script src="https://kit.fontawesome.com/b67bd6560e.js" crossorigin="anonymous"></script>
    <!-- JQUERY LIBRARY -->
    <script src="<?php echo ABSOLUTE_ASSET_PATH ?>/js/vendor/jquery-3.5.1.min.js"></script>
    <!-- POPPER JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
        integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous">
    </script>
    <!-- BOOTSTRAP JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous">
    </script>
    <!-- RATER JS -->
    <script src="<?php echo ABSOLUTE_ASSET_PATH ?>/js/vendor/rater.js/rater.min.js"></script>
    <!-- GOOGLE MAPS JS -->
    <script src="https://maps.googleapis.com/maps/api/js?key=<?php echo $_ENV['GOOGLE_JS_MAPS_API_KEY'] ?>"></script>
    <!-- AOS LIBRARY -->
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <!-- BOUNCER LIBRARY -->
    <script src="<?php echo ABSOLUTE_ASSET_PATH ?>/js/vendor/bouncer/bouncer.polyfills.min.js"></script>
    <script src="<?php echo ABSOLUTE_ASSET_PATH ?>/js/vendor/bouncer/bouncer.js"></script>
</head>

<body class='bg-light-grey'>

    <?php include_once 'navbar.php'?>
    <?php include_once '_flash.php'?>
    <?php echo $current_view ?>
    <?php include_once 'footer.php'?>

    <!-- NAVBAR SCRIPTS -->
    <script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/navbar.js' ?>"></script>
    <!-- ALERT SCRIPTS -->
    <script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/flash.js' ?>"></script>
    <!-- AOS INIT + TOOLTIP BOOTSTRAP -->
    <script src="<?php echo ABSOLUTE_ASSET_PATH ?>/js/template.js"></script>
</body>

</html>