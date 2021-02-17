<?php
class User extends Application
{
    public $id;
    public function __construct($id)
    {
        $this->id = $id;
    }

    public static function signIn(PDO $connection, string $login, string $password): void
    {
        $request_body = 'SELECT * FROM users WHERE email=? OR username=?';
        $potential_user = Request::send($connection, $request_body, [$login, $login])->fetchAll(PDO::FETCH_ASSOC);
        if (isset($potential_user[0])) {
            $user = $potential_user[0];
            if (password_verify($password, $user['password'])) {
                $_SESSION['current_user'] = $user['id'];
            } else {
                throw new Exception('invalid informations');
            }
        } else {
            throw new Exception('invalid informations');
        }
    }

    public function getDetails(PDO $connection)
    {
        $request_body = 'SELECT *,
        (SELECT AVG(reviews.score)
        FROM reviews WHERE reviews.id_reviewed = users.id) reviews_score,
        (SELECT COUNT(posts.id) FROM posts WHERE posts.id_user = users.id) posts_count,
        (SELECT COUNT(offers.id) FROM offers WHERE offers.id_user = users.id) offers_count
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
                return $breakdown_category;
            }, $breakdown_categories);
            $platform['breakdown_categories'] = $breakdown_categories;
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
        $request_body = "SELECT AVG(reviews.score)
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

}
