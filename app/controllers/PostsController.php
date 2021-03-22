<?php

class PostsController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
        $this->beforeAction(['destroy', 'update', 'show', 'edit']);
    }

    public function create()
    {
        if (isset($this->current_user)) {
            $uploaded_file_paths = Uploader::uploadFileBatch(array_keys($_FILES));
            $cover_image = isset($uploaded_file_paths[0]) ? $uploaded_file_paths[0] : null;
            try {

                try {
                    $post = Post::create(
                        $this->connection,
                        ['id_user', 'id_breakdown_category', 'images', 'cover_image', 'title', 'content', 'budget', 'city', 'postal_code', 'lat', 'lng'],
                        array(
                            $this->current_user->id,
                            $_POST['id_breakdown_category'],
                            json_encode($uploaded_file_paths),
                            $cover_image,
                            $_POST['title'],
                            $_POST['content'],
                            $_POST['budget'],
                            $_POST['city'],
                            $_POST['postal_code'],
                            $_POST['lat'],
                            $_POST['lng'],
                        ),
                        $_POST,
                        [
                            'id_breakdown_category' => 'required',
                            "title" => 'required',
                            "content" => 'required',
                            "budget" => 'required',
                            "city" => 'required',
                            "postal_code" => 'required',
                            "lat" => 'required',
                            "lng" => 'required',
                        ]
                    )[0];
                } catch (ModelException $e) {
                    $flash = new Flash(
                        $e->getMessages(),
                        'danger'
                    );
                    $flash->storeInSession();
                    die(header('location:' . ROOT_PATH . '/posts/new'));
                }
                $flash = new Flash(
                    array("Annonce crée avec succès"),
                    'success'
                );
                $flash->storeInSession();
                die(header('location:' . ROOT_PATH . '/posts' . '/' . $post['id']));
            } catch (\Throwable $th) {
                $this->handleError(500);
            }
        } else {
            $this->handleError(422);
        }
    }

    public function update()
    {
        if (isset($this->current_user)) {
            $post_data = $this->post->getDetails($this->connection);
            if ($post_data['user_id'] === $this->current_user->id) {
                try {
                    $uploaded_file_paths = Uploader::uploadFileBatch(array_keys($_FILES));
                    $cover_image = isset($uploaded_file_paths[0]) ? $uploaded_file_paths[0] : null;
                    Post::update(
                        $this->connection,
                        ['id_user', 'id_breakdown_category', 'images', 'cover_image', 'title', 'content', 'budget', 'city', 'postal_code', 'lat', 'lng'],
                        array(
                            $this->current_user->id,
                            $_POST['id_breakdown_category'],
                            json_encode($uploaded_file_paths),
                            $cover_image,
                            $_POST['title'],
                            $_POST['content'],
                            $_POST['budget'],
                            $_POST['city'],
                            $_POST['postal_code'],
                            $_POST['lat'],
                            $_POST['lng'],
                        ),
                        'id',
                        $this->params['id']
                    );
                    $flash = new Flash(
                        array("Annonce mise à jour avec succès"),
                        'success'
                    );
                    $flash->storeInSession();
                    die(header('location:' . ROOT_PATH . "/posts/" . $this->post->id));
                } catch (\Throwable $th) {
                    $this->handleError(500);
                }
            } else {
                $this->handleError(403);
            }
        } else {
            $this->handleError(422);
        }
    }

    function new () {

        if (isset($this->current_user)) {
            try {
                $breakdown_categories = BreakdownCategory::all($this->connection, '/categories', 0, 100)['data'];
                $platforms = Platform::all($this->connection, '/platforms', 0, 100)['data'];
                $page_data = Page::getDetails($this->connection, "posts#new");
                $this->render(
                    'new',
                    array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => 'new_post',
                        'breakdown_categories' => $breakdown_categories,
                        'platforms' => $platforms,
                        'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                    ),
                );
            } catch (\Throwable $th) {
                $this->handleError(500);
            }
        } else {
            $this->handleError(403);
        }
    }

    public function index()
    {
        if (isset($_GET['ajax'])) {
            if ($this->route_name === 'index_post_geosearch') {
                if (isset($_GET['lat'], $_GET['lng'], $_GET['distance'])) {
                    try {
                        if (isset($_GET['breakdown_categories'])) {
                            $posts = Post::getNearBy($this->connection, $_GET['lat'], $_GET['lng'], $_GET['distance'], $_GET['breakdown_categories']);
                        } else {
                            $posts = Post::getNearBy($this->connection, $_GET['lat'], $_GET['lng'], $_GET['distance']);
                        }
                        echo json_encode($posts);
                        die();
                    } catch (\Throwable $th) {
                        die(http_response_code(500));
                    }
                } else {
                    die(http_response_code(422));
                }
            } else {
                if (isset($_GET['breakdown_categories'])) {
                    try {
                        $posts = Post::findBy($this->connection, '/posts', 'id_breakdown_category', $_GET['breakdown_categories']);
                        echo json_encode($posts);
                        die();
                    } catch (\Throwable $th) {
                        die(http_response_code(500));
                    }
                } else {
                    try {
                        $posts = Post::getPosts($this->connection, '/posts', $this->limit, $this->start);
                        echo json_encode($posts);
                        die();
                    } catch (\Throwable $th) {
                        die(http_response_code(500));
                    }
                }

            }
        } else {
            $breakdown_categories = BreakdownCategory::all($this->connection, '/categories', 0, 100)['data'];
            $platforms = Platform::all($this->connection, '/platforms', 0, 100)['data'];
            if (isset($_GET['platform']) && !isset($_GET['breakdown'])) {
                $posts = Post::findBy($this->connection, '/posts', 'id', $_GET['platform'], 'platforms');
            } elseif (isset($_GET['platform'], $_GET['breakdown'])) {
                $posts = Post::findBy($this->connection, '/posts', 'id_breakdown_category', $_GET['breakdown'], 'posts');
            } else {
                $posts = Post::getPosts($this->connection, '/posts', $this->limit, $this->start);
            }
            $page_data = Page::getDetails($this->connection, "posts#index");
            $this->render(
                'index',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'posts',
                    'posts' => $posts['data'],
                    'breakdown_categories' => $breakdown_categories,
                    'platforms' => $platforms,
                    'next_page' => $posts['next'],
                    'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                ),

            );
        }
    }

    public function show()
    {
        if (isset($this->post)) {
            try {
                $page_data = Page::getDetails($this->connection, "posts#show");
                $post_data = $this->post->getDetails($this->connection);
                $author = new User($post_data['user_id']);
                $author_data = $author->getDetails($this->connection);
                $similar_posts = $this->post->getSimilarPosts($this->connection, '/posts', $this->limit, $this->start, $post_data['breakdown_category_id']);
                $this->render(
                    'show',
                    array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => 'post',
                        'post' => $post_data,
                        'similar_posts' => $similar_posts['data'],
                        'author' => $author_data,
                        'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
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
        if (isset($this->post)) {
            try {
                $breakdown_categories = BreakdownCategory::all($this->connection, '/categories', 0, 100)['data'];
                $platforms = Platform::all($this->connection, '/platforms', 0, 100)['data'];
                $post_data = $this->post->getDetails($this->connection);
                $page_data = Page::getDetails($this->connection, "posts#edit");
                $this->render(
                    'edit',
                    array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => 'new_post',
                        'post' => $post_data,
                        'breakdown_categories' => $breakdown_categories,
                        'platforms' => $platforms,
                        'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                    )
                );
            } catch (\Throwable $th) {
                $this->handleError(500);
            }
        } else {
            $this->handleError(422);
        }
    }
    public function destroy()
    {
        if (isset($this->current_user)) {
            if ($this->post['id_user'] === $this->current_user['id']) {
                try {
                    Post::delete($this->connection, [], 'id', $this->post['id']);
                } catch (\Throwable $th) {
                    $this->handleError(500);
                }
            } else {
                $this->handleError(403);
            }
        } else {
            $this->handleError(422);
        }
    }

    private function beforeAction(array $targeted_method_names)
    {
        if (in_array($this->asked_method, $targeted_method_names)) {
            $post = Post::find($this->connection, $this->params['id'])->fetchAll(PDO::FETCH_ASSOC);
            if (!empty($post)) {
                if (in_array($this->asked_method, ['edit', 'update', 'destroy'])) {
                    if (isset($this->current_user)) {
                        if ($this->current_user->id === $post[0]['id_user']) {
                            $this->post = new Post($post[0]['id_user']);
                        } else {
                            $this->handleError(403);
                        }
                    } else {
                        $this->handleError(403);
                    }
                } else {
                    $this->post = new Post($post[0]['id']);
                }
            } else {
                $this->handleError(404);
            }
        }
    }
}
