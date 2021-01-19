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

    public static function signOut(): void
    {
        if (isset($_SESSION['current_user'])) {
            unset($_SESSION['current_user']);
        }else{
            throw new Exception('user is not signed');
        }
    }
}
