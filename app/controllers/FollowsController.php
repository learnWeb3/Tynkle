<?php

class FollowsController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
    }

    public function create()
    {
        if (isset($this->json_params['id_followed'], $this->current_user)) {
            try {
                echo json_encode(
                    Follow::create(
                        $this->connection,
                        ['id_follower', 'id_followed'],
                        [
                            $this->current_user->id,
                            $this->json_params['id_followed'],
                        ]
                    )
                );
            } catch (Throwable $th) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }

    public function destroy()
    {
        if (isset($this->params['id'], $this->current_user)) {
            try {
                $follow = Follow::find($this->connection, $this->params['id'])->fetchAll(PDO::FETCH_ASSOC)[0];
                if ($follow['id_follower'] === $this->current_user->id) {
                   
                        Follow::delete(
                            $this->connection,
                            [],
                            'id',
                            $this->params['id']
                        );

                  
                    die(http_response_code(204));
                }
            } catch (Throwable $th) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }

}
