<?php

class AsksController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
    }

    public function create()
    {
        if (isset($this->current_user)) {

            if (isset($this->json_params['content'], $this->json_params['object'], $this->json_params['object'], $this->json_params['id_post'], $this->json_params['id_user'])) {

                if (intval($this->current_user->id) === intval($this->json_params['id_user'])) {
                    try {
                        echo json_encode(
                            Ask::create(
                                $this->connection,
                                ['content', 'object', 'amount', 'id_post', 'id_user'],
                                [$this->json_params['content'], $this->json_params['object'], $this->json_params['amount'], $this->json_params['id_post'], $this->current_user->id]
                            )
                        );
                    } catch (Throwable $th) {
                        die(http_response_code(500));
                    }
                } else {
                    die(http_response_code(403));
                }
            } else {
                die(http_response_code(422));
            }
        } else {
            die(http_response_code(403));
        }
    }

    function new () {
        try {
            $platforms = Platform::all($this->connection, '/platforms', 0, 100)['data'];
            $breakdowns = BreakdownCategory::all($this->connection, '/brteakdowns', 0, 100)['data'];
            $page_data = Page::getDetails($this->connection, "asks#new");
            $this->render(
                'new',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'asks',
                    'navbar_present' => false,
                    'footer_present' => false,
                    'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                    'platforms' => $platforms,
                    'json_platforms'=>json_encode($platforms),
                    'json_breakdowns'=>json_encode($breakdowns)
                )
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }

}
