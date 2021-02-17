<?php

class OffersController extends ApplicationController
{
    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
        $this->beforeAction(['update']);
    }

    public function index()
    {

    }

    public function update()
    {
        if (isset($this->offer)) {
            try {
                $is_accepted = isset($this->json_params['is_accepted']) ? 1 : 0;
                $is_declined = isset($this->json_params['is_declined']) ? 1 : 0;
                echo json_encode($this->offer->updateRecord($this->connection, [$is_accepted, $is_declined]));
            } catch (\Throwable $th) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }

    public function create()
    {
        if (isset($this->current_user)) {

            if (isset($this->json_params['content'], $this->json_params['object'], $this->json_params['object'], $this->json_params['id_post'], $this->json_params['id_user'])) {
                if (intval($this->current_user->id) === intval($this->json_params['id_user'])) {
                    try {

                        $post = Post::find($this->connection, $this->json_params['id_post'])->fetchAll(PDO::FETCH_ASSOC)[0];
                        $new_offer =
                        Offer::create(
                            $this->connection,
                            ['content', 'object', 'amount', 'id_post', 'id_user'],
                            [$this->json_params['content'], $this->json_params['object'], $this->json_params['amount'], $this->json_params['id_post'], $this->current_user->id],
                            $this->json_params,
                            [
                                'content'=>'required',
                                'object'=>'required',
                                'amount'=>'required',
                                'id_post'=>'required'
                            ]
                        )[0];
                        $message_content = "Vous avez reçu une nouvelle offre";
                        Chat::sendMessage($this->connection, $message_content, [$this->current_user->id, $post['id_user']], $this->current_user->id, "/activities");
                        echo json_encode($new_offer);
                    } catch (Throwable $th) {
                        $th->getMessage();
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

    public function beforeAction(array $targeted_method_names)
    {
        if (in_array($this->asked_method, $targeted_method_names)) {
            if (isset($this->current_user, $this->params['id'])) {
                $offer = Offer::find($this->connection, $this->params['id'])->fetchAll(PDO::FETCH_ASSOC);
                if (empty($offer)) {
                    die(http_response_code(404));
                } else {
                    if ($offer[0]['id_user'] !== $this->current_user->id) {
                        die(http_response_code(403));
                    } else {
                        $this->offer = new Offer($offer[0]['id']);
                    }
                }
            } else {
                http_response_code(422);
            }
        }
    }
}
