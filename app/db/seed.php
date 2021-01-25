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

$faker = Faker\Factory::create();
$breakdown_categories = ['logiciel', 'matériel', 'mentoring/tutorat/cours', 'réseau'];
$platforms = ['pc/windows', 'pc/OSX', 'android', 'ios',  'macOSX'];

foreach ($platforms as $platform) {
    try {
        Platform::create($connection, ['name', 'description'], [$platform, $faker->text()]);
        echo "Platform $platform created \n";
    } catch (\Throwable $th) {
        echo "platform $plateform has not been created due to an internal error\n";
    }
}

$platforms = Platform::all($connection, '/', 0, 100)['data'];

foreach ($breakdown_categories as $breakdown_category) {
    try {
        $random_platform_index = array_rand($platforms);
        $id_platform = $platforms[$random_platform_index]['id'];
        BreakdownCategory::create($connection, ['id_platform', 'name', 'description'], [intval($id_platform), $breakdown_category, $faker->text()]);
        echo "breakdown type $breakdown_category created \n";
    } catch (\Throwable $th) {
        echo "Breakdown category $breakdown_category has not been created due to an internal error\n";
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

$skills = ['je sais détecter une panne', 'je sais remplacer une pièce'];
foreach ($skills as $index => $skill) {
    try {
        $random_breakdown_index = array_rand($breakdown_categories);
        $id_platform = $breakdown_categories[$random_breakdown_index]['id'];
        Skill::create($connection, ['name', 'id_breakdown_category'], [$skill, $id_platform]);
        echo "skill $skill has been created \n";
    } catch (\Throwable $th) {
        echo "Skill $skill has not been created due to an internal error\n";
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
