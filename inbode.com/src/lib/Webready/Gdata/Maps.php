<?php
/** 
 * Connector Engagement System (CES)
 * 
 * LICENSE
 *
 * This source file is subject to the new BSD license that is bundled
 * with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://wecreate.com/ces/license/new-bsd
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@wecreate.com so we can send you a copy immediately.
 *
 * @category   CES
 * @package    Webready_Gdata
 * @subpackage Maps
 * @author     Jeffrey Sambells <jsambells@wecreate.com>
 * @author     Victor Sumner <vsumner@wecreate.com>
 * @copyright  1999-2009 We-Create Inc. (http://wecreate.com) 
 * @license    http://wecreate.com/ces/license/new-bsd New BSD License 
 * @version    SVN: $Id:$ 
 * @link       http://wecreate.com/ces/Webready_Gdata
 * @since      2.0.0
 */

/** @see Zend_Gdata */
require_once 'Zend/Gdata.php';

/** @see Zend_Http_Client */
require_once 'Zend/Http/Client.php';

/** @see Webready_Gdata_Maps_MapFeed */
require_once 'Webready/Gdata/Maps/MapFeed.php';

/** @see Webready_Gdata_Maps_MapEntry */
require_once 'Webready/Gdata/Maps/MapEntry.php';

/** @see Webready_Gdata_Maps_FeatureEntry */
require_once 'Webready/Gdata/Maps/FeatureEntry.php';

/** @see Webready_Gdata_Maps_FeatureFeed */
require_once 'Webready/Gdata/Maps/FeatureFeed.php';
     
          
class Webready_Gdata_Maps extends Zend_Gdata
{

	protected $_majorProtocolVersion = 1;
	
    const MAPS_FEED_URI = 'http://maps.google.com/maps/feeds/maps';

    const MAPS_MAPS_FEED_URI = 'http://maps.google.com/maps/feeds/maps/default/full';

    const AUTH_SERVICE_NAME = 'local';
    
    protected $_defaultPostUri = self::MAPS_MAPS_FEED_URI;

    public static $namespaces = array( 
        //array('kml', 'http://earth.google.com/kml/2.2', 1, 0),
        array('kml', 'http://www.opengis.net/kml/2.2', 1, 0),
        array('gd', 'http://schemas.google.com/g/2005', 1, 0),
        array('maps', 'http://schemas.google.com/maps/2008', 1, 0),
        array('app', 'http://www.w3.org/2007/app', 1, 0),
    );


    /**
     * Create Gdata_Calendar object
     *
     * @param Zend_Http_Client $client (optional) The HTTP client to use when
     *          when communicating with the Google servers.
     * @param string $applicationId The identity of the app in the form of Company-AppName-Version
     */
    public function __construct( $client = null, $applicationId = 'MyCompany-MyApp-1.0' ) {
        $this->registerPackage( 'Webready_Gdata_Maps' );
        $this->registerPackage( 'Webready_Gdata_Maps_Extension' );
        parent::__construct( $client, $applicationId );
        $this->_httpClient->setHeaders('GData-Version', '2');
        $this->_httpClient->setParameterPost( 'service', self::AUTH_SERVICE_NAME );
    }


    /**
     * Retreive entry object
     *
     * @return Webready_Gdata_Maps_FeatureEntry
     */
    public function getMapsFeatureEntry( $uri = null ) {
        if ( $uri == null ) {
            require_once 'Zend/Gdata/App/InvalidArgumentException.php';
            throw new Zend_Gdata_App_InvalidArgumentException( 'Location must not be null' );
        }
        return parent::getEntry( $uri, 'Webready_Gdata_Maps_FeatureEntry' );
    }


    /**
     * Retreive entry object
     *
     * @return Webready_Gdata_Maps_MapEntry
     */
    public function getMapsMapEntry( $uri = null ) {
        if ( $uri == null ) {
            require_once 'Zend/Gdata/App/InvalidArgumentException.php';
            throw new Zend_Gdata_App_InvalidArgumentException( 'Location must not be null' );
        }
        return parent::getEntry( $uri, 'Webready_Gdata_Maps_MapEntry' );
    }


    /**
     * Retrieve the list of features.
     * 
     * @param string $uri The feed URI.
     * 
     * @return Webready_Gdata_Maps_FeatureFeed
     */
    public function getMapsFeatureFeed( $uri = null ) {
        if ( $uri == null ) {
            require_once 'Zend/Gdata/App/InvalidArgumentException.php';
            throw new Zend_Gdata_App_InvalidArgumentException( 'Location must not be null' );
        }
		return parent::getFeed( $uri, 'Webready_Gdata_Maps_FeatureFeed' );
    }


    /**
     * Retrieve the list of maps.
     * 
     * @param string $uri The feed URI.
     * 
     * @return Webready_Gdata_Maps_MapFeed
     */
    public function getMapsMapFeed( $uri = null ) {
        if ( $uri == null ) {
            $uri = self::MAPS_MAPS_FEED_URI;
        }
        return parent::getFeed( $uri, 'Webready_Gdata_Maps_MapFeed' );
    }


    /**
     * @param Webready_Gdata_Maps_MapEntry $map
     * @param string $uri
     * 
     * @return Webready_Gdata_Maps_MapEntry
     */
    public function insertMap( Webready_Gdata_Maps_MapEntry $map, $uri = null ) {
        if ( $uri == null ) {
            $uri = $this->_defaultPostUri;
        }
        $newMap = $this->insertEntry( $map, $uri, 'Webready_Gdata_Maps_MapEntry' );
        return $newMap;
    }


    /**
     * @param Webready_Gdata_Maps_FeatureEntry $feature
     * @param string $uri
     * 
     * @return Webready_Gdata_Maps_FeatureEntry
     */
    public function insertMapFeature( Webready_Gdata_Maps_FeatureEntry $feature, $uri = null ) {
        if ( $uri == null ) {
            $uri = $this->_defaultPostUri;
        }
        $newMap = $this->insertEntry( $feature, $uri, 'Webready_Gdata_Maps_FeatureEntry' );
        return $newMap;
    }
    
    /**
     * Get a new Webready_Gdata_Maps_FeatureEntry
     * 
     * This method is here to allow code completion.
     *
     * @return Webready_Gdata_Maps_FeatureEntry
     */
    public function newFeatureEntry() {
        $args = func_get_args();
        return $this->__call(__FUNCTION__, $args);
    }
    
    /**
     * Get a new Webready_Gdata_Maps_MapEntry
     * 
     * This method is here to allow code completion.
     *
     * @return Webready_Gdata_Maps_MapEntry
     */
    public function newMapEntry() {
        $args = func_get_args();
        return $this->__call(__FUNCTION__, $args);
    }
    
}