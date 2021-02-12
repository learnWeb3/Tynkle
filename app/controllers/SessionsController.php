<?php

class SessionsController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
    }
    public function create()
    {
        if (isset($_POST['login'], $_POST['password'])) {
            try {
                User::signIn($this->connection, $_POST['login'], $_POST['password']);
                $flash = new Flash(
                    array("Connexion réussie"),
                    'success'
                );
                $flash->storeInSession();
                die(header('location: ' . ROOT_PATH . '/posts'));
            } catch (\Throwable $th) {
                die(header('location: ' . ROOT_PATH . '/signin'));
            }
        } else {
            $this->handleError(422);
        }
    }

    function new () {
        $this->render(
            'new',
            array(
                'title' => 'Tynkle: Se connecter',
                'description' => 'Tynkle: De retour parmis nous ?',
                'style_file_name' => 'signin',
            )
        );
    }
    public function destroy()
    {
        try {
            User::signOut();
            die(http_response_code(204));
        } catch (\Throwable $th) {
            die(http_response_code(500));
        }
    }
}
