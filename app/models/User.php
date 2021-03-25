<?php
class User extends Application
{
    public $id;
    public function __construct($id)
    {
        $this->id = $id;
    }


    public function getAlerts(PDO $connection, string $timestamp)
    {
        // $select_chat_ids = "SELECT GROUP_CONCAT(id_chat) as chat_ids FROM chat_users WHERE id_user = ?";
        // $chat_ids = Request::send($connection, $select_chat_ids, [$this->id])->fetchAll(PDO::FETCH_ASSOC)[0]['chat_ids'];
        // $select_user_ids = "SELECT GROUP_CONCAT(id_user) as user_ids FROM chat_users WHERE id_user IN ($chat_ids)";
        // $user_ids =  Request::send($connection, $select_user_ids, [])->fetchAll(PDO::FETCH_ASSOC)[0]['user_ids'];
        $request_body = "SELECT 
        messages.id as message_id,
        messages.id_chat as message_id_chat,
        messages.content as message_content,
        messages.ressource_link as message_ressource_link,
        messages.created_at as message_created_at,
        messages.updated_at as message_updated_at,
        users.id as user_id,
        users.firstname as user_firstname,
        users.lastname as user_lastname,
        users.username as user_username,
        users.email as user_email,
        users.avatar as user_avatar
        FROM messages
        JOIN users ON messages.id_user = users.id
        WHERE messages.created_at >= ? 
        OR messages.updated_at >= ?";
        return Request::send($connection, $request_body, [$timestamp, $timestamp])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function streamAlerts(PDO $connection)
    {
        $timestamp = strftime('%F %H:%M:%S', time());
        header('Content-type: text/event-stream');
        header('Cache-control: no-cache');
        header('Connection: Keep-Alive');
        session_write_close();
        while (true) {

            $json_data = json_encode($this->getAlerts($connection, $timestamp));
            echo 'data: ' . $json_data;
            echo "\n\n";
            flush();
            ob_flush();
            ob_end_flush();
            if (!empty($json_data)) {
                $timestamp = strftime('%F %H:%M:%S', time());
            }
            sleep(1);
        }
    }

    public static function getAll(PDO $connection, string $path = '/users', int $start, int $limit)
    {
        $request_body = "SELECT *,
        (SELECT ROUND(AVG(reviews.score),2) FROM reviews WHERE reviews.id_reviewed = users.id) reviews_score,
        (SELECT COUNT(posts.id) FROM posts WHERE posts.id_user = users.id) posts_count,
        (SELECT COUNT(offers.id) FROM offers WHERE offers.id_user = users.id) offers_count,
        (SELECT COUNT(follows.id) FROM follows WHERE follows.id_follower = users.id) follower_count,
        (SELECT COUNT(follows.id) FROM follows WHERE follows.id_followed = users.id) followed_count
        FROM users ORDER by users.created_at DESC limit $limit OFFSET $start";
        $results = Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
        $next_start = $start += 10;
        $previous_start = $start - 10 >= 0 ? $start - 10 : 0;
        return array(
            "data" => $results,
            "next" => $path . "?start=$next_start&limit=$limit",
            "previous" => $path . "?start=$previous_start&limit=$limit",
        );
    }

    public static function findUserByBreakdownSkill(PDO $connection, string $path, int $id_breakdown, int $start = 0, int $limit = 10)
    {
        $request_body = "SELECT * FROM
        (SELECT
        *,
        (SELECT COUNT(user_skills.id) FROM user_skills JOIN skills ON skills.id = user_skills.id_skill WHERE skills.id_breakdown_category IN (?) AND user_skills.id_user = users.id) skill_count,
        (SELECT ROUND(AVG(reviews.score),2) FROM reviews WHERE reviews.id_reviewed = users.id) reviews_score,
        (SELECT COUNT(posts.id) FROM posts WHERE posts.id_user = users.id) posts_count,
        (SELECT COUNT(offers.id) FROM offers WHERE offers.id_user = users.id) offers_count,
        (SELECT COUNT(follows.id) FROM follows WHERE follows.id_follower = users.id) follower_count,
        (SELECT COUNT(follows.id) FROM follows WHERE follows.id_followed = users.id) followed_count
        FROM users) t1
        WHERE t1.skill_count > 0 ORDER BY t1.skill_count DESC";
        $results = Request::send($connection, $request_body, [$id_breakdown])->fetchAll(PDO::FETCH_ASSOC);
        $next_start = $start += 10;
        $previous_start = $start - 10 >= 0 ? $start - 10 : 0;
        return array(
            "data" => $results,
            "next" => $path . "?start=$next_start&limit=$limit",
            "previous" => $path . "?start=$previous_start&limit=$limit",
        );
    }

    public static function getTopRated(PDO $connection, $limit = 3)
    {
        $request_body = "SELECT *,
        (SELECT ROUND(AVG(reviews.score),2) FROM reviews WHERE reviews.id_reviewed = users.id) reviews_score,
        (SELECT COUNT(posts.id) FROM posts WHERE posts.id_user = users.id) posts_count,
        (SELECT COUNT(offers.id) FROM offers WHERE offers.id_user = users.id) offers_count,
        (SELECT COUNT(follows.id) FROM follows WHERE follows.id_follower = users.id) follower_count,
        (SELECT COUNT(follows.id) FROM follows WHERE follows.id_followed = users.id) followed_count
        FROM users ORDER BY reviews_score DESC LIMIT $limit";
        return Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getFollows(PDO $connection)
    {
        $request_body = "SELECT *,
        (SELECT username FROM users WHERE users.id = follows.id_followed) followed_username,
        (SELECT created_at FROM users WHERE users.id = follows.id_followed) created_at,
        (SELECT ROUND(AVG(reviews.score),2) FROM reviews WHERE reviews.id_reviewed = follows.id_followed) reviews_score,
        (SELECT COUNT(posts.id) FROM posts WHERE posts.id_user = follows.id_followed) posts_count,
        (SELECT COUNT(offers.id) FROM offers WHERE offers.id_user = follows.id_followed) offers_count
        FROM follows WHERE id_follower = ?";
        return Request::send($connection, $request_body, [
            $this->id,
        ])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getCurrentUserFollow(PDO $connection, $id_followed)
    {
        $request_body = "SELECT id
        FROM follows
        WHERE follows.id_follower = ? AND follows.id_followed = ?";
        $result = Request::send($connection, $request_body, [
            $this->id,
            $id_followed,
        ])->fetchAll(PDO::FETCH_ASSOC);
        return empty($result) ? null : $result[0]['id'];
    }

    public static function getSignaledUsers(PDO $connection)
    {
        $request_body = "SELECT
        users.*,
        user_warnings.message,
        user_warnings.id as user_warning_id,
        user_warnings.created_at as user_warning_created_at,
        user_warnings.updated_at as user_warning_updated_at
        FROM users
        JOIN user_warnings ON user_warnings.id_user = users.id";
        return Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function googleAuthenticate(PDO $connection)
    {
        $client = new Google\Client();
        $client->setAuthConfig('./app/config/google_auth.json');
        $client->setScopes('email');
        $redirect_uri = 'http://' . $_SERVER['SERVER_NAME'] . ROOT_PATH . '/register/callback';
        $client->setRedirectUri($redirect_uri);
        if (isset($_GET['code'])) {
            $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
            $client->setAccessToken($token);
            if ($client->getAccessToken()) {
                $token = $client->getAccessToken();
                $data = $client->verifyIdToken();
                if ($data['email']) {
                    $potential_user = User::where($connection, 'email', $data['email'])->fetchAll(PDO::FETCH_ASSOC);
                    if (!empty($potential_user)) {
                        if ($potential_user[0]['is_verified']) {
                            $_SESSION['current_user'] = $potential_user[0]['id'];
                            $_SESSION['access_token'] = $token;
                            $flash = new Flash(
                                array("Connexion réussie"),
                                'success'
                            );
                            $flash->storeInSession();
                            die(header('location: ' . ROOT_PATH . '/'));
                        } else {
                            $flash = new Flash(
                                array("Le compte n'a pas encore été confirmé, veuillez vérifier votre boite mail"),
                                'danger'
                            );
                            $flash->storeInSession();
                            die(header('location: ' . ROOT_PATH . '/signin'));
                        }
                    } else {
                        $verify_token = bin2hex(random_bytes(50));
                        $reset_password_token = bin2hex(random_bytes(50));
                        $geocoder = new Geocoder();
                        $coordinates = $geocoder->getCoordinates();
                        $adress_parts = $geocoder->reverseGeocode($coordinates['location']['lng'], $coordinates['location']['lat']);
                        $user = User::create($connection, ['email', 'username', 'password', 'is_google', 'verify_token', 'reset_password_token', 'lat', 'lon', 'adress', 'city', 'postal_code'],
                            [
                                $data['email'],
                                $data['email'],
                                password_hash('foobar', PASSWORD_BCRYPT),
                                1,
                                $verify_token,
                                $reset_password_token,
                                $coordinates['location']['lat'],
                                $coordinates['location']['lng'],
                                $adress_parts["route"],
                                $adress_parts["locality"],
                                $adress_parts["postal_code"],
                            ]);

                        $mailer = new Mailer(
                            'tynkle',
                            $data['email'],
                            'accountverification@tynkle.com',
                            $data['email'],
                            'Bienvenue sur Tynkle: la première plateforme de mise en relation pour du dépannage informatique, multimédia et électroménager',
                            "Bonjour vous venez de créer un compte sur Tynkle, merci de confirmer cotre compte afin de finaliser votre inscription.Dans le cas ou le lien ne fonctionnerai pas veuillez copier-coller&nbsp;l'url suivante dans la barre d'adresse de votre navigateur :",
                            __DIR__ . '/../views/templates/mailer/registration_confirmation_mail.php'
                        );

                        $mailer->send(
                            array(
                                "verify_token" => $user[0]['verify_token'],
                                "user_id" => $user[0]['id'],
                            )
                        );

                        $flash = new Flash(
                            array("Compte crée avec succès, vous avez reçu un mail pour confirmer votre compte"),
                            'success'
                        );
                        $flash->storeInSession();
                        die(header('location:' . ROOT_PATH . '/signin'));
                    }

                } else {
                    throw (new Exception("Erreur lors du processus d'authentification"));
                }
            } else {
                throw (new Exception("Erreur lors du processus d'authentification"));
            }
        } else {
            $auth_url = $client->createAuthUrl();
            header('location:' . $auth_url);
        }
    }

    public static function signIn(PDO $connection, string $login, string $password): void
    {
        $request_body = 'SELECT * FROM users WHERE email=? OR username=?';
        $potential_user = Request::send($connection, $request_body, [$login, $login])->fetchAll(PDO::FETCH_ASSOC);
        if (isset($potential_user[0])) {
            $user = $potential_user[0];
            if ($user['is_verified']) {
                if (password_verify($password, $user['password'])) {
                    $_SESSION['current_user'] = $user['id'];
                } else {
                    throw new Exception('Informations de connexion non valides');
                }

            } else {
                throw new Exception("Le compte n'a pas encore été confirmé, veuillez vérifier votre boite mail");
            }
        } else {
            throw new Exception('Informations de connexion non valides');
        }
    }

    public function getDetails(PDO $connection)
    {
        $request_body = 'SELECT *,
        (SELECT ROUND(AVG(reviews.score),2)
        FROM reviews WHERE reviews.id_reviewed = users.id) reviews_score,
        (SELECT COUNT(posts.id) FROM posts WHERE posts.id_user = users.id) posts_count,
        (SELECT COUNT(offers.id) FROM offers WHERE offers.id_user = users.id) offers_count,
        (SELECT COUNT(follows.id) FROM follows WHERE follows.id_followed = users.id) follower_count,
        (SELECT COUNT(follows.id) FROM follows WHERE follows.id_follower = users.id) followed_count
        FROM users WHERE users.id=?';
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC)[0];
    }

    public function isSkillOwned(PDO $connection, array $skill)
    {
        $request_body = 'SELECT * FROM user_skills JOIN skills ON user_skills.id_skill = skills.id JOIN users ON users.id=user_skills.id_skill WHERE users.id=?';
        $results = Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
        return !empty($results);
    }

    public function getUserSkill(PDO $connection)
    {
        $platforms = Platform::all($connection, '/breakdowns', 0, 100)['data'];
        $breakdown_categories = BreakdownCategory::all($connection, '/breakdowns', 0, 100)['data'];
        $request_body_skills = "SELECT COUNT(user_skills.id) as is_owned FROM user_skills
        JOIN skills ON user_skills.id_skill=skills.id
        JOIN breakdown_categories ON skills.id_breakdown_category = breakdown_categories.id
        JOIN platforms ON platforms.id = breakdown_categories.id_platform
        WHERE user_skills.id_skill = ? AND user_skills.id_user = ? AND breakdown_categories.id=?";
        $results = [];
        foreach ($platforms as $index => $platform) {
            $breakdown_categories = BreakdownCategory::where($connection, 'id_platform', $platform['id'])->fetchAll(PDO::FETCH_ASSOC);
            $breakdown_categories = array_map(function ($breakdown_category) use ($connection, $request_body_skills, $platform) {
                $breakdown_category['skills'] = Skill::where($connection, 'id_breakdown_category', $breakdown_category['id'])->fetchAll(PDO::FETCH_ASSOC);
                $breakdown_category['skills'] = array_map(function ($skill) use ($connection, $request_body_skills, $breakdown_category) {
                    $skill_check = Request::send($connection, $request_body_skills, [$skill['id'], $this->id, $breakdown_category['id']])->fetchAll(PDO::FETCH_ASSOC)[0];
                    $skill['is_owned'] = $skill_check['is_owned'];
                    return $skill;
                }, $breakdown_category['skills']);
                $breakdown_category['skill_number'] = count($breakdown_category['skills']);
                $breakdown_category['skill_owned_number'] = count(array_filter($breakdown_category['skills'], function ($el) {
                    if ($el['is_owned'] === '1') {
                        return $el;
                    }
                }));
                return $breakdown_category;
            }, $breakdown_categories);
            $platform['breakdown_categories'] = $breakdown_categories;
            $platform['total_skill_number'] = array_reduce($platform['breakdown_categories'], function ($carry, $item) {
                return $carry += $item['skill_number'];
            });
            $platform['total_skill_owned_number'] = array_reduce($platform['breakdown_categories'], function ($carry, $item) {
                return $carry += $item['skill_owned_number'];
            });
            $results[] = $platform;
        }
        return $results;
    }

    public static function signOut(): void
    {
        if (isset($_SESSION['current_user'])) {
            unset($_SESSION['current_user']);
        } else {
            throw new Exception('user is not signed');
        }
    }

    public function updateSkills(PDO $connection, array $skills)
    {
        foreach ($skills as $key => $value) {
            if (intval($value) === 1) {
                UserSkill::create($connection, ['id_skill', 'id_user'], [$key, $this->id]);
            } else {
                $request_body = 'SELECT * FROM user_skills WHERE user_skills.id_skill = ? AND user_skills.id_user = ?';
                $current_skill = Request::send($connection, $request_body, [$key, $this->id])->fetchAll(PDO::FETCH_ASSOC);
                if (!empty($current_skill)) {
                    UserSkill::delete($connection, [], 'id', $current_skill[0]['id']);
                }
            }
        }
    }

    public function getChats(PDO $connection)
    {
        $request_body = "SELECT
        chats.id,
        chats.created_at,
        (SELECT COUNT(chat_users.id_user) FROM chat_users WHERE chat_users.id_chat=chats.id ) as subscriber_count,
        (SELECT GROUP_CONCAT(chat_users.id_user) FROM chat_users WHERE chat_users.id_chat=chats.id ) as subscriber_ids,
        (SELECT COUNT(messages.id) as message_count FROM messages WHERE messages.id_chat = chats.id) as message_count
        FROM chats
        JOIN chat_users ON chats.id=chat_users.id_chat
        WHERE chat_users.id_user = ?";

        $request = Request::send($connection, $request_body, [$this->id]);
        $results = [];
        while ($row = $request->fetch()) {
            $results[] = array(
                "id" => $row["id"],
                "created_at" => $row["created_at"],
                "subscriber_count" => $row["subscriber_count"],
                "message_count" => $row["message_count"],
                "preview_last_message" => Message::getPreviewlastMessage($connection, $row["id"]),
                "subscriber_ids" => !empty($row["subscriber_ids"]) ? array_map(function ($el) {
                    return intval($el);
                }, explode(',', $row["subscriber_ids"])) : [],
                "subscribers" => Chat::getSubscriberData($connection, $row["subscriber_ids"]),
                "subscriber_third_party" => Chat::getSubscriberThirdParty($connection, $row["subscriber_ids"], $this->id)
            );
        }
        return $results;
    }

    public function getCurrentOffers(PDO $connection)
    {
        $request_body = "SELECT
        offers.*,
        users.username,
        users.lastname,
        users.email,
        users.id as user_id
        FROM offers
        JOIN posts ON offers.id_post = posts.id
        JOIN users ON offers.id_user=users.id
        WHERE
        posts.id_user = ? AND offers.is_accepted = 1
        OR
        offers.id_user = ? AND offers.is_accepted = 1
        ORDER BY offers.created_at DESC";
        return Request::send($connection, $request_body, [$this->id, $this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getOldOffers(PDO $connection)
    {
        $request_body = "SELECT offers.*,
        users.username,
        users.lastname,
        users.email,
        users.id as user_id
        FROM offers
        JOIN posts ON offers.id_post = posts.id
        JOIN users ON offers.id_user=users.id
        WHERE
        posts.id_user = ? AND offers.is_declined = 1
        OR
        offers.id_user = ? AND offers.is_declined = 1
        ORDER BY offers.created_at DESC";
        return Request::send($connection, $request_body, [$this->id, $this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getOffers(PDO $connection)
    {
        $request_body = "SELECT offers.*,
        users.username,
        users.lastname,
        users.email,
        users.id as user_id
        FROM offers
        JOIN users ON offers.id_user=users.id
        WHERE offers.id_user = ?
        ORDER BY offers.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getSentOffers(PDO $connection)
    {
        $request_body = "SELECT offers.*,
        users.username,
        users.lastname,
        users.email,
        users.id as user_id
        FROM offers
        JOIN users ON offers.id_user=users.id
        WHERE offers.id_user = ?
        ORDER BY offers.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getReceivedOffers(PDO $connection)
    {
        $request_body = "SELECT offers.*,
        users.username,
        users.lastname,
        users.email,
        users.id as user_id
        FROM offers
        JOIN posts ON offers.id_post = posts.id
        JOIN users ON offers.id_user=users.id
        WHERE posts.id_user = ?
        ORDER BY offers.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getCurrentPosts(PDO $connection)
    {
        $request_body = "SELECT
        posts.id as id,
        posts.title as title,
        posts.content as content,
        posts.cover_image as cover_image,
        posts.images as images,
        posts.budget as budget,
        posts.created_at as created_at,
        posts.updated_at as updated_at,
        posts.city as city,
        posts.lat as lat,
        posts.lng as lon,
        posts.postal_code as postal_code,
        users.username,
        users.lastname,
        users.email,
        users.id as user_id,
        breakdown_categories.id as breakdown_category_id,
        breakdown_categories.name as breakdown_category_name,
        breakdown_categories.description as breakdown_category_description,
        platforms.id as platform_id,
        platforms.name as platform_name,
        platforms.description as platform_description
        FROM posts
        JOIN users ON posts.id_user=users.id
        JOIN breakdown_categories ON posts.id_breakdown_category = breakdown_categories.id
        JOIN platforms ON breakdown_categories.id_platform=platforms.id
        WHERE posts.id_user = ?
        AND posts.is_solved = 0
        ORDER BY posts.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getOldPosts(PDO $connection)
    {
        $request_body = "SELECT
        posts.id as id,
        posts.title as title,
        posts.content as content,
        posts.cover_image as cover_image,
        posts.images as images,
        posts.budget as budget,
        posts.created_at as created_at,
        posts.updated_at as updated_at,
        posts.city as city,
        posts.lat as lat,
        posts.lng as lon,
        posts.postal_code as postal_code,
        users.username,
        users.lastname,
        users.email,
        users.id as user_id,
        breakdown_categories.id as breakdown_category_id,
        breakdown_categories.name as breakdown_category_name,
        breakdown_categories.description as breakdown_category_description,
        platforms.id as platform_id,
        platforms.name as platform_name,
        platforms.description as platform_description
        FROM posts
        JOIN users ON posts.id_user=users.id
        JOIN breakdown_categories ON posts.id_breakdown_category = breakdown_categories.id
        JOIN platforms ON breakdown_categories.id_platform=platforms.id
        WHERE posts.id_user = ?
        AND posts.is_solved = 1
        ORDER BY posts.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getPosts(PDO $connection)
    {
        $request_body = "SELECT
        posts.id as id,
        posts.title as title,
        posts.content as content,
        posts.cover_image as cover_image,
        posts.images as images,
        posts.budget as budget,
        posts.created_at as created_at,
        posts.updated_at as updated_at,
        posts.city as city,
        posts.lat as lat,
        posts.lng as lon,
        posts.postal_code as postal_code,
        posts.is_solved as is_solved,
        users.username,
        users.lastname,
        users.email,
        users.id as user_id,
        breakdown_categories.id as breakdown_category_id,
        breakdown_categories.name as breakdown_category_name,
        breakdown_categories.description as breakdown_category_description,
        platforms.id as platform_id,
        platforms.name as platform_name,
        platforms.description as platform_description
        FROM posts
        JOIN users ON posts.id_user=users.id
        JOIN breakdown_categories ON posts.id_breakdown_category = breakdown_categories.id
        JOIN platforms ON breakdown_categories.id_platform=platforms.id
        WHERE posts.id_user = ?
        ORDER BY posts.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getCurrentAsks(PDO $connection)
    {
        $request_body = "SELECT asks.*,
        users.username,
        users.lastname,
        users.email,
        users.id as user_id
        FROM asks
        JOIN users ON asks.id_user=users.id
        WHERE asks.id_user = ?
        AND asks.is_accepted = 1
        ORDER BY asks.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getOldAsks(PDO $connection)
    {
        $request_body = "SELECT asks.*,
        users.username,
        users.lastname,
        users.email,
        users.id as user_id
        FROM asks
        JOIN users ON asks.id_user=users.id
        WHERE asks.id_user = ?
        AND asks.is_accepted = 0
        ORDER BY asks.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAsks(PDO $connection)
    {
        $request_body = "SELECT asks.*,
        users.username,
        users.lastname,
        users.email,
        users.id as user_id
        FROM asks
        JOIN users ON asks.id_user=users.id
        WHERE asks.id_user = ?
        ORDER BY asks.created_at DESC";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAverageScore(PDO $connection)
    {
        $request_body = "SELECT ROUND(AVG(reviews.score),2)
        FROM reviews WHERE reviews.id_reviewed = ?";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getReviews(PDO $connection)
    {

        $request_body = "SELECT
        reviews.*,
        users.username as username,
        users.id as user_id
        FROM reviews
        JOIN users ON reviews.id_reviewer = users.id
        WHERE reviews.id_reviewed = ?";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);

    }

    public static function getNearBy(PDO $connection, float $latitude, float $longitude, int $distance, string $breakdown_categories_ids = null, int $limit = 10, $earth_radius = 6371)
    {

        if ($breakdown_categories_ids) {
            $request_body = "SELECT *,
            (SELECT ROUND(AVG(reviews.score),2) FROM reviews WHERE reviews.id_reviewed = myTable.id) reviews_score,
            (SELECT COUNT(posts.id) FROM posts WHERE posts.id_user = myTable.id) posts_count,
            (SELECT COUNT(offers.id) FROM offers WHERE offers.id_user = myTable.id) offers_count
            FROM (
                SELECT *,
                (SELECT ROUND(AVG(reviews.score) FROM reviews WHERE reviews.id_reviewed = id))
                    ROUND((
                        (
                            (
                                acos(
                                    sin(( $latitude * pi() / 180))
                                    *
                                    sin(( users.lat * pi() / 180)) +

                                    cos(( $latitude * pi() /180 ))
                                    *
                                    cos(( users.lat * pi() / 180))
                                    *
                                    cos((( $longitude - users.lon) * pi()/180)))
                            ) * 180/pi()
                        ) / 360 * 2 * pi() * $earth_radius
                    ),2)
                as distance FROM users
            ) myTable
            WHERE distance <= $distance
            AND breakdown_category_id IN ($breakdown_categories_ids)
            ORDER BY distance ASC
            LIMIT $limit;";
        } else {
            $request_body = "SELECT *,
            (SELECT ROUND(AVG(reviews.score),2) FROM reviews WHERE reviews.id_reviewed = myTable.id) reviews_score,
            (SELECT COUNT(posts.id) FROM posts WHERE posts.id_user = myTable.id) posts_count,
            (SELECT COUNT(offers.id) FROM offers WHERE offers.id_user = myTable.id) offers_count
            FROM (
                SELECT *,
                   ROUND((
                        (
                            (
                                acos(
                                    sin(( $latitude * pi() / 180))
                                    *
                                    sin(( users.lat * pi() / 180)) +

                                    cos(( $latitude * pi() /180 ))
                                    *
                                    cos(( users.lat * pi() / 180))
                                    *
                                    cos((( $longitude - users.lon) * pi()/180)))
                            ) * 180/pi()
                        ) / 360 * 2 * pi() * $earth_radius
                    ),2)
                as distance FROM users
            ) myTable
            WHERE distance <= $distance
            ORDER BY distance ASC
            LIMIT $limit;";
        }
        return Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function streamNewChats(PDO $connection)
    {
        $timestamp = strftime('%F %H:%M:%S', time());
        header('Content-type: text/event-stream');
        header('Cache-control: no-cache');
        header('Connection: Keep-Alive');
        session_write_close();
        while (true) {

            $json_data = json_encode($this->getNewChats($connection, $timestamp));
            echo 'data: ' . $json_data;
            echo "\n\n";
            flush();
            ob_flush();
            ob_end_flush();
            if (!empty($json_data)) {
                $timestamp = strftime('%F %H:%M:%S', time());
            }
            sleep(1);
        }
    }

    public function getNewChats(PDO $connection, $timestamp)
    {
        $request_body = "SELECT * FROM chats JOIN chat_users ON chat_users.id_chat = chats.id WHERE chat_users.id_user = ? AND chats.created_at >= ?";
        return Request::send($connection, $request_body, [$this->id, "$timestamp"])->fetchAll(PDO::FETCH_ASSOC);

    }

}
