<?php

class AdminController extends ApplicationController
{

    public function __construct(array $params, string $route_name, string $asked_method)
    {
        parent::__construct($params, $route_name, $asked_method);
        $this->beforeAction(['platform', 'insights', 'users', 'users_update', 'users_search']);
    }

    public function platform()
    {
        try {
            $page_data = Page::getDetails($this->connection, "admin#platform");
            $pages = Page::getPagesGroupedByPageGroup($this->connection);
            $this->render(
                'platform',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'admin',
                    'navbar_present' => false,
                    'footer_present' => false,
                    'pages' => $pages,
                    'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                )
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }

    public function insights()
    {
        try {
            $page_data = Page::getDetails($this->connection, "admin#insights");
            $client = new Google_Client();
            $client->setAuthConfig('./app/config/tynkle-304613-a33bb0a79914.json');
            $client->addScope(Google_Service_Analytics::ANALYTICS_READONLY);
            $analytics_client = new Analytics($client);
            // GOOGLE ANALYTICS metrics
            // MAIN
            $helper_count = User::where($this->connection, 'is_helper', 1)->rowCount();
            $non_helper_count = User::where($this->connection, 'is_helper', 0)->rowCount();
            $user_number = isset($analytics_client->getRows('users')[0][0]) ? $analytics_client->getRows('users')[0][0] : 'N/A';
            $users_by_country = $analytics_client->getChartDataByDimension('users', ['ga:country']);
            $users_by_device = $analytics_client->getChartDataByDimension('users', ['ga:deviceCategory']);
            $users_by_device = Analytics::formatPie($users_by_device);
            $users_by_country = Analytics::formatPie($users_by_country);
            $avg_session_duration = isset($analytics_client->getRows('avgSessionDuration')[0][0]) ? $analytics_client->getRows('avgSessionDuration')[0][0] : 'N/A';
            $new_users = isset($analytics_client->getRows('newUsers')[0][0]) ? $analytics_client->getRows('newUsers')[0][0] : 'N/A';
            $session_per_user = isset($analytics_client->getRows('sessionsPerUser')[0][0]) ? $analytics_client->getRows('sessionsPerUser')[0][0] : 'N/A';
            // PAGES
            $avg_time_on_page = isset($analytics_client->getRows('avgTimeOnPage')[0][0]) ? $analytics_client->getRows('avgTimeOnPage')[0][0] : 'N/A';
            $page_views_per_session = isset($analytics_client->getRows('pageviewsPerSession')[0][0]) ? $analytics_client->getRows('pageviewsPerSession')[0][0] : 'N/A';
            $bounce_rate = isset($analytics_client->getRows('bounceRate')[0][0]) ? $analytics_client->getRows('bounceRate')[0][0] : 'N/A';
            $bounces = isset($analytics_client->getRows('bounces')[0][0]) ? $analytics_client->getRows('bounces')[0][0] : 'N/A';
            $entrances_by_landing_page_paths = $analytics_client->getChartDataByDimension('entrances', ['ga:landingPagePath']);
            $unique_page_view_by_page_path = $analytics_client->getChartDataByDimension('uniquePageviews', ['ga:pagePath']);
            $exits_by_exit_page_paths = $analytics_client->getChartDataByDimension('exits', ['ga:exitPagePath']);
            $entrances_by_landing_page_paths = Analytics::formatPie($entrances_by_landing_page_paths);
            $exits_by_exit_page_paths = Analytics::formatPie($exits_by_exit_page_paths);
            $unique_page_view_by_page_path = Analytics::formatPie($unique_page_view_by_page_path);
            // INTERNAL ANALYTICS
            $posts_by_breakdowncategories_and_platforms = json_encode(Analytics::getPostNumberByBreakDownCategoryAndPlatform($this->connection));
            // EVOLUTION 30 days
            $user_evolution = $analytics_client->getChartDataByDimension('users', ['ga:Date']);
            $user_evolution = Analytics::formatLine($user_evolution);
            $this->render(
                'insights',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'admin',
                    'navbar_present' => false,
                    'footer_present' => false,
                    'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                    'analytics' => array(
                        'user_number' => $user_number,
                        'users_by_country' => $users_by_country,
                        'users_by_device' => $users_by_device,
                        'avg_time_on_page' => round($avg_time_on_page, 2),
                        'avg_session_duration' => round($avg_session_duration, 2),
                        'page_views_per_session' => round($page_views_per_session, 2),
                        'user_evolution' => $user_evolution,
                        'new_users' => $new_users,
                        'session_per_user' => $session_per_user,
                        'bounce_rate' => round($bounce_rate, 2),
                        'bounces' => $bounces,
                        'entrances_by_landing_page_paths' => $entrances_by_landing_page_paths,
                        'exits_by_exit_page_paths' => $exits_by_exit_page_paths,
                        'unique_page_view_by_page_path' => $unique_page_view_by_page_path,
                        'posts_count' => Post::count($this->connection),
                        'breakdown_categories_count' => BreakdownCategory::count($this->connection),
                        'posts_by_breakdowncategories_and_platforms' => $posts_by_breakdowncategories_and_platforms,
                        'users_by_type' => json_encode(array(
                            [
                                'name' => "helper",
                                'y' => $helper_count,
                            ],
                            [
                                'name' => "demandeur",
                                'y' => $non_helper_count,
                            ],
                        )),
                    ),
                )
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }

    public function users()
    {
        try {
            $page_data = Page::getDetails($this->connection, "admin#users");
            $users = User::all($this->connection, '/admin/users', $this->start, $this->limit);
            $this->render(
                'users',
                array(
                    'title' => $page_data['title'],
                    'description' => $page_data['description'],
                    'style_file_name' => 'admin',
                    'navbar_present' => false,
                    'footer_present' => false,
                    'users' => $users,
                    'background_image_path' => $page_data['image_url'] ? $page_data['image_url'] : ABSOLUTE_ASSET_PATH . '/img/pages/home.jpeg',
                )
            );
        } catch (\Throwable $th) {
            $this->handleError(500);
        }
    }

    public function users_search()
    {
        try {
            if (isset($this->json_params['email'])) {
                $users = User::like($this->connection, 'email', $this->json_params['email'])->fetchAll(PDO::FETCH_ASSOC);
                echo json_encode($users);
                die();
            } else {
                die(http_response_code(422));
            }
        } catch (\Throwable $th) {
            die(http_response_code(500));
        }
    }

    public function users_update()
    {
        try {
            if (isset($this->json_params['is_helper'], $this->params['id'])) {
                echo json_encode(User::update($this->connection, ['is_helper'], [intval($this->json_params['is_helper'])], 'id', $this->params['id']));
                die();
            } else if (isset($this->json_params['is_admin'], $this->params['id'])) {
                echo json_encode(User::update($this->connection, ['is_admin'], [intval($this->json_params['is_admin'])], 'id', $this->params['id']));
                die();
            } else {
                http_response_code(422);
            }
        } catch (\Throwable $th) {
            die(http_response_code(500));
        }
    }

    public function beforeAction(array $targeted_method_names)
    {
        if (in_array($this->asked_method, $targeted_method_names)) {
            if (isset($this->current_user)) {
                try {
                    $user_data = $this->current_user->getDetails($this->connection);
                    if ($user_data['is_admin'] === '0') {
                        $this->handleError(403);
                    }
                } catch (\Throwable $th) {
                    $this->handleError(500);
                }
            } else {
                $this->handleError(403);
            }
        }
    }

}
