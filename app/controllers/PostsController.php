<?php

class PostsController extends ApplicationController
{

    public function __construct(array $params, string $asked_method)
    {
        parent::__construct($params, $asked_method);
        $this->beforeAction(['destroy', 'update', 'show']);
    }
    public function create()
    {
        if (isset($this->current_user)) {
            $images = [];
            $cover_image = '';
            Post::create(
                $this->connection,
                ['id_user', 'id_breakdown_category', 'images', 'cover_image', 'title', 'content', 'budget', 'city', 'postal_code'],
                array(
                    $this->current_user['id'],
                    $_POST['id_breakdown_category'],
                    $images,
                    $cover_image,
                    $_POST['title'],
                    $_POST['content'],
                    $_POST['budget'],
                    $_POST['city'],
                    $_POST['postal_code']
                )
            );
        } else {
            $this->handleError(422);
        }
    }

    public function update()
    {
        if (isset($this->current_user)) {
            if ($this->post['id_user'] === $this->current_user['id']) {
                $images = [];
                $cover_image = '';
                Post::update(
                    $this->connection,
                    ['id_user', 'id_breakdown_category', 'images', 'cover_image', 'title', 'content', 'budget', 'city', 'postal_code'],
                    array(
                        $this->current_user['id'],
                        $_POST['id_breakdown_category'],
                        $images,
                        $cover_image,
                        $_POST['title'],
                        $_POST['content'],
                        $_POST['budget'],
                        $_POST['city'],
                        $_POST['postal_code']
                    ),
                    'id',
                    $this->params['id']
                );
            } else {
                $this->handleError(403);
            }
        } else {
            $this->handleError(422);
        }
    }


    public function new()
    {

        $breakdown_categories = BreakdownCategory::all($this->connection, '/categories', 0, 100)['data'];
        $platforms = Platform::all($this->connection, '/platforms', 0, 100)['data'];
        $this->render(
            'new',
            array(
                'title' => 'Tynkle: les annonces',
                'description' => 'Tynkle: Retrouvez les demandes de dépannage',
                'style_file_name' => 'new_post',
                'breakdown_categories' => $breakdown_categories,
                'platforms' => $platforms
            ),
        );
    }

    public function index()
    {
        $posts = Post::getPosts($this->connection, '/posts', $this->limit, $this->start);
        $breakdown_categories = BreakdownCategory::all($this->connection, '/categories', 0, 100)['data'];
        $platforms = Platform::all($this->connection, '/platforms', 0, 100)['data'];
        $this->render(
            'index',
            array(
                'title' => 'Tynkle: les annonces',
                'description' => 'Tynkle: Retrouvez les demandes de dépannage',
                'style_file_name' => '',
                'posts' => $posts['data'],
                'breakdown_categories' => $breakdown_categories,
                'platforms' => $platforms
            ),

        );
    }

    public function show()
    {
        if (isset($this->post)) {
            $post_data = $this->post->getDetails($this->connection);
            $this->render(
                'show',
                array(
                    'title' => "Tynkle: ".$post_data['title'],
                    'description' => 'Tynkle: Retrouvez les demandes de dépannage',
                    'style_file_name' => 'offer',
                    'post' => $post_data,
                )
            );
        } else {
            $this->handleError(422);
        }
    }
    public function destroy()
    {
        if (isset($this->current_user)) {
            if ($this->post['id_user'] === $this->current_user['id']) {
                Post::delete($this->connection, [], 'id', $this->post['id']);
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
                $this->post = new Post($post[0]['id']);
            } else {
                die($this->handleError(404));
            }
        }
    }
}
