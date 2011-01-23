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

/** @see Webready_Gdata_App_Extension_Outline */
require_once 'Webready/Gdata/App/Extension/Outline.php';

/** @see Webready_Gdata_App_Extension_Fill */
require_once 'Webready/Gdata/App/Extension/Fill.php';

/**  @see Webready_Gdata_App_Extension_Color */
require_once 'Webready/Gdata/App/Extension/Color.php';

/**
 * Represents the kml PolyStyle element
 */
class Webready_Gdata_App_Extension_PolyStyle extends Zend_Gdata_App_Extension
{

    protected $_rootElement = 'PolyStyle';

    protected $_color = null;

    protected $_outline = null;

    protected $_fill = null;

    protected $_rootNamespace = null;

    protected $_rootNamespaceURI = null;


    public function __construct(
    Webready_Gdata_App_Extension_Color $Color = null,
    Webready_Gdata_App_Extension_Fill $Fill = null,
    Webready_Gdata_App_Extension_Outline $Outline = null
    )
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct();
        $this->setColor( $Color );
        $this->setFill( $Fill );
        $this->setOutline( $Outline );
    }


    public function getDom( $doc = null, $majorVersion = 1, $minorVersion = null ) {
        $element = parent::getDOM( $doc, $majorVersion, $minorVersion );
        if ( $this->_color != null ) {
            $element->appendChild( $this->_color->getDOM( $element->ownerDocument ) );
        }
        if ( $this->_fill != null ) {
            $element->appendChild( $this->_fill->getDOM( $element->ownerDocument ) );
        }
        if ( $this->_outline != null ) {
            $element->appendChild( $this->_outline->getDOM( $element->ownerDocument ) );
        }
        return $element;
    }


    protected function takeChildFromDOM( $child ) {
        $absoluteNodeName = $child->namespaceURI . ':' . $child->localName;
        switch ( $absoluteNodeName ) {
            case $this->lookupNamespace( 'kml' ) . ':' . 'color':
                $color = new Webready_Gdata_App_Extension_Color( );
                $color->transferFromDOM( $child );
                $this->_color = $color;
                break;
            case $this->lookupNamespace( 'kml' ) . ':' . 'outline':
                $outline = new Webready_Gdata_App_Extension_Outline( );
                $outline->transferFromDOM( $child );
                $this->_outline = $outline;
                break;
            case $this->lookupNamespace( 'kml' ) . ':' . 'fill':
                $fill = new Webready_Gdata_App_Extension_Fill( );
                $fill->transferFromDOM( $child );
                $this->_fill = $fill;
                break;
            default:
                break;
        }
    }


    /**
     * @return Webready_Gdata_App_Extension_Color
     */
    public function getColor() {
        return $this->_color;
    }


    /**
     * @param Webready_Gdata_App_Extension_Color $value
     * @return Webready_Gdata_App_Extension_LineStyle
     */
    public function setColor( Webready_Gdata_App_Extension_Color $value = null ) {
        $this->_color = $value;
        return $this;
    }

    public function newColor( $color = null) {
        $this->setColor( new Webready_Gdata_App_Extension_Color( $color ) );
    }

    /**
     * @return Webready_Gdata_App_Extension_Fill
     */
    public function getFill() {
        return $this->_fill;
    }


    /**
     * @param Webready_Gdata_App_Extension_Fill $value
     * @return Webready_Gdata_App_Extension_LineStyle
     */
    public function setFill( Webready_Gdata_App_Extension_Fill $value = null ) {
        $this->_fill = $value;
        return $this;
    }

    public function newFill( $fill = null) {
        $this->setFill( new Webready_Gdata_App_Extension_Fill( $fill ) );
    }
    
    /**
     * @return Webready_Gdata_App_Extension_Outline
     */
    public function getOutline() {
        return $this->_outline;
    }


    /**
     * @param Webready_Gdata_App_Extension_Outline $value
     * @return Webready_Gdata_App_Extension_LineStyle
     */
    public function setOutline( Webready_Gdata_App_Extension_Outline $value = null ) {
        $this->_outline = $value;
        return $this;
    }
    
    public function newOutline( $outline = null) {
        $this->setOutline( new Webready_Gdata_App_Extension_Outline( $outline ) );
    }

}
