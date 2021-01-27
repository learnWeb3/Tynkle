<?php

class Message extends Application
{
    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }


    public static function getPreviewlastMessage(PDO $connection, int $id_chat)
    {
        $request_body = 'SELECT * FROM messages WHERE id_chat=? ORDER BY messages.created_at DESC LIMIT 1';
        $message =  Request::send($connection, $request_body, [$id_chat])->fetchAll(PDO::FETCH_ASSOC)[0];
        return $message;
    }

}