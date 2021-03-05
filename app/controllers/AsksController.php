<?php

class AsksController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
    }

    public function create()
    {
        if (isset($this->current_user)) {

            if (isset($this->json_params['content'], $this->json_params['object'], $this->json_params['object'], $this->json_params['id_post'], $this->json_params['id_user'])) {

                if (intval($this->current_user->id) === intval($this->json_params['id_user'])) {
                    try {
                        echo json_encode(
                            Ask::create(
                                $this->connection,
                                ['content', 'object', 'amount', 'id_post', 'id_user'],
                                [$this->json_params['content'], $this->json_params['object'], $this->json_params['amount'], $this->json_params['id_post'], $this->current_user->id]
                            )
                        );
                    } catch (Throwable $th) {
                        die(http_response_code(500));
                    }
                } else {
                    die(http_response_code(403));
                }
            } else {
                die(http_response_code(422));
            }
        } else {
            die(http_response_code(403));
        }
    }

}
