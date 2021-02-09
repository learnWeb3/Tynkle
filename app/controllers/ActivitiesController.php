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
                $posts = $this->current_user->getPosts($this->connection);
                $offers = $this->current_user->getOffers($this->connection);
                $asks = $this->current_user->getAsks($this->connection);
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
