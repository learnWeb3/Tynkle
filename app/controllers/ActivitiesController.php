<?php

class ActivitiesController extends ApplicationController
{

    public function __construct(array $params, string $asked_method)
    {
        parent::__construct($params, $asked_method);
    }

    public function index()
    {
        if (isset($this->current_user)) {
            try {
                $posts = Post::where($this->connection, 'id_user', $this->current_user->id)->fetchAll(PDO::FETCH_ASSOC);
                $offers = Offer::where($this->connection, 'id_user', $this->current_user->id)->fetchAll(PDO::FETCH_ASSOC);
                $asks = Ask::where($this->connection, 'id_user', $this->current_user->id)->fetchAll(PDO::FETCH_ASSOC);
                $this->render(
                    'index',
                    array(
                        'title' => 'Tynkle: Mon activité',
                        'description' => 'Tynkle: Voir mes demandes, offres et annonces',
                        'style_file_name' => '',
                        'posts'=>$posts,
                        "offers"=>$offers,
                        "asks"=>$asks
                    ),
                );
            } catch (Throwable $th) {
                var_dump($th);
                $this->handleError(500);
            }
        } else {
            $this->handleError(403);
        }
    }

    public function show()
    {

    }
    public function destroy()
    {
        
    }

}
