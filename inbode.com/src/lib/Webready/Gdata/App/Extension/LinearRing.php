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

/** @see Webready_Gdata_App_Extension_Tessellate */
require_once 'Webready/Gdata/App/Extension/Tessellate.php';

/** @see Webready_Gdata_App_Extension_Coordinates */
require_once 'Webready/Gdata/App/Extension/Coordinates.php';

/**
 * Represents the kml LinearRing element
 */
class Webready_Gdata_App_Extension_LinearRing extends Zend_Gdata_App_Extension
{

    protected $_rootElement = 'LinearRing';

    protected $_tessellate = null;

    protected $_coordinates = null;

    protected $_rootNamespace = null;

    protected $_rootNamespaceURI = null;
    

    public function __construct(
        Webready_Gdata_App_Extension_Coordinates $coords = null, 
        Webready_Gdata_App_Extension_Tessellate $tessellate = null)
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct();
        $this->setCoordinates( $coords );
        $this->setTessellate( $tessellate );
    }


    public function getDom( $doc = null, $majorVersion = 1, $minorVersion = null ) {
        $element = parent::getDOM( $doc, $majorVersion, $minorVersion );
        if ( $this->_tessellate != null ) {
            $element->appendChild( $this->_tessellate->getDOM( $element->ownerDocument ) );
        }
        if ( $this->_coordinates != null ) {
            $element->appendChild( $this->_coordinates->getDOM( $element->ownerDocument ) );
        }
        return $element;
    }


    protected function takeChildFromDOM( $child ) {
        $absoluteNodeName = $child->namespaceURI . ':' . $child->localName;
        switch ( $absoluteNodeName ) {
            case $this->lookupNamespace( 'kml' ) . ':' . 'tessellate':
                $tessellate = new Webready_Gdata_App_Extension_Tessellate( );
                $tessellate->transferFromDOM( $child );
                $this->_tessellate = $tessellate;
                break;
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
     * @return Webready_Gdata_App_Extension_LinearRing
     */
    public function setCoordinates( Webready_Gdata_App_Extension_Coordinates $value = null ) {
        $this->_coordinates = $value;
        return $this;
    }


    /**
     * @return Webready_Gdata_App_Extension_Tessellate
     */
    public function getTessellate() {
        return $this->_tessellate;
    }


    /**
     * @param Webready_Gdata_App_Extension_Tessellate $value
     * @return Webready_Gdata_App_Extension_LinearRing
     */
    public function setTessellate( Webready_Gdata_App_Extension_Tessellate $value = null ) {
        $this->_tessellate = $value;
        return $this;
    }
}
