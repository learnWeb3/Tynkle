<?php

class ChatsController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
        $this->beforeAction(["show", "update", "stream"]);
    }

    public function index()
    {
        if (isset($this->current_user)) {
            try {
                $chats = $this->current_user->getChats($this->connection);
                $page_data = Page::getDetails($this->connection, "chat#index");
                $this->render(
                    'index',
                    array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => '',
                        'chats' => $chats,
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
        if (isset($this->chat)) {
            try {
                $messages = $this->chat->getMessages($this->connection);
                $chat = $this->chat->getDetails($this->connection);
                $page_data = Page::getDetails($this->connection, "chat#show");
                $this->render(
                    'show',
                    array(
                        'title' => $page_data['title'],
                        'description' => $page_data['description'],
                        'style_file_name' => 'chat',
                        'messages' => $messages,
                        'chat' => $chat,
                    ),
                );
            } catch (Throwable $th) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }

    public function create()
    {
        if (isset($this->current_user)) {

            if (isset($this->json_params['subscribers'], $this->json_params['content'])) {
                try {
                    echo json_encode(Chat::sendMessage($this->connection, $this->json_params['content'], $this->json_params['subscribers'], $this->current_user->id));
                } catch (Throwable $th) {
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
        if (isset($this->current_user)) {
            if (isset($this->params['chat_id'])) {
                $chat = Chat::find($this->connection, $this->params['chat_id'])->fetchAll(PDO::FETCH_ASSOC);
                if (!empty($chat) && $chat[0]['id_user'] === $this->current_user->id) {
                    try {
                        Chat::delete($this->connection, [], 'id', $chat[0]['id']);
                        die(http_response_code(204));
                    } catch (Throwable $th) {
                        die(http_response_code(500));
                    }
                } else {
                    die(http_response_code(404));
                }
            } else if (isset($this->params['message_id'])) {
                $message = Message::find($this->connection, $this->params['message_id'])->fetchAll(PDO::FETCH_ASSOC);
                if (!empty($message) && $message[0]['id_user'] === $this->current_user->id) {
                    try {
                        Message::delete($this->connection, [], 'id', $message[0]['id']);
                        die(http_response_code(204));
                    } catch (Throwable $th) {
                        die(http_response_code(500));
                    }
                } else {
                    die(http_response_code(404));
                }
            } else {
                die(http_response_code(422));
            }
        } else {
            die(http_response_code(403));
        }
    }

    public function stream()
    {
        if (isset($this->chat)) {
            try {
                $this->chat->streamNewMessages($this->connection);
            } catch (Throwable $th) {
                die(http_response_code(500));
            }
        } else {
            die(http_response_code(422));
        }
    }

    public function beforeAction(array $targeted_method_names)
    {
        if (in_array($this->asked_method, $targeted_method_names)) {
            $chat = Chat::find($this->connection, $this->params['chat_id'])->fetchAll(PDO::FETCH_ASSOC);
            if (empty($chat)) {
                die(http_response_code(404));
            } else {
                $this->chat = new Chat($chat[0]['id']);
            }
        }
    }
}
