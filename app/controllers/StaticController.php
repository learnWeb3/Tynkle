<?php

class StaticController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
    }

    public function home()
    {
        try {
            $page_data = Page::getDetails($this->connection, "static#home");
            $platforms = Platform::all($this->connection, '/platforms', 0, 100)['data'];
            $breakdowns = BreakdownCategory::where($this->connection, 'id_platform', $platforms[0]['id'])->fetchAll(PDO::FETCH_ASSOC);
            //$posts = Post::getPosts($this->connection, '/posts', 3, 0)['data'];
            $posts = [];
            //$users = User::getTopRated($this->connection);
            $user = [];
            $this->render(
                'home',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'home',
                    'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                    'platforms'=>$platforms,
                    'posts'=>$posts,
                    'users'=>$users,
                    'breakdowns'=>$breakdowns
                )
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }

    public function faq()
    {
        try {
            $page_data = Page::getDetails($this->connection, "static#faq");
            $faq_categories = FaqItem::getAll($this->connection);
            $this->render(
                'faq',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'faq',
                    'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                    'faq_categories'=>$faq_categories
                )
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }


    public function contact()
    {
        if (isset($this->json_params['email'], $this->json_params['lastname'], $this->json_params['firstname'], $this->json_params['subject'], $this->json_params['message'])) {

            try {
                $mailer = new Mailer(
                    $this->json_params['lastname'],
                    'Tynkle contact',
                    'contact@tynkle.com',
                    $this->json_params['email'],
                    $this->json_params['subject'],
                    $this->json_params['message'],
                    __DIR__ . '/../views/templates/mailer/new_contact_mail.php'
                );

                $mailer->send(
                    [
                        'user_lastname' => $this->json_params['lastname'],
                        'user_firstname' => $this->json_params['firstname'],
                        'user_email' => $this->json_params['email'],
                        'message_content' => $this->json_params['message'],
                        'message_subject' => $this->json_params['subject'],
                    ]
                );

                echo json_encode([
                    "message" => "Message envoy?? avec succ??s, une copie du message vous ?? ??t?? envoy??. Nous faisons le maximum pour vous r??pondre dans les plus bref d??lais",
                ]);
                die();

            } catch (\Throwable $th) {
                die(http_response_code(500));
            }

        } else {
            try {
                $page_data = Page::getDetails($this->connection, "static#contact");
                $this->render(
                    'contact',
                    array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => 'home',
                        'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                    )
                );
            } catch (\Throwable $th) {
                $this->handleError(500);
            }
        }
    }

}
