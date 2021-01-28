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
$breakdown_categories_reseau =  ["Installation box internet", "Connecter mes appareils", "Dépanner ma connection internet", "Aide à l'utilisation"];
$breakdown_categories_electromenagers = ["Installation gros/petit électroménager", "Réparation / entretien petit électroménager", "Réparation / entretien gros électroménager"];
$breakdown_categories_consoles = ["Réparer / configurer ma playstation", "Réparer / configurer ma xBox", "Réparer / configurer ma NintendosSwitch", "Autres consoles"];
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
        User::create($connection, ['username', 'lastname', 'firstname', 'birthdate', 'email', 'adress', 'phone_number', 'password'], array(
            $username,
            $faker->firstName(),
            $faker->lastName,
            $faker->date(),
            $faker->email,
            $faker->address,
            $faker->phoneNumber,
            password_hash('foobar', PASSWORD_BCRYPT)
        ));
        echo "User $username created \n";
    } catch (\Throwable $th) {
        echo "user has not been created due to an internal error\n";
    }
}

$users = User::all($connection, '/', 0, 100)['data'];
$breakdown_categories = BreakdownCategory::all($connection, '/', 0, 100)['data'];
$images =  array(
    'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg',
    'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg',
    'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg',
    'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg'
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
            ['id_user', 'id_breakdown_category', 'images', 'cover_image', 'title', 'content', 'budget', 'city', 'postal_code', 'lat', 'lon'],
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
                $faker->longitude
            )
        );
        echo "Post $title created \n";
    } catch (\Throwable $th) {
        echo "Post has not been created due to an internal error\n";
    }
}

$skills = [
    "Dépanner mon PC/ MAC" => ["Formattage/redémarrage", "Installation Système exploitation", "Changement de pièce"],
    "Installer un logiciel" => ["Installation Système exploitation", "Installation logiciel"],
    "Faire évoluer mon matériel" => ["Changement de pièce", "Installation périphérique", "Assemblage ordinateur"],
    "Aide à l'utilisation" => ["Cours/Aide à l'utilisation"],

    "Dépanner mon smartphone" => ["Apple iOS", "Android", "Windows Phone"],
    "Depanner ma tablette" => ["Apple iOS", "Android", "Windows Phone"],
    "Changer une pièce" => ["Apple iOS", "Android", "Windows Phone"],
    "Aide à l'utilisation" => ["Apple iOS", "Android", "Windows Phone"],

    "Installation box internet" => ["Installation box"],
    "Connecter mes appareils" => ["Configuration réseau"],
    "Dépanner ma connection internet" => ["Configuration réseau"],
    "Aide à l'utilisation" => ["Cours/Aide à l'utilisation"],

    "Réparer / configurer ma playstation" => ["Réparation", "Changer le stockage"],
    "Réparer / configurer ma xBox" => ["Réparation", "Changer le stockage"],
    "Réparer / configurer ma Nintendo Switch" => ["Réparation", "Changer le stockage"],
    "Autres consoles" => ["Réparation", "Changer le stockage"],

    "Depanner/installer ma TV" => ["Installation/Configuration TV", "Réparation TV"],
    "Depanner/installer mon système audio" => ["Installation audio/vidéo", "Configuration audio/vidéo", "Réparation"],
    "Depanner/installer mon lecteur vidéo" => ["Installation audio/vidéo", "Configuration audio/vidéo", "Réparation"],
    "Aide à l'utilisation" => ["Cours/Aide à l'utilisation"],

    "Installation gros/petit électroménager" => ["Installation (gros/petit)"],
    "Réparation / entretien petit électroménager" => ["Réparation/Entretien petit"],
    "Réparation / entretien gros électroménager" => ["Réparation/Entretien gros"]
];
foreach ($skills as $index => $skill_batch) {
   foreach($skill_batch as $id_platform=>$skill)
   {
    try {
        Skill::create($connection, ['name', 'id_breakdown_category'], [$skill, $id_platform + 1]);
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
