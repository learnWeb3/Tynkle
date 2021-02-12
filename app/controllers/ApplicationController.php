<?php

class ApplicationController
{
    protected $connection;
    protected $start;
    protected $limit;
    protected $params;
    protected $asked_method;
    protected $route_name;

    public  function __construct(array $params, string $route_name, string $asked_method)
    {
        $this->connection = Db::connect();
        $this->limit = isset($_GET['limit']) ? intval($_GET['limit']) : 10;
        $this->start = isset($_GET['start']) ? intval($_GET['start']) : 0;
        $this->params = $params;
        $this->route_name = $route_name;
        $this->asked_method = $asked_method;
        $this->json_params = !empty(file_get_contents('php://input')) ?  json_decode(file_get_contents('php://input'), true) : [];
        $this->beforeAll();
    }

    protected function render(
        string $template_name,
        array $template_vars = array(
            'title' => "Tynkle: dépannage informatique entre particuliers",
            'description' => '',
            'style_file_name' => ''
        )
    ) {
        $is_current_user_logged_in = isset($_SESSION['current_user']) ?  true : false;
        $current_user = isset($_SESSION['current_user']) ? $_SESSION['current_user'] : null;
        extract($template_vars);
        ob_start();
        require_once './app/views/' . strtolower(str_replace('Controller', '', get_class($this))) . '/' . $template_name . '.php';
        $current_view = ob_get_clean();
        require_once './app/views/templates/index.php';
    }

    public function handleError($error_code)
    {
        require_once './app/errors/' . $error_code . '.php';
        die(http_response_code($error_code));
    }

    private function beforeAll()
    {
        if (isset($_SESSION['current_user'])) {
            $this->current_user = new User($_SESSION['current_user']);
        }
    }
}
