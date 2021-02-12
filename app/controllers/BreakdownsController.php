<?php

class BreakdownsController extends ApplicationController
{
    
    public function __construct(array $params,string $route_name, string $asked_method)
    {
        parent::__construct($params,$route_name, $asked_method);
    }

    public function index()
    {
        if (isset($this->json_params['id_platform'])) {
            echo json_encode(BreakdownCategory::where($this->connection, 'id_platform', $this->json_params['id_platform'])->fetchAll(PDO::FETCH_ASSOC));
        }
    }
}
