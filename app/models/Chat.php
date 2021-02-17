<?php

class Chat extends Application
{

    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    public function getDetails(PDO $connection)
    {
        $request_body = "SELECT
        chats.id,
        chats.created_at,
        (SELECT COUNT(chat_users.id_user) FROM chat_users WHERE chat_users.id_chat=chats.id ) as subscriber_count,
        (SELECT GROUP_CONCAT(chat_users.id_user) FROM chat_users WHERE chat_users.id_chat=chats.id ) as subscriber_ids,
        (SELECT COUNT(messages.id) as message_count FROM messages WHERE messages.id_chat = chats.id) as message_count
        FROM chats
        JOIN chat_users ON chats.id=chat_users.id_chat
        WHERE chats.id = ?";

        $request = Request::send($connection, $request_body, [$this->id]);
        $results = [];
        while ($row = $request->fetch()) {
            $results[] = array(
                "id" => $row["id"],
                "created_at" => $row["created_at"],
                "subscriber_count" => $row["subscriber_count"],
                "message_count" => $row["message_count"],
                "subscriber_ids" => !empty($row["subscriber_ids"]) ? $row["subscriber_ids"] : [],
                "subscribers" => Chat::getSubscriberData($connection, $row["subscriber_ids"])
            );
        }
        return $results[0];
    }

    public function getMessages(PDO $connection)
    {
        $request_body = "SELECT
        messages.id as message_id,
        messages.id_chat as message_id_chat,
        messages.content as message_content,
        messages.ressource_link as message_ressource_link,
        messages.created_at as message_created_at,
        messages.updated_at as message_updated_at,users.id as user_id,
        users.firstname as user_firstname,users.lastname as user_lastname,
        users.email as user_email,
        users.avatar as user_avatar
        FROM messages
        JOIN users ON messages.id_user = users.id
        WHERE messages.id_chat = ?
        ORDER BY messages.created_at";
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getSubscriberData(PDO $connection, string $subscriber_ids)
    {
        $subscriber_ids = explode(',', $subscriber_ids);

        $prepared_query_parameters = array_map(function ($subscriber_id) {
            return '?';
        }, $subscriber_ids);

        $subscriber_ids = array_map(function ($subscriber_id) {
            return intval($subscriber_id);
        }, $subscriber_ids);

        $prepared_query_parameters = implode(',', $prepared_query_parameters);

        $request_body = "SELECT
        -- USERS
        users.id as user_id ,
        users.firstname as user_firstname,
        users.lastname as user_lastname,
        users.username as user_username,
        users.email as user_email,
        users.avatar as user_avatar
        FROM users WHERE users.id IN ($prepared_query_parameters)";
        return Request::send($connection, $request_body, $subscriber_ids)->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getSubscriberThirdParty(PDO $connection, string $subscriber_ids, int $current_user_id)
    {
        $subscriber_ids = explode(',', $subscriber_ids);

        $subscribers = [];
        array_map(function ($subscriber_id) use ($current_user_id) {
            if (intval($subscriber_id) !== intval($current_user_id)) {
                $subscribers[] = intval($subscriber_id);
            }
        }, $subscriber_ids);

        $subscribers = empty($subscribers) ? $subscriber_ids : $subscribers;
        
        $prepared_query_parameters = implode(',', array_map(function ($subscriber_id) {
            return '?';
        }, $subscriber_ids));

        $request_body = "SELECT
        -- USERS
        users.id as user_id ,
        users.firstname as user_firstname,
        users.lastname as user_lastname,
        users.username as user_username,
        users.email as user_email,
        users.avatar as user_avatar
        FROM users WHERE users.id IN ($prepared_query_parameters)";
        return Request::send($connection, $request_body, $subscribers)->fetchAll(PDO::FETCH_ASSOC)[0];
    }

    public static function getExistingChat(PDO $connection, array $subscribers)
    {
        $request_body = "SELECT
        id,
        subscriber_ids
        FROM
        (SELECT DISTINCT(chats.id),
        (SELECT DISTINCT(GROUP_CONCAT(chat_users.id_user)) FROM chat_users WHERE chat_users.id_chat=chats.id GROUP BY chat_users.id_chat) as subscriber_ids
        FROM chats
        INNER JOIN chat_users ON chats.id=chat_users.id_chat) t1
        WHERE subscriber_ids=?";
        $request = Request::send($connection, $request_body, [implode(",", $subscribers)]);
        $results = [];
        while ($row = $request->fetch()) {
            $results[] = array(
                "id" => $row['id'],
                "subscriber_ids" => $row["subscriber_ids"],
                "subscribers" => Chat::getSubscriberData($connection, $row["subscriber_ids"]),
            );
        }
        return $results;
    }

    public static function sendMessage(PDO $connection, string $content, array $subscriber_ids, int $current_user_id, $ressource_link = null)
    {
        $existing_chat = self::getExistingChat($connection, $subscriber_ids);
        if (empty($existing_chat)) {
            Chat::create($connection, [], []);
            $last_created_chat = Chat::lastCreatedRow($connection)->fetchAll(PDO::FETCH_ASSOC);
            array_map(function ($subscriber_id) use ($connection, $last_created_chat) {
                ChatUser::create($connection, ["id_user", "id_chat"], [$subscriber_id, $last_created_chat[0]['id']]);
            }, $subscriber_ids);
            $existing_chat = $last_created_chat;
        }
        Message::create($connection, ['id_user', 'id_chat', 'content', 'ressource_link'], [$current_user_id, $existing_chat[0]['id'], $content, $ressource_link]);
        $request_body = "SELECT
        messages.id as message_id,
        messages.id_chat as message_id_chat,
        messages.content as message_content,
        messages.ressource_link as message_ressource_link,
        messages.created_at as message_created_at,
        messages.updated_at as message_updated_at,users.id as user_id,
        users.firstname as user_firstname,users.lastname as user_lastname,
        users.email as user_email,
        users.avatar as user_avatar
        FROM messages
        JOIN users ON messages.id_user = users.id
        ORDER BY messages.created_at DESC LIMIT 1";
        return Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC)[0];
    }

    public function getNewMessages(PDO $connection, string $timestamp)
    {
        $request_body = "SELECT *,
        messages.id as id_message
        FROM messages
        JOIN chats ON messages.id_chat=chats.id
        JOIN users ON messages.id_user = users.id
        WHERE messages.created_at >= ? AND chats.id=?
        OR messages.updated_at >= ? AND chats.id=?";
        return Request::send($connection, $request_body, ["$timestamp", $this->id, "$timestamp", $this->id])->fetchAll(PDO::FETCH_ASSOC);
    }

    public function streamNewMessages(PDO $connection)
    {
        $timestamp = strftime('%F %H:%M:%S', time());
        header('Content-type: text/event-stream');
        header('Cache-control: no-cache');
        header('Connection: Keep-Alive');
        session_write_close();
        while (true) {

            $json_data = json_encode($this->getNewMessages($connection, $timestamp));
            echo 'data: ' . $json_data;
            echo "\n\n";
            flush();
            ob_flush();
            ob_end_flush();
            if (!empty($json_data)) {
                $timestamp = strftime('%F %H:%M:%S', time());
            }
            sleep(1);
        }
    }
}
