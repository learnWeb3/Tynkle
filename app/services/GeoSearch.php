<?php


class GeoSearch
{
    public static function getNearBy(PDO $connection, string $table, float $latitude, float $longitude, int $distance, int $limit)
    {
        $request_body = "SELECT * FROM (
            SELECT *, 
                (
                    (
                        (
                            acos(
                                sin(( $latitude * pi() / 180))
                                *
                                sin(( $table.lat * pi() / 180)) + 
                                
                                cos(( $latitude * pi() /180 ))
                                *
                                cos(( $table.lat * pi() / 180)) 
                                * 
                                cos((( $longitude - $table.lng) * pi()/180)))
                        ) * 180/pi()
                    ) * 60 * 1.1515 * 1.609344
                )
            as distance FROM $table
        ) myTable
        WHERE distance <= $distance
        LIMIT $limit;";
        return Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getNearBy2(PDO $connection, string $table, float $latitude, float $longitude, int $distance, int $limit, $earth_radius= 6371)
    {
        $request_body = "SELECT * FROM (
            SELECT *, 
                (
                    (
                        (
                            acos(
                                sin(( $latitude * pi() / 180))
                                *
                                sin(( $table.lat * pi() / 180)) + 
                                
                                cos(( $latitude * pi() /180 ))
                                *
                                cos(( $table.lat * pi() / 180)) 
                                * 
                                cos((( $longitude - $table.lng) * pi()/180)))
                        ) * 180/pi()
                    ) / 360 * 2 * pi() * $earth_radius
                )
            as distance FROM $table
        ) myTable
        WHERE distance <= $distance
        LIMIT $limit;";
        return Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
    }
}
