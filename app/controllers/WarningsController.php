<?php

class WarningsController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
    }

    public function create()
    {
        if (isset($this->current_user, $this->params['id'], $this->json_params['message'])) {
            if ($this->route_name === 'warning_posts') {
                echo json_encode(PostWarning::create($this->connection, ['message', 'id_post'], [$this->json_params['message'], $this->params['id']]));
                die();
            } else if ($this->route_name === 'warning_users') {
                echo json_encode(UserWarning::create($this->connection, ['message', 'id_user'], [$this->json_params['message'], $this->params['id']]));
                die();
            } else {
                die(http_response_code(422));
            }
        } else {
            $this->handleError(422);
        }
    }

    public function destroy()
    {
        if (isset($this->current_user)) {

        } else {
            $this->handleError(422);
        }
    }

}
