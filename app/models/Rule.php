<?php 
class Rule extends Application
{
    public $id;
    public function __construct($id)
    {
        $this->id = $id;
    }

    public function getDetails(PDO $connection)
    {
        $request_body = 'SELECT * FROM rules WHERE id=?';
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC)[0];
    }
}