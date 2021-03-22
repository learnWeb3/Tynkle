<?php

class Db
{
    public static function connect()
    {
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_CASE => PDO::CASE_NATURAL,
            // PDO::ATTR_STRINGIFY_FETCHES => false,
            // PDO::ATTR_EMULATE_PREPARES=>false,
        ];
        $dsn = "mysql:dbname=" . DB_NAME . ";host=" . DB_HOST . ";charset=" . DB_CHARSET;
        try {
            return new \PDO($dsn, DB_USERNAME, DB_PASSWORD, $options);
        } catch (\Exception $e) {
            die($e);
        }
    }
}
