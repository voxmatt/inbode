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

/** @see Webready_Gdata_App_Extension_Coordinates */
require_once 'Webready/Gdata/App/Extension/Coordinates.php';

/**
 * Represents the kml Point element
 */
class Webready_Gdata_App_Extension_Point extends Zend_Gdata_App_Extension
{

    protected $_rootElement = 'Point';

    protected $_coordinates = null;

    protected $_rootNamespace = null;

    protected $_rootNamespaceURI = null;


    /**
     * Instatntiate a new Webready_Gdata_App_Extension_Point
     *
     * @param Webready_Gdata_App_Extension_Coordinates $coords
     */
    public function __construct( Webready_Gdata_App_Extension_Coordinates $coords = null)
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct();
        $this->setCoordinates( $coords );
    }


    public function getDom( $doc = null, $majorVersion = 1, $minorVersion = null ) {
        $element = parent::getDOM( $doc, $majorVersion, $minorVersion );
        if ( $this->_coordinates != null ) {
            $element->appendChild( $this->_coordinates->getDOM( $element->ownerDocument ) );
        }
        return $element;
    }


    protected function takeChildFromDOM( $child ) {
        $absoluteNodeName = $child->namespaceURI . ':' . $child->localName;
        switch ( $absoluteNodeName ) {
            case $this->lookupNamespace( 'kml' ) . ':' . 'coordinates':
                $coordinates = new Webready_Gdata_App_Extension_Coordinates( );
                $coordinates->transferFromDOM( $child );
                $this->_coordinates = $coordinates;
                break;
            default:
                break;
        }
    }


    /**
     * @return Webready_Gdata_App_Extension_Coordinates
     */
    public function getCoordinates() {
        return $this->_coordinates;
    }


    /**
     * @param Webready_Gdata_App_Extension_Coordinates $value
     * @return Webready_Gdata_App_Extension_Point
     */
    public function setCoordinates( Webready_Gdata_App_Extension_Coordinates $value = null ) {
        $this->_coordinates = $value;
        return $this;
    }
    
    /**
     * Set the corridates object based on an input string
     *
     * @param string $coords in the format lng,lat,alt[space]...
     * @return Webready_Gdata_App_Extension_Point
     */
    public function newCoordinates( $coords ) {
        $this->setCoordinates( new Webready_Gdata_App_Extension_Coordinates( $coords ) );
        return $this;
    }
}
