<?php

class Analytics
{

    private $client;
    private $profileId;
    private $propertyId;

    public function __construct(Google_client $client)
    {
        $this->client = new Google_Service_Analytics($client);
        $this->profileId = $this->getProfileId();
    }

    public static function formatPie(array $data)
    {

        return json_encode(array_map(function ($el) {
            return array(
                'name' => $el[0],
                'y' => intval($el[1]),
            );
        }, $data));

    }

    public static function formatLine(array $data){
        $keys = array_map(function ($el) {
            return $el[0];
        }, $data);

        $values = array_map(function ($el) {
            return intval($el[1]);
        }, $data);

        return json_encode(array(
            'name'=>"nombre d'utilisateur",
            'data'=>array('values'=>$values, 'keys'=>$keys)
        ));
    }
    public function getRows(string $metric, string $number_of_day_in_the_past = '30')
    {
        return $this->client->data_ga->get(
            'ga:' . $this->profileId, // Précise le profil Google Analytics à utiliser
            $number_of_day_in_the_past . 'daysAgo', // Précise la date de début
            'today', // Précise la date de fin
            'ga:' . $metric // Précise le métrique utilisé (session, users...)
        )->getRows();
    }

    public function getChartDataByDimension(string $metric, array $dimensions, string $number_of_day_in_the_past = '30')
    {
        return $this->client->data_ga->get(
            'ga:' . $this->profileId,
            $number_of_day_in_the_past . 'daysAgo',
            'today',
            'ga:' . $metric,
            array(
                'dimensions' => implode(',', $dimensions),
            )
        )->getRows();
    }

    private function getProfileId()
    {
        // Get the user's first view (profile) ID.

        // Get the list of accounts for the authorized user.
        $accounts = $this->client->management_accounts->listManagementAccounts();

        if (count($accounts->getItems()) > 0) {
            $items = $accounts->getItems();
            $firstAccountId = $items[0]->getId();

            // Get the list of properties for the authorized user.
            $properties = $this->client->management_webproperties
                ->listManagementWebproperties($firstAccountId);

            if (count($properties->getItems()) > 0) {
                $items = $properties->getItems();
                $firstPropertyId = $items[0]->getId();

                $this->propertyId = $firstPropertyId;

                // Get the list of views (profiles) for the authorized user.
                $profiles = $this->client->management_profiles
                    ->listManagementProfiles($firstAccountId, $firstPropertyId);
                if (count($profiles->getItems()) > 0) {
                    $items = $profiles->getItems();
                    // Return the first view (profile) ID.
                    return $items[0]->getId();

                } else {
                    throw new Exception('No views (profiles) found for this user.');
                }
            } else {
                throw new Exception('No properties found for this user.');
            }
        } else {
            throw new Exception('No accounts found for this user.');
        }

    }

    public static function getPostNumberByBreakDownCategoryAndPlatform(PDO $connection)
    {
        $request_body = 'SELECT platforms.id as id, platforms.name as name FROM platforms';
        $platforms = Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
        $request_body = 'SELECT breakdown_categories.id_platform as parent, breakdown_categories.name as name, COUNT(posts.id) as value FROM posts 
        JOIN breakdown_categories ON posts.id_breakdown_category = breakdown_categories.id 
        GROUP BY breakdown_categories.id';
        $posts_by_categories = Request::send($connection, $request_body, [])->fetchAll(PDO::FETCH_ASSOC);
        $posts_by_categories = array_map(function($el){
            $el['value'] = intval($el['value']);
            return $el;
        }, $posts_by_categories);
        $platforms = array_map(function($el){
            $el['parent'] = '0';
            return $el;
        }, $platforms);
        return array_merge($platforms, $posts_by_categories, [array(
            'id'=> '0',
            'parent'=> '',
            'name'=> 'TYNKLE'
        )]);
    }


}
