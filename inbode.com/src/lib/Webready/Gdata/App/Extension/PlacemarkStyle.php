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

/** @see Webready_Gdata_App_Extension_PolyStyle */
require_once 'Webready/Gdata/App/Extension/PolyStyle.php';

/** @see Webready_Gdata_App_Extension_IconStyle */
require_once 'Webready/Gdata/App/Extension/IconStyle.php';

/** @see Webready_Gdata_App_Extension_LineStyle */
require_once 'Webready/Gdata/App/Extension/LineStyle.php';

/** @see Webready_Gdata_App_Extension_LineString */
require_once 'Webready/Gdata/App/Extension/LineString.php';

/**
 * Represents the kml style element
 */
class Webready_Gdata_App_Extension_PlacemarkStyle extends Zend_Gdata_App_Extension
{

    protected $_rootElement = 'Style';

    protected $_rootNamespace = null;

    protected $_rootNamespaceURI = null;
    
    protected $_iconstyle = null;

    protected $_linestyle = null;

    protected $_polystyle = null;


    public function __construct(
        Webready_Gdata_App_Extension_IconStyle $IconStyle = null,
        Webready_Gdata_App_Extension_LineStyle $LineStyle = null,
        Webready_Gdata_App_Extension_PolyStyle $PolyStyle = null
    )
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct();
        $this->setIconStyle( $IconStyle );
        $this->setPolyStyle( $PolyStyle );
        $this->setLineStyle( $LineStyle );
    }


    public function getDom( $doc = null, $majorVersion = 1, $minorVersion = null ) {
        $element = parent::getDOM( $doc, $majorVersion, $minorVersion );
        if ( $this->_polystyle != null ) {
            $element->appendChild( $this->_polystyle->getDOM( $element->ownerDocument ) );
        }
        if ( $this->_iconstyle != null ) {
            $element->appendChild( $this->_iconstyle->getDOM( $element->ownerDocument ) );
        }
        if ( $this->_linestyle != null ) {
            $element->appendChild( $this->_linestyle->getDOM( $element->ownerDocument ) );
        }
        return $element;
    }


    protected function takeChildFromDOM( $child ) {
        $absoluteNodeName = $child->namespaceURI . ':' . $child->localName;
        switch ( $absoluteNodeName ) {
            case $this->lookupNamespace( 'kml' ) . ':' . 'PolyStyle':
                $polystyle = new Webready_Gdata_App_Extension_PolyStyle( );
                $polystyle->transferFromDOM( $child );
                $this->_polystyle = $polystyle;
                break;
            case $this->lookupNamespace( 'kml' ) . ':' . 'LineStyle':
                $linestyle = new Webready_Gdata_App_Extension_LineStyle( );
                $linestyle->transferFromDOM( $child );
                $this->_linestyle = $linestyle;
                break;
            case $this->lookupNamespace( 'kml' ) . ':' . 'IconStyle':
                $iconstyle = new Webready_Gdata_App_Extension_IconStyle( );
                $iconstyle->transferFromDOM( $child );
                $this->_iconstyle = $iconstyle;
                break;
            default:
                break;
        }
    }


    /**
     * @return Webready_Gdata_App_Extension_PolyStyle
     */
    public function getPolyStyle() {
        return $this->_polystyle;
    }


    /**
     * @param Webready_Gdata_App_Extension_PolyStyle $value
     * @return Webready_Gdata_App_Extension_PlacemarkStyle
     */
    public function setPolyStyle( Webready_Gdata_App_Extension_PolyStyle $value = null ) {
        $this->_polystyle = $value;
        return $this;
    }


    /**
     * @return Webready_Gdata_App_Extension_IconStyle
     */
    public function getIconStyle() {
        return $this->_iconstyle;
    }


    /**
     * @param Webready_Gdata_App_Extension_IconStyle $value
     * @return Webready_Gdata_App_Extension_PlacemarkStyle
     */
    public function setIconStyle( Webready_Gdata_App_Extension_IconStyle $value = null ) {
        $this->_iconstyle = $value;
        return $this;
    }


    /**
     * @return Webready_Gdata_App_Extension_LineStyle
     */
    public function getLineStyle() {
        return $this->_linestyle;
    }


    /**
     * @param Webready_Gdata_App_Extension_LineStyle $value
     * @return Webready_Gdata_App_Extension_PlacemarkStyle
     */
    public function setLineStyle( Webready_Gdata_App_Extension_LineStyle $value = null ) {
        $this->_linestyle = $value;
        return $this;
    }
}
