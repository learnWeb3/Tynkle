<?php

class RulesController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
        $this->beforeAction(['show', 'edit', 'update', 'destroy']);
        $this->checkAdminRights(['new', 'create', 'update', 'edit']);
    }

    public function new () {
        try {
            $page_data = Page::getDetails($this->connection, "rules#new");
            $this->render(
                'new',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'rules',
                    'navbar_present' => true,
                    'footer_present' => true,
                    'navbar_blog' => true,
                    'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                )
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }

    public function create()
    {
        if (isset($this->json_params['content'])) {
            try {
                echo json_encode(Rule::create(
                    $this->connection,
                    ['content'],
                    [$this->json_params['content']],
                    $this->json_params,
                    [
                        'content' => 'required'
                    ])
                );
                die();
            } catch (\Throwable $th) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }

    public function update()
    {
        if (isset($this->json_params['content'], $this->rule, $this->params['id'])) {
            try {
                echo json_encode(Rule::update(
                    $this->connection,
                    ['content'],
                    [$this->json_params['content']],
                    'id',
                    $this->params['id'],
                    $this->json_params,
                    [
                        'content' => 'required'
                    ]
                ));
                die();
            } catch (\Throwable $th) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }


    public function show()
    {

        if (isset($this->rule)) {

            try {
                $page_data = Page::getDetails($this->connection, "rules#show");
                $this->render(
                    'show',
                    array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => 'rules',
                        'navbar_present' => true,
                        'footer_present' => true,
                        'navbar_blog' => true,
                        'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                        'rule' => $this->rule->getDetails($this->connection),
                    )
                );
            } catch (\Throwable $th) {
                var_dump($th);
                $this->handleError(500);
            }

        } else {
            $this->handleError(422);
        }
    }

    public function edit()
    {

        if (isset($this->rule)) {

            try {
                $page_data = Page::getDetails($this->connection, "rules#edit");
                $this->render(
                    'edit',
                    array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => 'rules',
                        'navbar_present' => true,
                        'footer_present' => true,
                        'navbar_blog' => true,
                        'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                        'rule' => $this->rule->getDetails($this->connection),
                    )
                );
            } catch (\Throwable $th) {
                $this->handleError(500);
            }

        } else {
            $this->handleError(422);
        }
    }


    public function checkAdminRights(array $targeted_method_names)
    {
        if (in_array($this->asked_method, $targeted_method_names)) {
            if (isset($this->current_user)) {
                try {
                    $user_data = $this->current_user->getDetails($this->connection);
                    if ($user_data['is_admin'] === '0') {
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


    public function beforeAction($targeted_method_names)
    {
        if (in_array($this->asked_method, $targeted_method_names)) {
            if (isset($this->params['id'])) {
                $rule = Rule::find($this->connection, $this->params['id'])->fetchAll(PDO::FETCH_ASSOC);
                if (empty($rule)) {
                    $this->handleError(404);
                } else {
                    $this->rule = new Rule($this->params['id']);
                }
            } else {
                $this->handleError(422);
            }
        }
    }

}
