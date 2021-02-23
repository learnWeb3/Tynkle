<?php

class HomeController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
    }

    public function index()
    {
        try {
            $page_data = Page::getDetails($this->connection, "home#index");
            $this->render(
                'index',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'home',
                ),
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }

}
