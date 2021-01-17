<?php


class ApplicationController
{
    protected $connection;
    protected $start;
    protected $limit;
    protected $params;
    protected $asked_method;

    public  function __construct(array $params, string $asked_method)
    {
        $this->connection = Db::connect();
        $this->limit = isset($_GET['limit']) ? intval($_GET['limit']) : 10;
        $this->start = isset($_GET['start']) ? intval($_GET['start']) : 0;
        $this->params = $params;
        $this->asked_method = $asked_method;
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
