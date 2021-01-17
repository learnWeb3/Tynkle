<?php

class ActivitiesController extends ApplicationController
{

    public function __construct(array $params, string $asked_method)
    {
        parent::__construct($params, $asked_method);
        $this->isUserLoggedIn(['destroy', 'update']);
    }
    public function create()
    {

    }

    public function update()
    {

    }

    public function index()
    {

    }

    public function show()
    {

    }
    public function destroy()
    {
        
    }

}
