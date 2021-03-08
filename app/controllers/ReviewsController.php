<?php

class ReviewsController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
    }

    public function create()
    {
        if (isset($this->current_user)) {
            // {"id_reviewer":"101","id_reviewed":79,"score":5,"comment":"Hello"}
            if (isset($this->json_params['id_reviewer'], $this->json_params['id_reviewed'], $this->json_params['comment'], $this->json_params['score'])) {
                    try {
                        echo json_encode(
                            Review::create(
                                $this->connection,
                                ['id_reviewer', 'id_reviewed', 'comment', 'score'],
                                [$this->json_params['id_reviewer'], $this->json_params['id_reviewed'], $this->json_params['comment'], $this->json_params['score']]
                            )
                        );
                        die();
                    } catch (Throwable $th) {
                        die(http_response_code(500));
                    }
            } else {
                die(http_response_code(422));
            }
        } else {
            die(http_response_code(403));
        }
    }

}
