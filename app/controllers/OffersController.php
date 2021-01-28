<?php

class OffersController extends ApplicationController
{

    public function __construct(array $params, string $asked_method)
    {
        parent::__construct($params, $asked_method);
        $this->beforeAction();
    }


    public function index()
    {
        if (isset($_GET['ajax'], $_GET['type'])) {
            if (isset($this->current_user)) {
                if ($_GET['type'] === 'old') {
                    $offers =  $this->current_user->getOldOffers($this->connection);
                } else if ($_GET['type'] === 'current') {
                    $offers = $this->current_user->getCurrentOffers($this->connection);
                } else {
                    $offers =  $this->current_user->getOffers($this->connection);
                }
                echo json_encode($offers);
                die();
            } else {
                die(http_response_code(403));
            }
        } else {
            die(http_response_code(422));
        }
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

            if (isset($this->json_params['content'],  $this->json_params['object'], $this->json_params['object'], $this->json_params['id_post'], $this->json_params['id_user'])) {
                if (intval($this->current_user->id) === intval($this->json_params['id_user'])) {
                    try {

                        $post = Post::find($this->connection, $this->json_params['id_post'])->fetchAll(PDO::FETCH_ASSOC)[0];
                        $new_offer =
                            Offer::create(
                                $this->connection,
                                ['content', 'object', 'amount', 'id_post', 'id_user'],
                                [$this->json_params['content'], $this->json_params['object'], $this->json_params['amount'], $this->json_params['id_post'], $this->current_user->id]
                            )[0];
                        Chat::sendMessage($this->connection, $new_offer['content'], [$this->current_user->id, $post['id_user']], $this->current_user->id);
                        echo json_encode($new_offer);
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


    public function beforeAction()
    {
        if (in_array($this->asked_method, ['update'])) {
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
