<?php
class UsersController extends ApplicationController
{

    public function __construct(array $params, string $asked_method)
    {
        parent::__construct($params, $asked_method);
        $this->beforeAction(['destroy', 'update']);
    }

    public function create()
    {
        if (isset($_POST['email'], $_POST['password'], $_POST['username'], $_POST['password_confirmation'], $_POST['is_helper'])) {
            if ($_POST['password_confirmation'] === $_POST['password']) {
                User::create($this->connection, ['email', 'password', 'username', 'is_helper'], [$_POST['email'], password_hash($_POST['password'], PASSWORD_BCRYPT), $_POST['username'], intval($_POST['is_helper'])]);
                die(header('location:' . ROOT_PATH . '/signin'));
            } else {
                die(header('location:' . ROOT_PATH . '/register'));
            }
        } else {
            $this->handleError(422);
        }
    }

    public function update()
    {
        if (isset($_POST['email'], $_POST['password'], $_POST['username'], $_POST['firstname'], $_POST['lastname'], $_POST['birthdate'], $_POST['adress'], $_POST['phone_number'], $_POST['is_helper'])) {
            User::update(
                $this->connection,
                ['email', 'password', 'username', 'firstname', 'lastname', 'birthdate', 'adress', 'phone_number', 'is_helper'],
                array(
                    $_POST['email'],
                    password_hash($_POST['password'], PASSWORD_BCRYPT),
                    $_POST['username'],
                    $_POST['firstname'],
                    $_POST['lastname'],
                    $_POST['birthdate'],
                    $_POST['adress'],
                    $_POST['phone_number'],
                    $_POST['is_helper']
                ),
                'id',
                $this->current_user['id']
            );
        } else {
            $this->handleError(422);
        }
    }

    public function new()
    {
        $this->render(
            'new',
            array(
                'title' => "Tynkle: S'inscrire",
                'description' => 'Tynkle: rejoindre la communauté ?',
                'style_file_name' => 'signup'
            )
        );
    }

    public function edit()
    {
        // if (isset($this->current_user))
        // {
        //     $this->render('edit', array(
        //         'title' => "Tynkle: Mon compte",
        //         'description' => 'Tynkle: mon compte',
        //         'style_file_name' => 'edit',
        //         'user'=>$this->current_user->getDetails($this->connection),
        //         'user_skills'=>$this->current_user->getUserSkill($this->connection)
        //     ));

        // }else{
        //     $this->handleError(403);
        // }

        var_dump($this->current_user->getUserSkill($this->connection));
    }

    public function index()
    {
    }

    public function show()
    {
    }
    public function destroy()
    {
        User::delete($this->connection, [], 'id', $this->current_user['id']);
    }

    private function beforeAction(array $targeted_method_names)
    {
        if (in_array($this->asked_method, $targeted_method_names)) {
            !isset($this->current_user) && die($this->handleError(403));
        }
    }
}
