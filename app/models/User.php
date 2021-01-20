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
        $request_body = 'SELECT * FROM users WHERE users.id=?';
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
        $breakdown_categories = BreakdownCategory::all($connection, '/breakdowns', 0, 100)['data'];
        $request_body = "SELECT 
        skills.id as skill_id,
        skills.name as skill_name,
        skills.created_at as skill_created_at,
        skills.updated_at as skill_updated_at,
        (SELECT COUNT(user_skills.id) as is_owned FROM user_skills WHERE user_skills.id_skill = id_skill AND user_skills.id_user = ?) is_owned
        FROM skills WHERE id_breakdown_category = ?";
        return array_map(function ($breakdown_category) use ($connection, $request_body) {
            return array(
                'breakdown_categories' => $breakdown_category,
                'skills' =>  Request::send($connection, $request_body, [$this->id, $breakdown_category['id']])->fetchAll(PDO::FETCH_ASSOC)
            );
        }, $breakdown_categories);
    }

    public static function signOut(): void
    {
        if (isset($_SESSION['current_user'])) {
            unset($_SESSION['current_user']);
        } else {
            throw new Exception('user is not signed');
        }
    }
}
