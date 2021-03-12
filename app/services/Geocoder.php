<?php

class Geocoder
{
    public function __construct()
    {
        $this->google_maps_api_key = 'AIzaSyCJ5gto1RGuJsDIrD_PV0ByXj_YqpPEsmk';
    }
    public function getCoordinates(): array
    {
        $session = curl_init('https://www.googleapis.com/geolocation/v1/geolocate?key=' . $this->google_maps_api_key);
        $params = [];
        $options = [
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => $params,
            CURLOPT_RETURNTRANSFER => true,
        ];
        curl_setopt_array($session, $options);
        $results = curl_exec($session);
        curl_close($session);
        return json_decode($results, true);
    }

    public function geocode(string $adress): array
    {
        $adress = implode('+', explode(" ", $adress));
        $session = curl_init("https://maps.googleapis.com/maps/api/geocode/json?address=$adress&key=" . $this->google_maps_api_key);
        $params = [];
        $options = [
            CURLOPT_RETURNTRANSFER => true,
        ];
        curl_setopt_array($session, $options);
        $results = curl_exec($session);
        curl_close($session);
        return json_decode($results, true);
    }

    public function reverseGeocode(float $lon, float $lat)
    {
        $session = curl_init("https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lon&key=" . $this->google_maps_api_key);
        $params = [];
        $options = [
            CURLOPT_RETURNTRANSFER => true,
        ];
        curl_setopt_array($session, $options);
        $results = curl_exec($session);
        curl_close($session);
        $results = json_decode($results, true);

        if ($results["results"][0]["address_components"]) {
            $adress_components = [
                'postal_code' => null,
                'route' => null,
                'locality' => null,
            ];
            foreach ($results["results"][0]["address_components"] as $result) {
                if (in_array($result['types'][0], ['postal_code', 'route', 'locality'])) {
                    $adress_components[$result['types'][0]] = $result['long_name'];
                }
            }
            return $adress_components;
        } else {
            throw new Exception("Aucune adresse trouvée pour ces coordonnées");
        }
    }

}
