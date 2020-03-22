<?php


namespace AppBundle\Tools;


use GuzzleHttp\Client;
use GuzzleHttp\Psr7\Request;
use Pimcore\Model\DataObject\Data\Geopoint;
use Pimcore\Model\WebsiteSetting;

/**
 * Class GeoLocator
 * @package AppBundle\Tools
 */
class GeoLocator
{
    /** @var string WebsiteSetting|null */
    private $apiKey;

    /**
     * GeoLocator constructor.
     */
    public function __construct()
    {
        $this->apiKey = WebsiteSetting::getByName('MapsKey')->getData();
    }

    /**
     * @param string $address
     * @return Geopoint
     */
    public function convertAddressToGeoLocation(string $address)
    {
        try {
            $client = new Client();
            $request = new Request(
                'GET',
                'https://maps.googleapis.com/maps/api/geocode/json?address=' . $address . '&key=' . $this->apiKey
            );
            $response = $client->send($request);
            $data = json_decode($response->getBody()->read($response->getBody()->getSize()), true);
            $location = $data['results'][0]['geometry']['location'];
            return new Geopoint($location['lng'], $location['lat']);
        } catch (\GuzzleHttp\Exception\GuzzleException $e) {
            return new Geopoint();
        }
    }
}
