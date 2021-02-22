<?php

class HomeController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
    }

    public function index()
    {
        $this->render(
            'index',
            array(
                'title' => 'Bienvenue sur Tynkle',
                'description' => 'Dépanner ou être aider en toute sérénité',
                'style_file_name' => 'home',
            ),
        );
    }

}
