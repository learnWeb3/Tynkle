<?php
require_once './app/config/paths.php';
require_once './app/config/db_credentials.php';
require 'vendor/autoload.php';

$connection = Db::connect();
Platform::destroyAll($connection);
BreakdownCategory::destroyAll($connection);
User::destroyAll($connection);
Post::destroyAll($connection);
Skill::destroyAll($connection);
UserSkill::destroyAll($connection);
Chat::destroyAll($connection);
Message::destroyAll($connection);
ChatUser::destroyAll($connection);
Offer::destroyAll($connection);
Ask::destroyAll($connection);
FaqCategory::destroyAll($connection);
FaqItem::destroyAll($connection);
Review::destroyAll($connection);

$faker = Faker\Factory::create();
$platforms = ["Informatique", 'Smartphone/tablette', "Reseau", "Electroménager", "Console de jeux", "Tv/multimédia"];

foreach ($platforms as $platform) {
    try {
        Platform::create($connection, ['name', 'description'], [$platform, $faker->text()]);
        echo "Platform $platform created \n";
    } catch (\Throwable $th) {
        echo "platform $plateform has not been created due to an internal error\n";
    }
}

$platforms = Platform::all($connection, '/', 0, 100)['data'];

$breakdown_categories_smarthphone = ["Dépanner mon smartphone", "Depanner ma tablette", "Changer une pièce", "Aide à l'utilisation"];
$breakdown_categories_informatique = ["Dépanner mon PC/ MAC", "Faire évoluer mon matériel", "Installer un logiciel", "Aide à l'utilisation"];
$breakdown_categories_reseau = ["Installation box internet", "Connecter mes appareils", "Dépanner ma connexion internet", "Aide à l'utilisation"];
$breakdown_categories_electromenagers = ["Installation gros/petit électroménager", "Réparation / entretien petit électroménager", "Réparation / entretien gros électroménager"];
$breakdown_categories_consoles = ["Réparer / configurer ma playstation", "Réparer / configurer ma xBox", "Réparer / configurer ma Nintendo Switch", "Autres consoles"];
$breakdown_categories_multimedia = ["Depanner/installer ma TV", "Depanner/installer mon système audio", "Depanner/installer mon lecteur vidéo", "Aide à l'utilisation"];

$breakdown_categories = [$breakdown_categories_informatique, $breakdown_categories_smarthphone, $breakdown_categories_reseau, $breakdown_categories_electromenagers, $breakdown_categories_consoles, $breakdown_categories_multimedia];
foreach ($breakdown_categories as $id_platform => $breakdown_category_breakdowns) {
    foreach ($breakdown_category_breakdowns as $breakdown_category) {
        try {
            BreakdownCategory::create($connection, ['id_platform', 'name', 'description'], [$id_platform + 1, $breakdown_category, $faker->text()]);
            echo "breakdown type $breakdown_category created \n";
        } catch (\Throwable $th) {
            echo "Breakdown category $breakdown_category has not been created due to an internal error\n";
        }
    }
}

for ($count = 0; $count < 100; $count++) {
    try {
        $username = $faker->userName;
        $verify_token = bin2hex(random_bytes(50));
        $reset_password_token = bin2hex(random_bytes(50));
        $geocoder = new Geocoder();
        $coordinates = $geocoder->getCoordinates();
        $adress_parts = $geocoder->reverseGeocode($coordinates['location']['lng'], $coordinates['location']['lat']);
        User::create($connection, ['username', 'lastname', 'firstname', 'birthdate', 'email', 'adress', 'phone_number', 'password', 'verify_token', 'reset_password_token', 'lat', 'lon', 'city', 'postal_code'], array(
            $username,
            $faker->firstName(),
            $faker->lastName,
            $faker->date(),
            $faker->email,
            $adress_parts["route"],
            $faker->phoneNumber,
            password_hash('foobar', PASSWORD_BCRYPT),
            $verify_token,
            $reset_password_token,
            $coordinates['location']['lat'],
            $coordinates['location']['lng'],
            $adress_parts["locality"],
            $adress_parts["postal_code"],
        ));
        echo "User $username created \n";
    } catch (\Throwable $th) {
        echo "user has not been created due to an internal error\n";
    }
    sleep(rand(1,3));
}

$users = User::all($connection, '/', 0, 100)['data'];
$breakdown_categories = BreakdownCategory::all($connection, '/', 0, 100)['data'];
$images = array(
    'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg',
    'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg',
    'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg',
    'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg',
);
for ($count = 0; $count < 100; $count++) {
    try {
        $random_user_index = array_rand($users);
        $random_user_id = $users[$random_user_index]['id'];
        $random_breakdown_category_index = array_rand($breakdown_categories);
        $random_breakdown_category_id = $breakdown_categories[$random_breakdown_category_index]['id'];
        $title = "Super titre $count";
        Post::create(
            $connection,
            ['id_user', 'id_breakdown_category', 'images', 'cover_image', 'title', 'content', 'budget', 'city', 'postal_code', 'lat', 'lng'],
            array(
                $random_user_id,
                $random_breakdown_category_index,
                json_encode(
                    $images
                ),
                $images[array_rand($images)],
                $title,
                $faker->text(),
                $faker->randomNumber(3),
                $faker->city,
                $faker->postcode,
                $faker->latitude,
                $faker->longitude,
            )
        );
        echo "Post $title created \n";
    } catch (\Throwable $th) {
        echo "Post has not been created due to an internal error\n";
    }
}

$skills = [
    "Dépanner mon PC/ MAC" =>
    ["Formattage/redémarrage", "Installation Système exploitation", "Changement de pièce"],
    "Faire évoluer mon matériel" =>
    ["Changement de pièce", "Installation périphérique", "Assemblage ordinateur"],
    "Installer un logiciel" =>
    ["Installation Système exploitation", "Installation logiciel"],
    "Aide à l'utilisation" =>
    ["Cours/Aide à l'utilisation"],
    "Dépanner mon smartphone" =>
    ["Apple iOS", "Android", "Windows Phone"],
    "Depanner ma tablette" =>
    ["Apple iOS", "Android", "Windows Phone"],
    "Changer une pièce" =>
    ["Apple iOS", "Android", "Windows Phone"],
    "Aide à l'utilisation" =>
    ["Apple iOS", "Android", "Windows Phone"],
    "Installation box internet" =>
    ["Installation box"],
    "Connecter mes appareils" =>
    ["Configuration réseau"],
    "Dépanner ma connexion internet" =>
    ["Configuration réseau"],
    "Aide à l'utilisation" =>
    ["Cours/Aide à l'utilisation"],
    "Installation gros/petit électroménager" =>
    ["Installation (gros/petit)"],
    "Réparation / entretien petit électroménager" =>
    ["Réparation/Entretien petit"],
    "Réparation / entretien gros électroménager" =>
    ["Réparation/Entretien gros"],
    "Réparer / configurer ma playstation" =>
    ["Réparation", "Changer le stockage"],
    "Réparer / configurer ma xBox" =>
    ["Réparation", "Changer le stockage"],
    "Réparer / configurer ma Nintendo Switch" =>
    ["Réparation", "Changer le stockage"],
    "Autres consoles" =>
    ["Réparation", "Changer le stockage"],
    "Depanner/installer ma TV" =>
    ["Installation/Configuration TV", "Réparation TV"],
    "Depanner/installer mon système audio" =>
    ["Installation audio/vidéo", "Configuration audio/vidéo", "Réparation"],
    "Depanner/installer mon lecteur vidéo" =>
    ["Installation audio/vidéo", "Configuration audio/vidéo", "Réparation"],
    "Aide à l'utilisation" =>
    ["Cours/Aide à l'utilisation"],
];
foreach ($skills as $breakdown_category => $related_skills) {
    $id_breakdown_category = BreakdownCategory::like($connection, 'name', $breakdown_category)->fetchAll(PDO::FETCH_ASSOC)[0]['id'];
    foreach ($related_skills as $skill) {
        try {
            Skill::create($connection, ['name', 'id_breakdown_category'], [$skill, $id_breakdown_category]);
            echo "skill $skill has been created \n";
        } catch (\Throwable $th) {
            echo "Skill $skill has not been created due to an internal error\n";
        }
    }
}

$skills = Skill::all($connection, '/skills', 0, 100)['data'];
for ($count = 0; $count < 100; $count++) {
    try {
        $random_skill_index = array_rand($skills);
        $random_skill_id = $skills[$random_skill_index]['id'];
        $random_user_index = array_rand($users);
        $random_user_id = $users[$random_user_index]['id'];
        UserSkill::create(
            $connection,
            ['id_skill', 'id_user'],
            array(
                $random_skill_id,
                $random_user_id,
            )
        );
        echo "User skill for user id $random_user_index \n";
    } catch (\Throwable $th) {
        echo "user Skill has not been created due to an internal error\n";
    }
}

$posts = Post::all($connection, '/posts', 0, 10000)['data'];
for ($count = 0; $count < 100; $count++) {
    try {
        $random_post_index = array_rand($posts);
        $random_post_id = $posts[$random_post_index]['id'];
        $random_user_index = array_rand($users);
        $random_user_id = $users[$random_user_index]['id'];
        $object = "offfre n° $count";
        Offer::create(
            $connection,
            ['id_post', 'id_user', 'content', 'object', 'amount'],
            array(
                $random_post_id,
                $random_user_id,
                $faker->text(),
                $object,
                $faker->randomNumber(3),
            )
        );
        echo "Offer $object has been created \n";
    } catch (\Throwable $th) {
        echo "Offer has not been created due to an internal error\n";
    }
}

$faq_categories = ['Généralités', 'Avant le dépannage en tant qu’Helper', 'Pendant un dépannage', 'Avant un dépannage si recherchez de l’aide', 'Contact', 'Une communauté d’entraide est disponible sur
Facebook'];
$faq_items = [
    [
        [
            'label' => 'Conditions requises pour m’inscrire ?',
            'description' => "Tout d’abord, pour le confort de la communauté, les utilisateurs qu’ils apportent ou reçoivent de l’aide se doivent de respecter le fonctionnement et les règles du site.Vous devez :Être majeur Et bien sûr, la règle principale, être sociable et courtois ;)",
        ],
        [
            'label' => 'Combien puis-je gagner en proposant mon dépannage ?',
            'description' => 'Plus vous serez disponible, plus vous gagnerez de l’argent. Vos bénéfices dépendront également d’autre critère tel que, votre réactivité.',
        ],
        [
            'label' => 'Est-ce payant ?',
            'description' => 'L’utilisation de la plateforme est 100 % gratuite, Tynkle ne prend aucune commission pour faire partie de la communauté et profitez de nombreux avantages. Lorsque votre profil est créé vous faites partie de la communauté et vous pouvez aussitôt entrer en contact avec les membres. Tynkle permet simplement une mise en relation entre membre de la communauté, les services rendus ne sont pas monétisés par Tynkle.',
        ],
        [
            'label' => 'Conseils utiles pour être souvent sollicité en tant qu’Helper ?',
            'description' => 'Répondez aux messages dès que possible, même si vous n’êtes pas en capacité de répondre aux besoins de la personne. Ajoutez une photo de vous ou d’un avatar sympa sélectionné par vos soins. Faites la pub de votre service via la communauté ! Partagez votre profil sur les réseaux-sociaux, parlez-en autour de vous.'],
        [
            'label' => 'Comment Proposer mon dépannage ou obtenir de l’aide ?',
            'description' => "Inscrivez-vous gratuitement suivez les étapes jusqu’à la fin de l’inscription.A la fin de l’inscription, vous recevrez un mail avec un lien d’activation permettant de confirmer votre compte.Vous n’avez pas reçu le mail d’activation ? Pensez à vérifier vos courriers indésirables/commerciaux s’il n’est pas présent dans votre boite de réception ou cliquez sur la bannière «Compte en attente de validation, veuillez cliquer sur le mail de confirmation, si vous ne l'avez pas reçu cliquez ici, présente sur l’accueil du site.Votre inscription est maintenant terminée, vous pouvez dès à présent vous lancer !",
        ],
        [
            'label' => 'Mon compte',
            'description' => 'Ici vous pouvez apporter des modifications concernant les réglages de votre compte et vos informations en vous rendant dans Mon Compte. Vous pouvez également accéder à votre compte en appuyant le bouton « mon Compte » sur la barre de navigation ou la barre latérale à partir d’un smartphone. Il vous sera également possible de supprimer votre compte, ce qui comprend toutes les informations renseignées.',
        ],
        [
            'label' => 'Compétences',
            'description' => 'Attachez une importance à vos compétences, cela représente l’un des éléments clés de votre succès. Vous avez la possibilité de les modifier dans Mon Compte/Compétences, n’oubliez pas d’enregistrer ensuite.',
        ],
        [
            'label' => 'Les petits plus du membre sympa',
            'description' => 'Entre membre, lorsque vous rentrez en contact, prenez le temps de bien vous renseigner sur le problème ou d’expliquer votre problème, le dépannage n’en sera que plus efficace. Faites-en sorte d’arriver à l’heure sur le lieu de rendez-vous, en prenant en compte les aléas de la circulation.',
        ],
    ],
    [
        [
            'label' => 'J’ai reçu une demande',
            'description' => 'Vous avez reçu votre première demande de dépannage, voilà comment ça marche. Il est primordial d’y répondre le plus rapidement possible. Celle-ci se manifestera par une notification qui sera visible sur la cloche située sur l’Accueil à partir d’un ordinateur ou sur la barre latérale à partir d’un smartphone. Vous avez également la possibilité d’être alerté par mail. En consultant une demande vous avez une explication du problème et le détail de l’appareil. Il vous faut ensuite discuter avec le demandeur afin de convenir d’un éventuel rendez-vous.En consultant une demande vous avez une explication du problème et le détail de l’appareil. Il vous faut ensuite discuter avec le demandeur afin de convenir d’un éventuel rendez-vous.',
        ],
        [
            'label' => 'Messagerie',
            'description' => 'Sur votre messagerie vous retrouvez tous les échanges avec les demandeurs signalés par une notification.',
        ],
    ],
    [
        [
            'label' => 'A mon départ',
            'description' => 'Après la prestation pensez à préciser à la personne dépannée de vous évaluer afin que cela puisse vous servir pour d’autres prestations.',
        ],
    ],
    [
        [
            'label' => 'Comment faire une demande de dépannage ?',
            'description' => 'Vous pouvez publier une annonce présentant votre problème afin que des Helpers puissent la consulter en fonction de leurs compétences.Vous pouvez rechercher un Helper ayant les compétences pour vous aider. Pour un service optimal activer votre géolocalisation dans les paramètres de réglages de votre smartphone ou votre navigateur web sur votre ordinateur et/ou précisez votre adresse dans <Mon compte>. Tynkle se charge de vous proposer des helpers pouvant répondre à votre demande à partir de votre besoin.Envoyez une demande.Après avoir trouvé un helper qui correspond à vos critères de recherche, vous pouvez lui envoyer une demande. Pour être certain d’avoir au moins une réponse positive vous pouvez envoyer votre demande en sélectionnant plusieurs helpers, ou un seul si au préalable vous l’aviez ajouté à vos favoris.',
        ],
    ],
    [
        [
            'label' => 'Favoris',
            'description' => 'Ici vous retrouverez tous les Helpers que vous avez ajoutés dans vos favoris. Vous pouvez ajouter et retirer un Helper de vos favoris directement depuis son profil en appuyant sur Favoris',
        ],
        [
            'label' => 'Modification / Annulation.',
            'description' => 'Vous avez un empêchement quelconque qui ne vous permet pas d’être présent(e) le jour du rendez-vous ? Via la messagerie, vous avez la possibilité de communiquer à la personne alors n’hésitez pas à vous s’en servir si vous avez fait le choix de ne pas échanger vos numéros de téléphone.',
        ],
    ],
    [
        [
            'label' => 'Contact',
            'description' => 'Vous souhaitez envoyer un message à Tynkle, ce dernier sera traité le plus rapidement possible, tenant compte des jours ouvrés.',
        ],
    ],
    [

    ],

];

foreach ($faq_categories as $faq_category) {
    try {
        FaqCategory::create($connection, ['name'], [$faq_category]);
        echo "$faq_category created and inserted in database in faq_categories table";
    } catch (\Throwable $th) {
        var_dump($th);
        echo "faq_category $faq_category has not been created due to an internal error\n";
    }
}

foreach ($faq_items as $index => $faq_items_batch) {
    foreach ($faq_items_batch as  $faq_item) {
        try {
            FaqItem::create(
                $connection,
                ['id_faq_category', 'label', 'content'],
                [$index + 1, $faq_item['label'], $faq_item['description']]
            );
            echo $faq_item['label'] . " created and inserted in database in faq_categories table";
        } catch (\Throwable $th) {
            echo "faq_item has not been created due to an internal error\n";
        }
    }
}


for ($i=0; $i<500; $i ++)
{
    $random_follower_index = array_rand($users);
    $random_follower_id = $users[$random_follower_index]['id'];
    $random_followed_index = array_rand($users);
    $random_followed_id = $users[$random_followed_index]['id'];
    try {
        Review::create(
            $connection,
            ['id_reviewed','id_reviewer', 'comment', 'score'],
            [
                $random_follower_id,
                $random_followed_id,
                $faker->text(),
                $faker->numberBetween($min = 0, $max = 5)
            ]
        );
        echo " Review has been created and inserted in database";
    } catch (\Throwable $th) {
        echo "Review has not been created due to an internal error\n";
    }
}


