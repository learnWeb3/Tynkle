<?php

class Offer extends Application
{
    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }


    public function updateRecord(PDO $connection, array $request_parameters)
    {
        $request_parameters = array_merge($request_parameters, [$this->id]);
        $request_body = 'UPDATE offers SET is_accepted=?, is_declined=? WHERE offers.id = ?';
        Request::send($connection, $request_body, $request_parameters);
        $request_body = 'SELECT offers.*, 
        users.email, 
        users.lastname, 
        users.firstname,
        users.avatar,
        users.username, 
        users.id as user_id
        FROM offers 
        JOIN users ON offers.id_user=users.id
        WHERE offers.id = ?';
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC)[0];
    }
}
