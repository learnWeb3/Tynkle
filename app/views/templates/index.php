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
    <script src="<?php echo ABSOLUTE_ASSET_PATH ?>/js/vendor/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    <script src="<?php echo ABSOLUTE_ASSET_PATH ?>/js/vendor/rater.js/rater.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=<?php echo $_ENV['GOOGLE_JS_MAPS_API_KEY'] ?>"></script>
</head>

<body class='bg-light-grey'>

    <?php include_once 'navbar.php'?>
    <?php include_once '_flash.php'?>
    <?php echo $current_view ?>
    <?php include_once 'footer.php'?>

    <script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/navbar.js' ?>"></script>
    <script type="module" src="<?php echo ROOT_PATH . '/app/assets/js/flash.js' ?>"></script>
    <script src="<?php echo ABSOLUTE_ASSET_PATH ?>/js/bouncer.polyfills.min.js"></script>
    <script>
        var validate = new Bouncer('form', {
            patterns: {
		email: /^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*(\.\w{2,})+$/,
		url: /^(?:(?:https?|HTTPS?|ftp|FTP):\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-zA-Z\u00a1-\uffff0-9]-*)*[a-zA-Z\u00a1-\uffff0-9]+)(?:\.(?:[a-zA-Z\u00a1-\uffff0-9]-*)*[a-zA-Z\u00a1-\uffff0-9]+)*(?:\.(?:[a-zA-Z\u00a1-\uffff]{2,}))\.?)(?::\d{2,5})?(?:[/?#]\S*)?$/,
		number: /[-+]?[0-9]*[.,]?[0-9]+/,
		color: /^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$/,
		date: /(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))/,
		time: /(0[0-9]|1[0-9]|2[0-3])(:[0-5][0-9])/,
		month: /(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2]))/
	},
		customValidations: {
					valueMismatch: function (field) {

						var selector = field.getAttribute('data-bouncer-match');
						if (!selector) return false;
						var otherField = field.form.querySelector(selector);
						if (!otherField) return false;
						return otherField.value !== field.value;

					}
				},
            messages: {
		missingValue: {
			checkbox: 'Ce champ est obligatoire.',
			radio: 'Ce champ est obligatoire..',
			select: 'Ce champ est obligatoire.',
			'select-multiple': 'Ce champ est obligatoire.',
			default: 'Ce champ est obligatoire.'
		},
		valueMismatch: function (field) {
						var customMessage = field.getAttribute('data-bouncer-mismatch-message');
						return customMessage ? customMessage : 'Les champs ne sont pas identiques'},
		patternMismatch: {
			email: 'Veuillez entrer une adresse email valide',
			url: 'Veuillez entrer un url valide',
			number: 'Veuillez entrer un nombre',
			color: 'Veuillez entrer un code couleur hexadécimal',
			date: 'Veuillez entrez une date au bon format, Ex. YYYY-MM-DD',
			time: 'Veuillez entrez une heure au bon format, Ex. 23:00',
			month: 'Veuillez entrez une date au format YYYY-MM',
			default: "Ce format n'est pas valide"
		},
		outOfRange: {
			over: 'Veuillez entrer une valeur supérieure à {max}.',
			under: 'Veuillez entrer une valeur inférieure à {min}.'
		},
		wrongLength: {
			over: 'Le nombre de caractères maximum est de {maxLength} characters. Le nombre de carctère actuel est de {length} caractères.',
			under: 'Le nombre de caractères minimum est de {maxLength} characters. Le nombre de carctère actuel est de {length} caractères.'
		}
	},
        });
    </script>
</body>

</html>