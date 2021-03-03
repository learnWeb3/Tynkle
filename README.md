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

Vous devez également vous procurer un token d'accès aux services suivants:
- MAPS JAVASCRIPT API
- MAILJET API

Vous devez impérativement utiliser les informations d'identification de votre projet disponible sur votre tableau de bord Google pour :
- l'authentification de l'application via oAuth
- Google Analytics via un compte de service ayant accès en lecture au compte google analytics

La compte Googgle Analytics doit posséder une propriété "Universal Analytics" diponible dans les options avancé lors de la création de propriété.

Ces informations sont disponibles dans le répertoire des configuration:

compte google : 

```
/app/config/google_auth.json
```

compte de service :

```
/app/config/tynkle-304613-a33bb0a79914.json


L'ensemble des configuration relatives aux chemins de fichiers sont disponibles à :

```
/app/config/paths.php
```

L'ensemble des configuration relatives à la base de donnée sont disponibles à :

```
/app/config/db_credentials.php
```

```

1) Cloner le repertoire Github <https://github.com/antoine-leguillou/tynkle>

```
git clone https://github.com/antoine-leguillou/tynkle
```

2) Ouvrir un terminal et se placer dans le repertoire cloné

```
cd tynkle
```
3) Installer les dépendances

```
composer install
```

4) crér un fichier .env à la racine du dossier

```
touch .env
```

5) Ajouter la variable d'environnement suivante pour référencé votre token MAPBOX dans le fichier .env

```
GOOGLE_JS_MAPS_API_KEY="xxxxxxxxxxxxxxxxxxxxxxxxxx"
MAILJET_PUBLIC_KEY="xxxxxxxxxxxxxxxxx"
MAILJET_SECRET_KEY="xxxxxxxxxxxxxxxxxxxx"
```

5) Lancer le serveur en developpement

```

```


## Collaborateurs

- Sabri Said
- ALain Maisonneuve
- Antoine LE GUILLOU