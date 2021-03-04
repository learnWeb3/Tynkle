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
            $page_data = Page::getDetails($this->connection, "home#index");
            $this->render(
                'home',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'home',
                    'background_image_path'=>$page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH.'/img/pages/home.jpeg'
                )
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }



    public function contact()
    {
       if( isset($this->json_params['email'],$this->json_params['lastname'],$this->json_params['firstname'], $this->json_params['subject'], $this->json_params['message'] ))
       {

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
                        'user_lastname'=>$this->json_params['lastname'],
                        'user_firstname'=>$this->json_params['firstname'],
                        'user_email'=>$this->json_params['email'],
                        'message_content'=>$this->json_params['message'],
                        'message_subject'=> $this->json_params['subject'],
                    ]
                );

                echo json_encode([
                    "message"=>"Message envoyé avec succès, une copie du message vous à été envoyé. Nous faisons le maximum pour vous répondre dans les plus bref délais"
                ]);
                die();

           } catch (\Throwable $th) {
               die(http_response_code(500));
           }
           
       }else{
            try {
                $page_data = Page::getDetails($this->connection, "home#index");
                $this->render(
                    'contact',
                    array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => 'home',
                        'background_image_path'=>$page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH.'/img/pages/home.jpeg'
                    )
                );
            } catch (\Throwable $th) {
                $this->handleError(500);
            }
       }
    }

    


}