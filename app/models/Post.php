<?php
class Post extends Application
{
    public $id;
    public function __construct($id)
    {
        $this->id = $id;
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
            "previous" => $path . "?start=$previous_start&limit=$limit"
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
        posts.created_at as created_at,
        posts.updated_at as updated_at,
        posts.city as city,
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
        return Request::send($connection, $request_body, [$this->id])->fetchAll(PDO::FETCH_ASSOC)[0];
    }

}
