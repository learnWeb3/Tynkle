<?php

class Request
{
    public static function send(object $connection, string $request_body, array $request_parameters)
    {
        try {
            $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $prepared_statement = $connection->prepare($request_body);
            $prepared_statement->execute($request_parameters);

            return $prepared_statement;
        } catch (\Exception $e) {

            return $e->getMessage();
        }
    }
}
