<?php

class SessionsController extends ApplicationController
{

    public function __construct(array $params, string $asked_method)
    {
        parent::__construct($params, $asked_method);
    }
    public function create()
    {
        if (isset($_POST['login'], $_POST['password'])) {
            User::signIn($this->connection, $_POST['login'], $_POST['password']);
        } else {
            $this->handleError(422);
        }
    }

    public function new()
    {
        $this->render('new', 
            array(
                'title'=>'Tynkle: Se connecter',
                'description'=> 'Tynkle: De retour parmis nous ?',
                'style_file_name'=>'signin'
            )
        );
    }
    public function destroy()
    {
        User::signOut();
    }
}
