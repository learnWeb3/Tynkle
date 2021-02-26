<?php

class WarningsController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
        $this->beforeAction(['index', 'destroy']);
    }


    public function index()
    {
        try {
            $page_data = Page::getDetails($this->connection, "warnings#index");
            $posts = Post::getSignaledPosts($this->connection);
            $users = User::getSignaledUsers($this->connection);
            $this->render(
                'index',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'admin',
                    'navbar_present' => false,
                    'footer_present' => false,
                    'posts' => $posts,
                    'users'=>$users,
                    'background_image_path'=>$page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH.'/img/pages/home.jpeg'
                )
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }
    public function create()
    {
        if (isset($this->current_user, $this->params['id'], $this->json_params['message'])) {
          try {
            if ($this->route_name === 'warning_posts') {
                echo json_encode(PostWarning::create($this->connection, ['message', 'id_post'], [$this->json_params['message'], $this->params['id']]));
                die();
            } else if ($this->route_name === 'warning_users') {
                echo json_encode(UserWarning::create($this->connection, ['message', 'id_user'], [$this->json_params['message'], $this->params['id']]));
                die();
            } else {
                die(http_response_code(422));
            }
          } catch (\Throwable $th) {
              die(http_response_code(500));
          }
        } else {
            $this->handleError(422);
        }
    }

    public function destroy()
    {
        if (isset($this->current_user, $this->params['id'])) {
            try {
                if ($this->route_name === 'warning_posts_destroy') {
                    PostWarning::delete($this->connection, [], 'id', $this->params['id']);
                    die(http_response_code(204));
                } else if ($this->route_name === 'warning_users_destroy') {
                    UserWarning::delete($this->connection,[], 'id', $this->params['id']);
                    die(http_response_code(204));
                } else {
                    die(http_response_code(422));
                }
              } catch (\Throwable $th) {
                  die(http_response_code(500));
              }
        } else {
            $this->handleError(422);
        }
    }


    public function beforeAction(array $targeted_method_names)
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

}
