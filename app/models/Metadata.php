<?php 

class Metadata extends Application
{
    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }
}