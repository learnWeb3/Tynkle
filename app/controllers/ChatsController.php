<?php

class ChatsController extends ApplicationController
{


    public function __construct(array $params, string $asked_method)
    {
        parent::__construct($params, $asked_method);
        $this->beforeAction();
    }

    public function index()
    {
        if (isset($this->current_user)) {
            try {
                $chats = $this->current_user->getChats($this->connection);
                $this->render(
                    'index',
                    array(
                        'title' => 'Tynkle: les annonces',
                        'description' => 'Tynkle: Retrouvez les demandes de dépannage',
                        'style_file_name' => '',
                        'chats' => $chats,
                    ),
                );
            } catch (Exception $error) {
                $this->handleError(500);
            }
        } else {
            $this->handleError(403);
        }
    }

    public function show()
    {
        if (isset($this->chat)) {
            try {
                $messages = $this->chat->getMessages($this->connection);
                $chat = $this->chat->getDetails($this->connection);
                $this->render(
                    'show',
                    array(
                        'title' => 'Tynkle: les annonces',
                        'description' => 'Tynkle: Retrouvez les demandes de dépannage',
                        'style_file_name' => 'chat',
                        'messages' => $messages,
                        'chat'=>$chat
                    ),
                );
            } catch (Throwable $th) {
                var_dump($th);
                //die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }


    public function create()
    {
        if (isset($this->current_user)) {

            if (isset($this->json_params['subscribers'],  $this->json_params['content'])) {
                try {
                    echo json_encode(Chat::sendMessage($this->connection, $this->json_params['content'], $this->json_params['subscribers'], $this->current_user->id));
                } catch (Exception $error) {
                    die(http_response_code(500));
                }
            } else {
                die(http_response_code(403));
            }
        } else {
            die(http_response_code(403));
        }
    }


    public function delete()
    {
        if (isset($this->chat)) {
            try {
                Chat::delete($this->connection, [], 'id', $this->chat['id']);
                die(http_response_code(204));
            } catch (Exception $error) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }


    public function stream()
    {
        if (isset($this->chat)) {
            try {
                $this->chat->streamNewMessages($this->connection);
            } catch (Exception $error) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }

    public function beforeAction()
    {
        if (in_array($this->asked_method, ["show", "delete", "update", "stream"])) {
            $chat = Chat::find($this->connection, $this->params['chat_id'])->fetchAll(PDO::FETCH_ASSOC);
            if (empty($chat)) {
                die(http_response_code(404));
            } else {
                $this->chat = new Chat($chat[0]['id']);
            }
        }
    }
}
