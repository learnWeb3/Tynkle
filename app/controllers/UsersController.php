<?php

class UsersController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
        $this->beforeAction(['edit', "update", "destroy"]);
    }

    public function streamAlerts()
    {

        try {
            $this->current_user->streamAlerts($this->connection);
        } catch (Throwable $th) {
            die(http_response_code(500));
        }
    }

    public function index()
    {

        if (isset($_GET['ajax'])) {
            if (isset($_GET['lat'], $_GET['lng'])) {
                try {
                    $breakdown_categories_ids = isset($_GET['breakdown_categories']) ? $_GET['breakdown_categories'] : null;
                    echo json_encode(User::getNearBy($this->connection, $_GET['lat'], $_GET['lng'], 500, $breakdown_categories_ids));
                    die();
                } catch (\Throwable $th) {
                    die(http_response_code(500));
                }
            } else {
                if (isset($_GET['breakdown_categories'])) {
                    $users = User::findUserByBreakdownSkill($this->connection, '/users', $_GET['breakdown_categories']);
                } else {
                    $users = User::getAll($this->connection, '/users', $this->start, $this->limit);
                }
                echo json_encode($users);
                die();
            }
        } else {
            $page_data = Page::getDetails($this->connection, "users#index");
            $breakdown_categories = BreakdownCategory::all($this->connection, '/categories', 0, 100)['data'];
            $platforms = Platform::all($this->connection, '/platforms', 0, 100)['data'];
            if (isset($_GET['breakdown'])) {
                $users = User::findUserByBreakdownSkill($this->connection, '/users', $_GET['breakdown']);
            } else {
                $users = User::getAll($this->connection, '/users', $this->start, $this->limit);
            }
            $this->render(
                'index',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'posts',
                    'users' => $users['data'],
                    'breakdown_categories' => $breakdown_categories,
                    'platforms' => $platforms,
                    'next_page' => $users['next'],
                    'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                ),
            );
        }
    }

    public function ask_new_password()
    {
        if (isset($_POST['email'])) {

            try {
                $potential_user = User::where($this->connection, 'email', $_POST['email'])->fetchAll(PDO::FETCH_ASSOC);
                if (empty($potential_user)) {
                    $flash = new Flash(
                        array("L'utilisateur n'existe pas"),
                        'danger'
                    );
                    $flash->storeInSession();
                    die(header('location:' . ROOT_PATH . '/users/password/reset'));
                } else {
                    $mailer = new Mailer(
                        'tynkle',
                        $potential_user[0]['email'],
                        'accountverification@tynkle.com',
                        $potential_user[0]['email'],
                        'Réinitialiser le mot de passe',
                        "Bonjour vous avez demandé à reinitialiser votre mot de passe, veuillez cliquer sur le lien ci dessous afin de le reinitialiser.<br>Si cette action ne vient pas de vous merci d'ignorer cet email et de modifier votre mot de passe dans les paramètre de votre compte pour des raisons de sécurité.",
                        __DIR__ . '/../views/templates/mailer/reset_password_confirmation_mail.php'
                    );
                    $mailer->send(
                        array(
                            "reset_password_token" => $potential_user[0]['reset_password_token'],
                            "user_id" => $potential_user[0]['id'],
                        )
                    );
                    $flash = new Flash(
                        array("Un email pour réinitialiser le mot de passe de votre compte vous à été envoyé"),
                        'success'
                    );
                    $flash->storeInSession();
                    die(header('location:' . ROOT_PATH . '/signin'));
                }
            } catch (\Throwable $th) {
                $flash = new Flash(
                    array('Une erreur est survenue'),
                    'danger'
                );
                $flash->storeInSession();
                die(header('location:' . ROOT_PATH . '/users/password/reset'));
            }
        } else {
            try {
                $page_data = Page::getDetails($this->connection, "users#ask_new_password");
                $this->render(
                    'ask_new_password',
                    array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => 'reset_password',
                        'navbar_present' => false,
                        'footer_present' => false,
                        'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                    )
                );
            } catch (\Throwable $th) {
                $this->handleError(500);
            }
        }
    }

    public function reset_password()
    {
        if (isset($this->params['id'], $_GET['reset_password_token'])) {
            try {
                $potential_user = new User($this->params['id']);
                $user_data = $potential_user->getDetails($this->connection);
                if ($user_data['reset_password_token'] === $_GET['reset_password_token']) {
                    $page_data = Page::getDetails($this->connection, "users#reset_password");
                    $this->render(
                        'reset_password',
                        array(
                            'title' => $page_data['title'],
                            'description' => $page_data['description'],
                            'style_file_name' => 'reset_password',
                            'navbar_present' => false,
                            'footer_present' => false,
                            'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                            'reset_password_token' => $_GET['reset_password_token'],
                            'user_id' => $this->params['id'],
                        )
                    );
                } else {
                    $this->handleError(403);
                }
            } catch (\Throwable $th) {
                $this->handleError(500);
            }
        } else if (isset($_POST['user_id'], $_POST['reset_password_token'], $_POST['password'], $_POST['password_confirmation'])) {
            if ($_POST['password'] !== $_POST['password_confirmation']) {
                $flash = new Flash(
                    array("Les mots de passe ne sont pas identiques"),
                    'danger'
                );
                $flash->storeInSession();
                die(header('location:' . ROOT_PATH . '/users/' . $_POST['user_id'] . '/reset-password'));
            } else {
                try {
                    $reset_password_token = bin2hex(random_bytes(50));
                    User::update($this->connection, ['reset_password_token', 'password'], [$reset_password_token, password_hash($_POST['password'], PASSWORD_BCRYPT)], 'id', $_POST['user_id']);
                    $flash = new Flash(
                        array("Le mot de passe de votre compte à été mis à jour avec succès"),
                        'success'
                    );
                    $flash->storeInSession();
                    die(header('location:' . ROOT_PATH . '/signin'));
                } catch (\Throwable $th) {
                    $flash = new Flash(
                        array($th->getMessage()),
                        'danger'
                    );
                    $flash->storeInSession();
                    die(header('location:' . ROOT_PATH . '/signin'));
                }
            }
        } else {
            $this->handleError(422);
        }
    }

    public function confirm()
    {
        if (isset($this->params['id'], $_GET['verify_token'])) {
            try {
                User::update($this->connection, ['is_verified'], [1], 'id', $this->params['id']);
                $flash = new Flash(
                    array("Votre compte a bien été validé vous pouvez vous connecter"),
                    'success'
                );
                $flash->storeInSession();
                die(header('location:' . ROOT_PATH . '/'));
            } catch (\Throwable $th) {
                $this->handleError(500);
            }
        } else {
            $this->handleError(422);
        }
    }

    public function create()
    {
        if (isset($_POST['email'], $_POST['password'], $_POST['username'], $_POST['password_confirmation'], $_POST['is_helper'], $_POST['cgu_accepted'])) {
            if ($_POST['password_confirmation'] === $_POST['password']) {
                try {
                    $verify_token = bin2hex(random_bytes(50));
                    $reset_password_token = bin2hex(random_bytes(50));
                    $geocoder = new Geocoder();
                    $coordinates = $geocoder->getCoordinates();
                    $adress_parts = $geocoder->reverseGeocode($coordinates['location']['lng'], $coordinates['location']['lat']);
                    $user = User::create(
                        $this->connection,
                        ['email', 'password', 'username', 'is_helper', 'verify_token', 'reset_password_token', 'lat', 'lon', 'adress', 'city', 'postal_code'],
                        [
                            $_POST['email'],
                            password_hash($_POST['password'], PASSWORD_BCRYPT),
                            $_POST['username'],
                            intval($_POST['is_helper']),
                            $verify_token,
                            $reset_password_token,
                            $coordinates['location']['lat'],
                            $coordinates['location']['lng'],
                            $adress_parts["route"],
                            $adress_parts["locality"],
                            $adress_parts["postal_code"],
                        ],
                        $_POST,
                        [
                            'username' => 'required',
                            'email' => 'required|email',
                            'password' => 'required|min:6',
                            "is_helper" => 'required',
                            "cgu_accepted" => 'required',
                        ]
                    );

                    $mailer = new Mailer(
                        'tynkle',
                        $user[0]['email'],
                        'accountverification@tynkle.com',
                        $user[0]['email'],
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
                        array("Compte crée avec succès, vous avez reçu un email, veuillez confirmer votre compte"),
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
                    array("Les mots de passe ne sont pas identiques"),
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
                    die(header('Location:' . ROOT_PATH . '/profile#account_informations'));
                } catch (ModelException $e) {
                    $flash = new Flash(
                        $e->getMessages(),
                        'danger'
                    );
                    $flash->storeInSession();
                    die(header('Location:' . ROOT_PATH . '/profile#account_informations'));
                }
            } else {
                $flash = new Flash(
                    array("Erreur lors de la mise à jour de votre compte"),
                    'danger'
                );
                $flash->storeInSession();
                die(header('Location:' . ROOT_PATH . '/profile'));
            }
        } else if (isset($_POST['firstname'], $_POST['lastname'], $_POST['birthdate'], $_POST['adress'], $_POST['city'], $_POST['postal_code'], $_POST['phone_number'], $_POST['lat'], $_POST['lon'])) {
            $firstname = empty($_POST['firstname']) ? $user_data['firstname'] : $_POST['firstname'];
            $lastname = empty($_POST['lastname']) ? $user_data['lastname'] : $_POST['lastname'];
            $birthdate = empty($_POST['birthdate']) ? $user_data['birthdate'] : $_POST['birthdate'];
            $adress = empty($_POST['adress']) ? $user_data['adress'] : $_POST['adress'];
            $city = empty($_POST['city']) ? $user_data['city'] : $_POST['city'];
            $postal_code = empty($_POST['postal_code']) ? $user_data['postal_code'] : $_POST['postal_code'];
            $phone_number = empty($_POST['phone_number']) ? $user_data['phone_number'] : $_POST['phone_number'];
            $lat = empty($_POST['lat']) ? $user_data['lat'] : $_POST['lat'];
            $lon = empty($_POST['lon']) ? $user_data['lon'] : $_POST['lon'];
            try {
                User::update(
                    $this->connection,
                    ['firstname', 'lastname', 'birthdate', 'adress', 'city', 'postal_code', 'phone_number', 'lat', 'lon'],
                    array(
                        $firstname,
                        $lastname,
                        $birthdate,
                        $adress,
                        $city,
                        $postal_code,
                        $phone_number,
                        $lat,
                        $lon,
                    ),
                    'id',
                    $this->current_user->id,
                );
                $flash = new Flash(
                    array("Mise jour réussie"),
                    'success'
                );
                $flash->storeInSession();
                die(header('Location:' . ROOT_PATH . '/profile#personnal_informations'));
            } catch (ModelException $e) {
                $flash = new Flash(
                    ['Une erreure est survenue'],
                    'danger'
                );
                $flash->storeInSession();
                die(header('Location:' . ROOT_PATH . '/profile#personnal_informations'));
            }
        } else {
            $this->handleError(422);
        }
    }

    function new()
    {
        try {
            $page_data = Page::getDetails($this->connection, "users#new");
            $this->render(
                'new',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'signup',
                    'navbar_present' => false,
                    'footer_present' => false,
                    'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                )
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }

    public function edit()
    {
        if (isset($this->current_user)) {
            try {
                $page_data = Page::getDetails($this->connection, "users#edit");
                $this->render('edit', array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'profile',
                    'user' => $this->current_user->getDetails($this->connection),
                    'platforms' => $this->current_user->getUserSkill($this->connection),
                    'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                ));
            } catch (\Throwable $th) {
                $this->handleError(500);
            }
        } else {
            $this->handleError(403);
        }
    }

    public function show()
    {
        if (isset($this->params['id'])) {
            try {
                if (!empty(User::find($this->connection, $this->params['id'])->fetchAll(PDO::FETCH_ASSOC))) {
                    $author = new User($this->params['id']);
                    $page_data = Page::getDetails($this->connection, "users#show");
                    $user_data = $author->getDetails($this->connection);
                    $user = new User($user_data['id']);
                    $posts = $user->getPosts($this->connection);
                    $reviews = $user->getReviews($this->connection);
                    $platforms = $user->getUserSkill($this->connection);
                    $follow_id = (isset($this->current_user)) ? $this->current_user->getCurrentUserFollow($this->connection, $user_data['id']) : null;
                    $this->render('show', array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => 'user',
                        'user' => $user_data,
                        'posts' => $posts,
                        "reviews" => $reviews,
                        'platforms' => $platforms,
                        'follow_id' => $follow_id,
                        'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                    ));
                } else {
                    $this->handleError(404);
                }
            } catch (\Throwable $th) {
                $this->handleError(500);
            }
        }
    }
    public function destroy()
    {
        try {
            User::delete($this->connection, [], 'id', $this->current_user->id);
            unset($_SESSION['current_user']);
            $flash = new Flash(
                array("Compte supprimé avec succès"),
                'danger'
            );
            $flash->storeInSession();
            die(header('Location:' . ROOT_PATH ));
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }

    private function beforeAction(array $targeted_method_names)
    {
        if (in_array($this->asked_method, $targeted_method_names)) {
            !isset($this->current_user) && die($this->handleError(403));
        }
    }

    public function google_auth()
    {
        try {
            User::googleAuthenticate($this->connection);
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }
}
