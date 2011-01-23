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

/** @see Zend_Gdata_Query */
require_once 'Zend/Gdata/Query.php';

/** @see Zend_Gdata_App_Util */
require_once 'Zend/Gdata/App/Util.php';

/** @see Zend_Gdata_Maps_MapEntry */
require_once 'Webready/Gdata/Maps/MapEntry.php';

/**
 * Assists in constructing queries for Google Maps
 *
 * @link http://code.google.com/apis/gdata/maps/
 */
class Webready_Gdata_Maps_MapQuery extends Zend_Gdata_Query
{

    const MAPS_FEED_URI = 'http://maps.google.com/maps/feeds/maps';

    protected $_defaultFeedUri = self::MAPS_FEED_URI;

    protected $_comments = null;

    protected $_user = null;

    protected $_visibility = null;

    protected $_projection = null;

    protected $_mapId = null;


    /**
     * Create Webready_Gdata_Maps_MapQuery object.  If a URL is provided,
     * it becomes the base URL, and additional URL components may be
     * appended.  For instance, if $url is 'http://www.foo.com', the
     * default URL constructed will be 'http://www.foo.com/default/public/full'
     *
     * @param string $url The URL to use as the base path for requests
     */
    public function __construct( $url = null ) {
        parent::__construct( $url );
    }


    /**
     * @param string $value
     * @return Webready_Gdata_Maps_MapQuery Provides a fluent interface
     */
    public function setComments( $value ) {
        $this->_comments = $value;
        return $this;
    }


    /**
     * @param string $value
     * @return Webready_Gdata_Maps_MapQuery Provides a fluent interface
     */
    public function setProjection( $value ) {
        $this->_projection = $value;
        return $this;
    }


    /**
     * @param string $value
     * @return Webready_Gdata_Maps_MapQuery Provides a fluent interface
     */
    public function setUser( $value ) {
        $this->_user = $value;
        return $this;
    }


    /**
     * @param bool $value
     * @return Webready_Gdata_Maps_MapQuery Provides a fluent interface
     */
    public function setVisibility( $value ) {
        $this->_visibility = $value;
        return $this;
    }


    /**
     * @param string $value
     * @return Webready_Gdata_Maps_MapQuery Provides a fluent interface
     */
    public function setMap( Webready_Gdata_Maps_MapEntry $map ) {
       $this->_mapId = $map->getMapElementId();
        return $this;
    }
    
    /**
     * @param string $value
     * @return Webready_Gdata_Maps_FeatureQuery Provides a fluent interface
     */
    public function setMapElementId( $value ) {
		$urlPart = strrchr($value, '/');
    	if( $urlPart ) {
    		$value = trim( $urlPart, '/');
    	}
        $this->_mapId = $value;
        return $this;
    }


    /**
     * @return string comments
     */
    public function getComments() {
        return $this->_comments;
    }


    /**
     * @return string projection
     */
    public function getProjection() {
        return $this->_projection;
    }


    /**
     * @return string user
     */
    public function getUser() {
        return $this->_user;
    }


    /**
     * @return string visibility
     */
    public function getVisibility() {
        return $this->_visibility;
    }


    /**
     * @return string map
     */
    public function getMapElementId() {
        return $this->_mapId;
    }


    /**
     * @param int $value
     * @return Webready_Gdata_Maps_MapQuery Provides a fluent interface
     */
    public function setStartMax( $value ) {
        if ( $value != null ) {
            $this->_params['start-max'] = Zend_Gdata_App_Util::formatTimestamp( $value );
        } else {
            unset( $this->_params['start-max'] );
        }
        return $this;
    }


    /**
     * @param int $value
     * @return Webready_Gdata_Maps_MapQuery Provides a fluent interface
     */
    public function setStartMin( $value ) {
        if ( $value != null ) {
            $this->_params['start-min'] = Zend_Gdata_App_Util::formatTimestamp( $value );
        } else {
            unset( $this->_params['start-min'] );
        }
        return $this;
    }


    /**
     * @param string $value
     * @return Webready_Gdata_Maps_MapQuery Provides a fluent interface
     */
    public function setOrderBy( $value ) {
        if ( $value != null ) {
            $this->_params['orderby'] = $value;
        } else {
            unset( $this->_params['orderby'] );
        }
        return $this;
    }


    /**
     * @return int start-max
     */
    public function getStartMax() {
        if ( array_key_exists( 'start-max', $this->_params ) ) {
            return $this->_params['start-max'];
        } else {
            return null;
        }
    }


    /**
     * @return int start-min
     */
    public function getStartMin() {
        if ( array_key_exists( 'start-min', $this->_params ) ) {
            return $this->_params['start-min'];
        } else {
            return null;
        }
    }


    /**
     * @return string orderby
     */
    public function getOrderBy() {
        if ( array_key_exists( 'orderby', $this->_params ) ) {
            return $this->_params['orderby'];
        } else {
            return null;
        }
    }


    /**
     * @return string sortorder
     */
    public function getSortOrder() {
        if ( array_key_exists( 'sortorder', $this->_params ) ) {
            return $this->_params['sortorder'];
        } else {
            return null;
        }
    }


    /**
     * @return string sortorder
     */
    public function setSortOrder( $value ) {
        if ( $value != null ) {
            $this->_params['sortorder'] = $value;
        } else {
            unset( $this->_params['sortorder'] );
        }
        return $this;
    }


    /**
     * @return string url
     */
    public function getQueryUrl() {
        if ( isset( $this->_url ) ) {
            $uri = $this->_url;
        } else {
            $uri = $this->_defaultFeedUri;
        }
        if ( $this->getUser() != null ) {
            $uri .= '/' . $this->getUser();
        } else {
            $uri .= '/default';
        }
        /*
        if ($this->getVisibility() != null) {
            $uri .= '/' . $this->getVisibility();
        } else {
            $uri .= '/public';
        }
        */
        if ( $this->getProjection() != null ) {
            $uri .= '/' . $this->getProjection();
        } else {
            $uri .= '/full';
        }
        if ( $this->getMapElementId() != null ) {
            $uri .= '/' . $this->getMapElementId();
            if ( $this->getComments() != null ) {
                $uri .= '/comments/' . $this->getComments();
            }
        }
        $uri .= $this->getQueryString();
        return $uri;
    }

}
