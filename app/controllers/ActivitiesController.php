<?php

class ActivitiesController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
    }

    public function index()
    {

        if (isset($this->current_user)) {

            if (isset($_GET['ajax'], $_GET['type'], $this->route_name)) {
                if ($this->route_name === "index_activities_offers") {
                    try {
                        switch ($_GET['type']) {
                            case 'old':
                                $offers = $this->current_user->getOldOffers($this->connection);
                                echo json_encode($offers);
                                die();
                            case 'current':
                                $offers = $this->current_user->getCurrentOffers($this->connection);
                                echo json_encode($offers);
                                die();
                            case 'sent':
                                $offers = $this->current_user->getSentOffers($this->connection);
                                echo json_encode($offers);
                                die();
                            case 'received':
                                $offers = $this->current_user->getReceivedOffers($this->connection);
                                echo json_encode($offers);
                                die();
                            default:
                                $offers = $this->current_user->getOffers($this->connection);
                                echo json_encode($offers);
                                die();
                        }
                    } catch (\Throwable $th) {
                        http_response_code(500);
                        echo json_encode($th);
                        die();
                    }
                } else if ($this->route_name === "index_activities_posts") {
                    try {
                        switch ($_GET['type']) {
                            case 'old':
                                $posts = $this->current_user->getOldPosts($this->connection);
                                echo json_encode($posts);
                                die();
                            case 'current':
                                $posts = $this->current_user->getCurrentPosts($this->connection);
                                echo json_encode($posts);
                                die();
                            default:
                                $posts = $this->current_user->getPosts($this->connection);
                                echo json_encode($posts);
                                die();
                        }
                    } catch (\Throwable $th) {
                        http_response_code(500);
                        echo json_encode($th);
                        die();
                    }
                } else if ($this->route_name === "index_activities_asks") {
                    try {
                        switch ($_GET['type']) {
                            case 'old':
                                $asks = $this->current_user->getOldAsks($this->connection);
                                echo json_encode($asks);
                                die();
                            case 'current':
                                $asks = $this->current_user->getCurrentAsks($this->connection);
                                echo json_encode($asks);
                                die();
                            default:
                                $asks = $this->current_user->getAsks($this->connection);
                                echo json_encode($asks);
                                die();
                        }
                    } catch (\Throwable $th) {
                        http_response_code(500);
                        echo json_encode($th);
                        die();
                    }
                } else {
                    die(http_response_code(403));
                }
            } else {
                try {
                    $posts = $this->current_user->getPosts($this->connection);
                    $offers = $this->current_user->getOffers($this->connection);
                    $asks = $this->current_user->getAsks($this->connection);
                    $this->render(
                        'index',
                        array(
                            'title' => 'Tynkle: Mon activité',
                            'description' => 'Tynkle: Voir mes demandes, offres et annonces',
                            'style_file_name' => '',
                            'posts' => $posts,
                            "offers" => $offers,
                            "asks" => $asks,
                        ),
                    );
                } catch (Throwable $th) {
                    $this->handleError(500);
                }
            }

        } else {
            $this->handleError(403);
        }
    }

    public function show()
    {

    }
    public function destroy()
    {

    }

}
