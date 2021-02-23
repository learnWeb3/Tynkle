<?php

class AdminController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
    }

    public function index()
    {
        if (isset($this->current_user)) {
            try {
                $user_data = $this->current_user->getDetails($this->connection);
                if ($user_data['is_admin'] === '1') {
                    $pages = Page::getPagesGroupedByPageGroup($this->connection);
                    $this->render(
                        'index',
                        array(
                            'title' => 'Tynkle: Administrer la plateforme',
                            'description' => 'Tynkle: Administration, Insights',
                            'style_file_name' => 'admin',
                            'navbar_present' => false,
                            'footer_present' => false,
                            'pages'=>$pages
                        )
                    );
                } else {
                    $this->handleError(403);
                }
            } catch (\Throwable $th) {
                $this->handleError(500);
            }
        } else {
            $this->handleError(403);
        }
    }

}
