<?php
class Post extends Application
{
    public $id;
    public function __construct($id)
    {
        $this->id = $id;
    }

    public static function getPostsGeojson(PDO $connection)
    {

        $request_body = "SELECT
        posts.id,
        posts.title,
        posts.cover_image,
        posts.lat,
        posts.lng,
        posts.city,
        posts.postal_code,
        posts.created_at,
        users.id as user_id,
        users.username as username,
        breakdown_categories.id as breakdown_category_id,
        breakdown_categories.name as breakdown_category_name,
        platforms.name as platform_name,
        platforms.id as platform_id
        FROM posts
        JOIN breakdown_categories ON posts.id_breakdown_category = breakdown_categories.id
        JOIN platforms ON breakdown_categories.id_platform = platforms.id
        JOIN users ON users.id = posts.id_user
        ORDER BY posts.created_at DESC";
        $posts_coordinates = Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
        $post_coordinates = array_map(function ($post_coordinate) {
            return [
                "type" => "Feature",
                "geometry" => [
                    "type" => "Point", 
                    "coordinates" => [$post_coordinate['lng'], $post_coordinate['lat']]
                ],
                "properties" => [
                    "id" => $post_coordinate['id'],
                    "title" => $post_coordinate['title'],
                    "cover_image" => $post_coordinate['cover_image'],
                    'user_id'=>$post_coordinate['user_id'],
                    'username'=>$post_coordinate['username'],
                    'created_at'=>$post_coordinate['created_at'],
                    'breakdown_category_name'=>$post_coordinate['breakdown_category_name'],
                    'platform_name'=>$post_coordinate['platform_name'],
                    'city'=>$post_coordinate['city'],
                    'postal_code'=>$post_coordinate['postal_code']
                ],
            ];
        }, $posts_coordinates);
        return [
            "type" => "FeatureCollection",
            "features" => $post_coordinates,
        ];

    }

    public static function getSignaledPosts(PDO $connection)
    {
        $request_body = "SELECT
        posts.*,
        post_warnings.message,
        post_warnings.id as post_warning_id,
        post_warnings.created_at as post_warning_created_at,
        post_warnings.updated_at as post_warning_updated_at,
        users.id as user_id,
        users.username as username,
        breakdown_categories.id as breakdown_category_id,
        breakdown_categories.name as breakdown_category_name,
        platforms.name as platform_name,
        platforms.id as platform_id
        FROM posts
        JOIN breakdown_categories ON posts.id_breakdown_category = breakdown_categories.id
        JOIN platforms ON breakdown_categories.id_platform = platforms.id
        JOIN users ON users.id = posts.id_user
        JOIN post_warnings ON post_warnings.id_post = posts.id
        ORDER BY posts.created_at DESC";
        return Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function findBy(PDO $connection, string $path, string $column_name, string $values, $searched_table = "posts", int $start = 0, int $limit = 10)
    {
        $request_body = "SELECT
        posts.*,
        users.id as user_id,
        users.username as username,
        breakdown_categories.id as breakdown_category_id,
        breakdown_categories.name as breakdown_category_name,
        platforms.name as platform_name,
        platforms.id as platform_id
        FROM posts
        JOIN breakdown_categories ON posts.id_breakdown_category = breakdown_categories.id
        JOIN platforms ON breakdown_categories.id_platform = platforms.id
        JOIN users ON users.id = posts.id_user
        WHERE $searched_table.$column_name IN ($values)
        ORDER BY posts.created_at DESC";
        $results = Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
        $next_start = $start += 10;
        $previous_start = $start - 10 >= 0 ? $start - 10 : 0;
        return array(
            "data" => $results,
            "next" => $path . "?start=$next_start&limit=$limit",
            "previous" => $path . "?start=$previous_start&limit=$limit",
        );
    }

    public static function getPosts(PDO $connection, string $path, int $limit, int $start)
    {
        $request_body = "SELECT
        posts.id as id,
        posts.title as title,
        posts.content as content,
        posts.cover_image as cover_image,
        posts.images as images,
        posts.budget as budget,
        posts.created_at as created_at,
        posts.updated_at as updated_at,
        posts.city as city,
        posts.lat as lat,
        posts.lng as lon,
        posts.postal_code as postal_code,
        breakdown_categories.id as breakdown_category_id,
        breakdown_categories.name as breakdown_category_name,
        breakdown_categories.description as breakdown_category_description,
        platforms.id as platform_id,
        platforms.name as platform_name,
        platforms.description as platform_description,
        users.id as user_id,
        users.username as username
        FROM posts
        JOIN users ON posts.id_user = users.id
        JOIN breakdown_categories ON posts.id_breakdown_category = breakdown_categories.id
        JOIN platforms ON breakdown_categories.id_platform=platforms.id
        WHERE posts.is_solved = 0
        ORDER BY posts.created_at DESC
        LIMIT $limit OFFSET $start";
        $results = Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
        $next_start = $start += 10;
        $previous_start = $start - 10 >= 0 ? $start - 10 : 0;
        return array(
            "data" => $results,
            "next" => $path . "?start=$next_start&limit=$limit",
            "previous" => $path . "?start=$previous_start&limit=$limit",
        );
    }

    public function getDetails(PDO $connection)
    {
        $request_body = "SELECT
        posts.id as id,
        posts.title as title,
        posts.content as content,
        posts.cover_image as cover_image,
        posts.images as images,
        posts.budget as budget,
        posts.is_solved as is_solved,
        posts.created_at as created_at,
        posts.updated_at as updated_at,
        posts.city as city,
        posts.lat as lat,
        posts.lng as lon,
        posts.postal_code as postal_code,
        breakdown_categories.id as breakdown_category_id,
        breakdown_categories.name as breakdown_category_name,
        breakdown_categories.description as breakdown_category_description,
        platforms.id as platform_id,
        platforms.name as platform_name,
        platforms.description as platform_description,
        users.id as user_id,
        users.username as username
        FROM posts
        JOIN users ON posts.id_user = users.id
        JOIN breakdown_categories ON posts.id_breakdown_category = breakdown_categories.id
        JOIN platforms ON breakdown_categories.id_platform=platforms.id
        WHERE posts.id=?";
        $post_data = Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC)[0];
        $post_data['images'] = json_decode($post_data['images'], true);
        return $post_data;
    }

    public function getSimilarPosts(PDO $connection, string $path, int $limit, int $start, int $breakdown_category_id)
    {
        $request_body = "SELECT
        posts.id as id,
        posts.title as title,
        posts.content as content,
        posts.cover_image as cover_image,
        posts.images as images,
        posts.budget as budget,
        posts.created_at as created_at,
        posts.updated_at as updated_at,
        posts.city as city,
        posts.lat as lat,
        posts.lng as lon,
        posts.postal_code as postal_code,
        breakdown_categories.id as breakdown_category_id,
        breakdown_categories.name as breakdown_category_name,
        breakdown_categories.description as breakdown_category_description,
        platforms.id as platform_id,
        platforms.name as platform_name,
        platforms.description as platform_description,
        users.id as user_id,
        users.username as username
        FROM posts
        JOIN users ON posts.id_user = users.id
        JOIN breakdown_categories ON posts.id_breakdown_category = breakdown_categories.id
        JOIN platforms ON breakdown_categories.id_platform=platforms.id
        WHERE posts.is_solved = 0
        AND breakdown_categories.id = ?
        ORDER BY posts.created_at DESC
        LIMIT $limit OFFSET $start";
        $results = Request::send($connection, $request_body, [$breakdown_category_id])->fetchAll(PDO::FETCH_ASSOC);
        $next_start = $start += 10;
        $previous_start = $start - 10 >= 0 ? $start - 10 : 0;
        return array(
            "data" => $results,
            "next" => $path . "?start=$next_start&limit=$limit",
            "previous" => $path . "?start=$previous_start&limit=$limit",
        );
    }

    public static function getNearBy(PDO $connection, float $latitude, float $longitude, int $distance, string $breakdown_categories_ids = null, int $limit = 100, $earth_radius = 6371)
    {

        if ($breakdown_categories_ids) {
            $request_body = "SELECT * FROM (
                SELECT
                posts.id as id,
                posts.title as title,
                posts.content as content,
                posts.cover_image as cover_image,
                posts.images as images,
                posts.budget as budget,
                posts.created_at as created_at,
                posts.updated_at as updated_at,
                posts.city as city,
                posts.lat as lat,
                posts.lng as lon,
                posts.postal_code as postal_code,
                breakdown_categories.id as breakdown_category_id,
                breakdown_categories.name as breakdown_category_name,
                breakdown_categories.description as breakdown_category_description,
                platforms.id as platform_id,
                platforms.name as platform_name,
                platforms.description as platform_description,
                users.id as user_id,
                users.username as username,
                    (
                        (
                            (
                                acos(
                                    sin(( $latitude * pi() / 180))
                                    *
                                    sin(( posts.lat * pi() / 180)) +

                                    cos(( $latitude * pi() /180 ))
                                    *
                                    cos(( posts.lat * pi() / 180))
                                    *
                                    cos((( $longitude - posts.lng) * pi()/180)))
                            ) * 180/pi()
                        ) / 360 * 2 * pi() * $earth_radius
                    )
                as distance FROM posts
                JOIN users ON posts.id_user = users.id
                JOIN breakdown_categories ON posts.id_breakdown_category = breakdown_categories.id
                JOIN platforms ON breakdown_categories.id_platform=platforms.id
            ) myTable
            WHERE distance <= $distance
            AND breakdown_category_id IN ($breakdown_categories_ids)
            LIMIT $limit;";
        } else {
            $request_body = "SELECT * FROM (
                SELECT
                posts.id as id,
                posts.title as title,
                posts.content as content,
                posts.cover_image as cover_image,
                posts.images as images,
                posts.budget as budget,
                posts.created_at as created_at,
                posts.updated_at as updated_at,
                posts.city as city,
                posts.lat as lat,
                posts.lng as lon,
                posts.postal_code as postal_code,
                breakdown_categories.id as breakdown_category_id,
                breakdown_categories.name as breakdown_category_name,
                breakdown_categories.description as breakdown_category_description,
                platforms.id as platform_id,
                platforms.name as platform_name,
                platforms.description as platform_description,
                users.id as user_id,
                users.username as username,
                    (
                        (
                            (
                                acos(
                                    sin(( $latitude * pi() / 180))
                                    *
                                    sin(( posts.lat * pi() / 180)) +

                                    cos(( $latitude * pi() /180 ))
                                    *
                                    cos(( posts.lat * pi() / 180))
                                    *
                                    cos((( $longitude - posts.lng) * pi()/180)))
                            ) * 180/pi()
                        ) / 360 * 2 * pi() * $earth_radius
                    )
                as distance FROM posts
                JOIN users ON posts.id_user = users.id
                JOIN breakdown_categories ON posts.id_breakdown_category = breakdown_categories.id
                JOIN platforms ON breakdown_categories.id_platform=platforms.id
            ) myTable
            WHERE distance <= $distance
            LIMIT $limit;";
        }
        return Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
    }

}
