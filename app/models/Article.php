<?php 

class Article extends Application
{
    public $id;
    public function __construct($id)
    {
        $this->id = $id;
    }
}