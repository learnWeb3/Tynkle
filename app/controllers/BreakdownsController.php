<?php

class BreakdownsController extends ApplicationController
{
    public function index()
    {
        if (isset($this->json_params['id_platform'])) {
            echo json_encode(BreakdownCategory::where($this->connection, 'id_platform', $this->json_params['id_platform'])->fetchAll(PDO::FETCH_ASSOC));
        }
    }
}
