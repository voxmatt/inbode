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

/** @see Zend_Gdata_App_Extension */
require_once 'Zend/Gdata/App/Extension.php';

/** @see Webready_Gdata_Maps */
require_once 'Webready/Gdata/Maps.php';

/** @see Webready_Gdata_App_Extension_PlacemarkDescription */
require_once 'Webready/Gdata/App/Extension/PlacemarkDescription.php';

/** @see Webready_Gdata_App_Extension_Point */
require_once 'Webready/Gdata/App/Extension/Point.php';

/** @see Webready_Gdata_App_Extension_LineString */
require_once 'Webready/Gdata/App/Extension/LineString.php';

/** @see Webready_Gdata_App_Extension_PlacemarkStyle */
require_once 'Webready/Gdata/App/Extension/PlacemarkStyle.php';

/** @see Webready_Gdata_App_Extension_PlacemarkName */
require_once 'Webready/Gdata/App/Extension/PlacemarkName.php';

/** @see Webready_Gdata_App_Extension_Polygon */
require_once 'Webready/Gdata/App/Extension/Polygon.php';

/**
 * Base class for people (currently used by atom:author, atom:contributor)
 */
class Webready_Gdata_Extension_Placemark extends Zend_Gdata_App_Extension
{

    protected $_rootElement = 'Placemark';

    protected $_rootNamespace = 'kml';

    protected $_rootNamespaceURI = null;

    protected $_name = null;

    protected $_polygon = null;

    protected $_linestring = null;

    protected $_description = null;

    protected $_style = null;

    protected $_point = null;

    public function __construct($element = null)
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct($element);
    }

    public function getDom( $doc = null, $majorVersion = 1, $minorVersion = null ) {
        $element = parent::getDOM( $doc, $majorVersion, $minorVersion );
        if ( $this->_polygon != null ) {
            $element->appendChild( $this->_polygon->getDOM( $element->ownerDocument ) );
        }
        if ( $this->_linestring != null ) {
            $element->appendChild( $this->_linestring->getDOM( $element->ownerDocument ) );
        }
        if ( $this->_point != null ) {
            $element->appendChild( $this->_point->getDOM( $element->ownerDocument ) );
        }
        if ( $this->_style != null ) {
            $element->appendChild( $this->_style->getDOM( $element->ownerDocument ) );
        }
        if ( $this->_description != null ) {
            $element->appendChild( $this->_description->getDOM( $element->ownerDocument ) );
        }
        if ( $this->_name != null ) {
            $element->appendChild( $this->_name->getDOM( $element->ownerDocument ) );
        }
        return $element;
    }

	/**
	 * Parse the incoming FEED.
	 * 
	 * Parse kml for Polygon, LineString, Point, Style, description and name
	 *
	 * @param DOMNode $child
	 */
    protected function takeChildFromDOM( $child ) {
        $absoluteNodeName = $child->namespaceURI . ':' . $child->localName;
        switch ( $absoluteNodeName ) {
            case $this->lookupNamespace( 'kml' ) . ':' . 'Polygon':
                $polygon = new Webready_Gdata_App_Extension_Polygon( );
                $polygon->transferFromDOM( $child );
                $this->_polygon = $polygon;
                break;
            case $this->lookupNamespace( 'kml' ) . ':' . 'LineString':
                $linestring = new Webready_Gdata_App_Extension_LineString( );
                $linestring->transferFromDOM( $child );
                $this->_linestring = $linestring;
                break;
            case $this->lookupNamespace( 'kml' ) . ':' . 'Point':
                $point = new Webready_Gdata_App_Extension_Point( );
                $point->transferFromDOM( $child );
                $this->_point = $point;
                break;
            case $this->lookupNamespace( 'kml' ) . ':' . 'Style':
                $style = new Webready_Gdata_App_Extension_PlacemarkStyle( );
                $style->transferFromDOM( $child );
                $this->_style = $style;
                break;
            case $this->lookupNamespace( 'kml' ) . ':' . 'description':
                $description = new Webready_Gdata_App_Extension_PlacemarkDescription( );
                if ( $child->hasChildNodes() ) {
                    $description->setText( $child->firstChild->nodeValue ); // CDATA section
                }
                $this->_description = $description;
                break;
            case $this->lookupNamespace( 'kml' ) . ':' . 'name':
                $name = new Webready_Gdata_App_Extension_PlacemarkName( );
                $name->transferFromDOM( $child );
                $this->_name = $name;
                break;
            default:
                parent::takeChildFromDOM( $child );
                break;
        }
    }


    /**
     * @return Webready_Gdata_App_Extension_PlacemarkName
     */
    public function getName() {
        return $this->_name;
    }


    /**
     * @param Webready_Gdata_App_Extension_PlacemarkName $value
     * @return Webready_Gdata_Extension_Placemark Provides a fluent interface
     */
    public function setName( Webready_Gdata_App_Extension_PlacemarkName $value ) {
        $this->_name = $value;
        return $this;
    }


    /**
     * @return Webready_Gdata_App_Extension_PlacemarkDescription
     */
    public function getDescription() {
        return $this->_description;
    }


    /**
     * @param Webready_Gdata_App_Extension_PlacemarkDescription $value
     * @return Webready_Gdata_Extension_Placemark Provides a fluent interface
     */
    public function setDescription( Webready_Gdata_App_Extension_PlacemarkDescription $value ) {
        $this->_description = $value;
        return $this;
    }


    /**
     * @return Webready_Gdata_App_Extension_PlacemarkStyle
     */
    public function getStyle() {
        return $this->_style;
    }


    /**
     * @param Webready_Gdata_App_Extension_PlacemarkStyle $value
     * @return Webready_Gdata_Extension_Placemark Provides a fluent interface
     */
    public function setStyle( Webready_Gdata_App_Extension_PlacemarkStyle $value ) {
        $this->_style = $value;
        return $this;
    }


    /**
     * @return Webready_Gdata_App_Extension_Point
     */
    public function getPoint() {
        return $this->_point;
    }


    /**
     * @param Webready_Gdata_App_Extension_Point $value
     * @return Webready_Gdata_Extension_Placemark Provides a fluent interface
     */
    public function setPoint( Webready_Gdata_App_Extension_Point $value ) {
        $this->_point = $value;
        return $this;
    }


    /**
     * @return Webready_Gdata_App_Extension_LineString
     */
    public function getLineString() {
        return $this->_linestring;
    }


    /**
     * @param Webready_Gdata_App_Extension_LineString $value
     * @return Webready_Gdata_Extension_Placemark Provides a fluent interface
     */
    public function setLineString( Webready_Gdata_App_Extension_LineString $value ) {
        $this->_linestring = $value;
        return $this;
    }


    /**
     * @return Webready_Gdata_App_Extension_Polygon
     */
    public function getPolygon() {
        return $this->_polygon;
    }


    /**
     * @param Webready_Gdata_App_Extension_Polygon $value
     * @return Webready_Gdata_Extension_Placemark Provides a fluent interface
     */
    public function setPolygon( Webready_Gdata_App_Extension_Polygon $value ) {
        $this->_polygon = $value;
        return $this;
    }


    /**
     * @param string $value
     * @return Webready_Gdata_Extension_Placemark
     */
    public function newName( $value ) {
        $this->_name = new Webready_Gdata_App_Extension_PlacemarkName(  );
        $this->_name->setText($value);
        return $this;
    }


    /**
     * @param string $value
     * @return Webready_Gdata_App_Extension_PlacemarkDescription
     */
    public function newDescription( $value ) {
        $this->_description = new Webready_Gdata_App_Extension_PlacemarkDescription( );
        $this->_description->setText($value);
        return $this;
    }

    /**
     * @param string $value
     * @return Webready_Gdata_App_Extension_PlacemarkDescription
     */
    public function newPointWithCoordinates( $value ) {
        $point = new Webready_Gdata_App_Extension_Point( );
        $point->newCoordinates( $value );
        $this->setPoint( $point );
        return $this;
    }

}
