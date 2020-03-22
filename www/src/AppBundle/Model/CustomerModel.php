<?php

namespace AppBundle\Model;

use AppBundle\Tools\GeoLocator;

/**
 * Class CustomerModel
 * @package AppBundle\Model
 */
class CustomerModel
{
    /**
     * @param $data
     * @throws \Exception
     * @todo Validate required fields
     */
    public function register($data)
    {
        $customer = new \Pimcore\Model\DataObject\Customer();
        $customer->setFirstname($data->firstname);
        $customer->setLastname($data->lastname);
        $customer->setStreet($data->street);
        $customer->setZip($data->zip);
        $customer->setCity($data->city);
        $customer->setCountryCode($data->country);
        $customer->setEmail($data->email);
        $customer->setPhone($data->phone);
        $customer->setPassword($data->password);
        $location = (new GeoLocator())->convertAddressToGeoLocation($data->street . ', ' . $data->zip . ' ' . $data->city);
        if (!is_null($location->getLongitude())) {
            $customer->setGeoPoint($location);
        }
        $customer->setParentId(1); //TODO: Add to WebsiteSettings
        $customer->setActive(false);
        $customer->setKey($data->email);
        $customer->save();
    }
}
