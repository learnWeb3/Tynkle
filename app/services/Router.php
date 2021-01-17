<?php

class Router
{
    public static function route(array $match)
    {
        $router_action = explode('#', $match['target']);
        $controller_name = ucfirst($router_action[0]).'Controller';
        $method_name = $router_action[1];
        $controller = new $controller_name($match['params'], $method_name);
        $controller->$method_name();
    }

    public static function handleError($error_code)
    {
        require_once './app/errors/'.$error_code.'.php';
        die(http_response_code($error_code));
    }
}
