<?php
class UsersController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
        $this->beforeAction(['edit', "update"]);
    }

    public function create()
    {
        if (isset($_POST['email'], $_POST['password'], $_POST['username'], $_POST['password_confirmation'], $_POST['is_helper'])) {
            if ($_POST['password_confirmation'] === $_POST['password']) {
                try {
                    User::create(
                        $this->connection,
                        ['email', 'password', 'username', 'is_helper'],
                        [$_POST['email'], password_hash($_POST['password'], PASSWORD_BCRYPT), $_POST['username'],
                            intval($_POST['is_helper'])],
                        $_POST,
                        [
                            'username' => 'required',
                            'email' => 'required|email',
                            'password' => 'required|min:6',
                            "is_helper" => 'required',
                        ]
                    );
                    $flash = new Flash(
                        array("Compte crée avec succès"),
                        'success'
                    );
                    $flash->storeInSession();
                    die(header('location:' . ROOT_PATH . '/signin'));
                } catch (ModelException $e) {
                    $flash = new Flash(
                        $e->getMessages(),
                        'danger'
                    );
                    $flash->storeInSession();
                    die(header('location:' . ROOT_PATH . '/register'));
                }
            } else {
                $flash = new Flash(
                    array("Erreur lors de la création de votre compte"),
                    'danger'
                );
                $flash->storeInSession();
                die(header('location:' . ROOT_PATH . '/register'));
            }
        } else {
            $this->handleError(422);
        }
    }

    public function update()
    {
        $user_data = $this->current_user->getDetails($this->connection);
        if (isset($_POST['email'], $_POST['password'], $_POST['password_confirmation'], $_POST['username'], $_POST['is_helper'])) {
            if ($_POST['password_confirmation'] === $_POST['password']) {
                try {
                    User::update(
                        $this->connection,
                        ['email', 'password', 'username', 'is_helper'],
                        array(
                            $_POST['email'],
                            password_hash($_POST['password'], PASSWORD_BCRYPT),
                            $_POST['username'],
                            $_POST['is_helper'],
                        ),
                        'id',
                        $this->current_user->id,
                        $_POST,
                        [
                            'username' => 'required',
                            'email' => 'required|email',
                            'password' => 'required|min:6',
                            "is_helper" => 'required',
                        ]
                    );
                    $flash = new Flash(
                        array("Mise jour réussie"),
                        'success'
                    );
                    $flash->storeInSession();
                    die(header('Location:' . ROOT_PATH . '/profile'));
                } catch (ModelException $e) {
                    $flash = new Flash(
                        $e->getMessages(),
                        'danger'
                    );
                    $flash->storeInSession();
                    die(header('Location:' . ROOT_PATH . '/profile'));
                }
            } else {
                $flash = new Flash(
                    array("Erreur lors de la mise à jour de votre compte"),
                    'danger'
                );
                $flash->storeInSession();
                die(header('Location:' . ROOT_PATH . '/profile'));
            }
        } else if (isset($_POST['firstname'], $_POST['lastname'], $_POST['birthdate'], $_POST['adress'], $_POST['city'], $_POST['postal_code'], $_POST['phone_number'])) {
            $firstname = empty($_POST['firstname']) ? $user_data['firstname'] : $_POST['firstname'];
            $lastname = empty($_POST['lastname']) ? $user_data['lastname'] : $_POST['lastname'];
            $birthdate = empty($_POST['birthdate']) ? $user_data['birthdate'] : $_POST['birthdate'];
            $adress = empty($_POST['adress']) ? $user_data['adress'] : $_POST['adress'];
            $city = empty($_POST['city']) ? $user_data['city'] : $_POST['city'];
            $postal_code = empty($_POST['postal_code']) ? $user_data['postal_code'] : $_POST['postal_code'];
            $phone_number = empty($_POST['phone_number']) ? $user_data['phone_number'] : $_POST['phone_number'];
            try {
                User::update(
                    $this->connection,
                    ['firstname', 'lastname', 'birthdate', 'adress', 'city', 'postal_code', 'phone_number'],
                    array(
                        $firstname,
                        $lastname,
                        $birthdate,
                        $adress,
                        $city,
                        $postal_code,
                        $phone_number,
                    ),
                    'id',
                    $this->current_user->id,
                );
                $flash = new Flash(
                    array("Mise jour réussie"),
                    'success'
                );
                $flash->storeInSession();
                die(header('Location:' . ROOT_PATH . '/profile'));
            } catch (ModelException $e) {
                $flash = new Flash(
                    ['Une erreure est survenue'],
                    'danger'
                );
                $flash->storeInSession();
                die(header('Location:' . ROOT_PATH . '/profile'));
            }
        } else {
            $this->handleError(422);
        }
    }

    function new () {
        $this->render(
            'new',
            array(
                'title' => "Tynkle: S'inscrire",
                'description' => 'Tynkle: rejoindre la communauté ?',
                'style_file_name' => 'signup',
            )
        );
    }

    public function edit()
    {
        if (isset($this->current_user)) {
            $this->render('edit', array(
                'title' => "Tynkle: Mon compte",
                'description' => 'Tynkle: mon compte',
                'style_file_name' => 'profile',
                'user' => $this->current_user->getDetails($this->connection),
                'platforms' => $this->current_user->getUserSkill($this->connection),
            ));
        } else {
            $this->handleError(403);
        }

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
