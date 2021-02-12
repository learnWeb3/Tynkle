<?php

class ModelException extends Exception
{

    private $messages;

    public function __construct($messages)
    {
        parent::__construct();
        $this->messages = $messages;
    }
    public function getMessages()
    {
        return $this->messages;
    }
}
