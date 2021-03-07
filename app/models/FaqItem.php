<?php

class FaqItem extends Application
{

    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    public static function getAll(PDO $connection)
    {
        $faq_categories = FaqCategory::all($connection, '/faq', 0, 100)['data'];
        return array_map(function($el) use ($connection){
            $faq_items =  self::where($connection, 'id_faq_category', $el['id'])->fetchAll(PDO::FETCH_ASSOC);
            $el['faq_items'] = $faq_items;
            return $el;
        }, $faq_categories);
    }

}