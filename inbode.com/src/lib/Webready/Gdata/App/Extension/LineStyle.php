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

/** @see Webready_Gdata_App_Extension_Width */
require_once 'Webready/Gdata/App/Extension/Width.php';

/** @see Webready_Gdata_App_Extension_Color */
require_once 'Webready/Gdata/App/Extension/Color.php';

/**
 * Represents the kml LineStyle element
 */
class Webready_Gdata_App_Extension_LineStyle extends Zend_Gdata_App_Extension
{

    protected $_rootElement = 'LineStyle';

    protected $_color = null;

    protected $_width = null;

    protected $_rootNamespace = null;

    protected $_rootNamespaceURI = null;


    public function __construct(
        Webready_Gdata_App_Extension_Color $color = null,
        Webready_Gdata_App_Extension_Width $width = null
    )
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct();
        $this->setColor( $color );
        $this->setWidth( $width );
    }


    public function getDom( $doc = null, $majorVersion = 1, $minorVersion = null ) {
        $element = parent::getDOM( $doc, $majorVersion, $minorVersion );
        if ( $this->_color != null ) {
            $element->appendChild( $this->_color->getDOM( $element->ownerDocument ) );
        }
        if ( $this->_width != null ) {
            $element->appendChild( $this->_width->getDOM( $element->ownerDocument ) );
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
            case $this->lookupNamespace( 'kml' ) . ':' . 'width':
                $width = new Webready_Gdata_App_Extension_Width( );
                $width->transferFromDOM( $child );
                $this->_width = $width;
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


    /**
     * @return Webready_Gdata_App_Extension_Width
     */
    public function getWidth() {
        return $this->_width;
    }


    /**
     * @param Webready_Gdata_App_Extension_Width $value
     * @return Webready_Gdata_App_Extension_LineStyle
     */
    public function setWidth( Webready_Gdata_App_Extension_Width $value = null ) {
        $this->_width = $value;
        return $this;
    }

}
