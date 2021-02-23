<?php

class PagesController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
    }

    public function update()
    {
        if (isset($this->params['id'], $this->json_params['id_page'], $this->json_params['title'], $this->json_params['description'], $this->json_params['page_name'])) {
            $metadata = Metadata::where($this->connection, 'id_page', intval($this->params['id']))->fetchAll(\PDO::FETCH_ASSOC);
            if (!empty($metadata)) {
                try {
                    Metadata::update($this->connection, ['title', 'description'], [$this->json_params['title'], $this->json_params['description']], 'id_page', intval($this->params['id']));
                    echo json_encode(Page::getDetails($this->connection, $this->json_params['page_name']));
                    die();
                } catch (\Throwable $th) {
                    die(http_response_code(500));
                }
            } else {
                try {
                    Metadata::create($this->connection, ['id_page', 'title', 'description'], [$this->json_params['id_page'], $this->json_params['title'], $this->json_params['description']]);
                    echo json_encode(Page::getDetails($this->connection, $this->json_params['page_name']));
                    die();
                } catch (\Throwable $th) {
                    die(http_response_code(500));
                }
            }
        } else if (isset($this->params['id'], $_FILES['image'], $_POST['page_name'])) {
            try {
                $uploaded_file_path = Uploader::uploadFile('image');
                Page::update($this->connection, ['image_url'], [$uploaded_file_path], 'id', intval($this->params['id']));
                echo json_encode(Page::getDetails($this->connection, $_POST['page_name']));
                die();
            } catch (\Throwable $th) {
                die(http_response_code(500));
            }
        } else {
            $this->handleError(422);
        }
    }

}
