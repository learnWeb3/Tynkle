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
                    'background_image_path'=>$page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH.'/img/pages/home.jpeg'
                ),
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }

}