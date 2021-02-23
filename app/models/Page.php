<?php 

class Page extends Application
{
    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }


    public static function getPagesGroupedByPageGroup(PDO $connection)
    {

        $request_body= 'SELECT * FROM page_group';
        $pages_group = Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
        $request_body = 'SELECT 
        pages.name, 
        pages.id as id_page,
        pages.image_url as image_url,
        metadatas.id as id_metadata,
        metadatas.title as title,
        metadatas.description as description
        FROM pages LEFT JOIN metadatas
        ON pages.id = metadatas.id_page 
        WHERE pages.id_page_group=?';
        $results = [];
        foreach($pages_group as $page_group)
        {
            $page_group['pages'] = Request::send($connection, $request_body, [$page_group['id']])->fetchAll(PDO::FETCH_ASSOC);
            $results[] = $page_group;
        }

        return $results;
    }

    public static function getDetails(PDO $connection, string $page_name)
    {
        $request_body = 'SELECT 
        pages.name, 
        pages.id as id_page,
        pages.image_url as image_url,
        metadatas.id as id_metadata,
        metadatas.title as title,
        metadatas.description as description
        FROM pages LEFT JOIN metadatas
        ON pages.id = metadatas.id_page 
        WHERE pages.name=?';
        return Request::send($connection, $request_body, [$page_name])->fetchAll(PDO::FETCH_ASSOC)[0];
    }
}