<?php
require_once './app/config/paths.php';
require_once './app/config/routes.php';
require_once './app/config/db_credentials.php';
require 'vendor/autoload.php';
!(isset($_SESSION)) && session_start();
try {
    $router = new AltoRouter();
    $router->addRoutes($routes);
    $match = $router->match();
    isset($match['target']) ?  Router::route($match) : die(Router::handleError(404));
} catch (Throwable $th) {
    die(Router::handleError(500));
}
