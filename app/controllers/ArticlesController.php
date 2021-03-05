<?php

class ArticlesController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
        $this->beforeAction(['show', 'edit', 'update', 'destroy']);
    }

    public function create()
    {
        if (isset($this->json_params['content'], $this->json_params['cover_image'], $this->json_params['title'], $this->json_params['description'])) {
            try {
                echo json_encode(Article::create(
                    $this->connection,
                    ['content', 'title', 'description', 'cover_image'],
                    [$this->json_params['content'], $this->json_params['title'], $this->json_params['description'], $this->json_params['cover_image']]),
                    $this->json_params,
                    [
                        'content' => 'required',
                        "title" => 'required',
                        "description" => 'required',
                        "cover_image" => 'required',
                    ]
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
        if (isset($this->json_params['content'], $this->json_params['title'], $this->json_params['description'], $this->article, $this->params['id'])) {
            try {
                echo json_encode(Article::update(
                    $this->connection,
                    ['content', 'title', 'description', 'cover_image'],
                    [$this->json_params['content'], $this->json_params['title'], $this->json_params['description'], $this->json_params['cover_image']],
                    'id',
                    $this->params['id'],
                    $this->json_params,
                    [
                        'content' => 'required',
                        "title" => 'required',
                        "description" => 'required',
                        "cover_image" => 'required',
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

    public function index()
    {
        try {
            $page_data = Page::getDetails($this->connection, "articles#index");
            $this->render(
                'index',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'articles',
                    'navbar_present' => true,
                    'footer_present' => true,
                    'navbar_blog' => true,
                    'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                    'articles' => Article::all($this->connection, '/articles', $this->start, $this->limit),
                )
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }

    function new () {
        try {
            $page_data = Page::getDetails($this->connection, "articles#new");
            $this->render(
                'new',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'articles',
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

    public function show()
    {

        if (isset($this->article)) {

            try {
                $page_data = Page::getDetails($this->connection, "articles#show");
                $this->render(
                    'show',
                    array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => 'articles',
                        'navbar_present' => true,
                        'footer_present' => true,
                        'navbar_blog' => true,
                        'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                        'article' => $this->article->getDetails($this->connection),
                    )
                );
            } catch (\Throwable $th) {
                $this->handleError(500);
            }

        } else {
            $this->handleError(422);
        }
    }

    public function edit()
    {

        if (isset($this->article)) {

            try {
                $page_data = Page::getDetails($this->connection, "articles#edit");
                $this->render(
                    'edit',
                    array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => 'articles',
                        'navbar_present' => true,
                        'footer_present' => true,
                        'navbar_blog' => true,
                        'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                        'article' => $this->article->getDetails($this->connection),
                    )
                );
            } catch (\Throwable $th) {
                $this->handleError(500);
            }

        } else {
            $this->handleError(422);
        }
    }

    public function beforeAction($targeted_method_names)
    {
        if (in_array($this->asked_method, $targeted_method_names)) {
            if (isset($this->params['id'])) {
                $article = Article::find($this->connection, $this->params['id'])->fetchAll(PDO::FETCH_ASSOC);
                if (empty($article)) {
                    $this->handleError(404);
                } else {
                    $this->article = new Article($this->params['id']);
                }
            } else {
                $this->handleError(422);
            }
        }
    }

}
