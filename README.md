# Tynkle

A services marketplace dedicated to electronic devices repairs

## Présentation

Tynkle est une startup développant une plateforme dédiée à la mise en
relation entre particuliers autour d’un service d’entraide informatique et
multimédia.
Après des débuts au sein du Fighters Program de l’incubateur parisien
Station F puis des difficultés financières et techniques les ayant obligés
à mettre en pause leur activité les fondateurs Sabri Saïd et Alain
Maisonneuve souhaitent aujourd’hui redéployer leur solution en tant que
plateforme web et changer de modèle économique.

## Quick Start

Pour lancer le serveur en local vous devez disposez de PHP 7, Apache, Mysql, PHPMyAdmin et Composer sur votre machine

Vous devez également configurer l'accès aux services tiers suivants:

- Mailjet API [générer un token mailjet](https://dev.mailjet.com/email/reference/overview/authentication/)
- authentification de l'application via google oAuth [configurer l'écran d'autorisation oauth](https://developers.google.com/identity/protocols/oauth2/web-server)
- Posséder un identifiant de mesure Google analytics GA_MEASUREMENT_ID [identifiant de mesure google analytics](https://developers.google.com/analytics/devguides/collection/gtagjs)
- Google Universal Analytics API [configurer google analytics](https://support.google.com/analytics/answer/10269537?hl=fr)
- Créer un compte de service google ayant accès en lecture au compte google analytics [configurer un compte de service](https://support.google.com/analytics/topic/1726911?hl=fr&ref_topic=10094551)
- MAPS JAVASCRIPT API (doit être activé pour votre projet via le google developper dashboard) [google developer dashboard](https://console.cloud.google.com/apis/dashboard)
- PLACES API (doit être activé pour votre projet via le google developper dashboard) [google developer dashboard](https://console.cloud.google.com/apis/dashboard)
- Geocoder API (doit être activé pour votre projet via le google developper dashboard) [google developer dashboard](https://console.cloud.google.com/apis/dashboard)
- Geolocation API (doit être activé pour votre projet via le google developper dashboard) [google developer dashboard](https://console.cloud.google.com/apis/dashboard)
- Analytics API (doit être activé pour votre projet via le google developper dashboard) [google developer dashboard](https://console.cloud.google.com/apis/dashboard)

[IMPORTANT] Le compte Googgle Analytics doit posséder une propriété "Universal Analytics" diponible dans les options avancé lors de la création de propriété.
[INMPORTANT] Le compte Google rattaché au projet doit avoir la facturation activée

Ces informations sont disponibles dans le répertoire des configuration:

compte google :

```
/app/config/google_auth.json
```

compte de service :

```
/app/config/tynkle-325405-d212a6a70e4b.json


L'ensemble des configuration relatives aux chemins de fichiers sont disponibles à :

```

/app/config/paths.php

```

L'ensemble des configuration relatives à la base de donnée sont disponibles à :

```

/app/config/db_credentials.php

```

```

1. Cloner le repertoire Github <https://github.com/antoine-leguillou/tynkle>

```
git clone https://github.com/antoine-leguillou/tynkle
```

2. Ouvrir un terminal et se placer dans le repertoire cloné

```
cd tynkle
```

3. Installer les dépendances

```
composer install
```

4. crér un fichier .env à la racine du dossier

```
touch .env
```

5. Ajouter la variable d'environnement suivante pour référencé votre token MAPBOX dans le fichier .env

```
GOOGLE_JS_MAPS_API_KEY="xxxxxxxxxxxxxxxxxxxxxxxxxx"
MAILJET_PUBLIC_KEY="xxxxxxxxxxxxxxxxx"
MAILJET_SECRET_KEY="xxxxxxxxxxxxxxxxxxxx"
```

6. Lancer le serveur en developpement

[Accès sur Apache 2 en développement](http://localhost/tynkle/)

## Collaborateurs

- Sabri Said
- ALain Maisonneuve
- Antoine LE GUILLOU
