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

/** @see Webready_Gdata_App_Extension_PlacemarkIcon */
require_once 'Webready/Gdata/App/Extension/PlacemarkIcon.php';

/**
 * Represents the kml IconStyle element
 */
class Webready_Gdata_App_Extension_IconStyle extends Zend_Gdata_App_Extension
{

    protected $_rootElement = 'IconStyle';

    protected $_icon = null;

    protected $_rootNamespace = null;

    protected $_rootNamespaceURI = null;


    public function __construct( Webready_Gdata_App_Extension_PlacemarkIcon $icon = null )
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct();
        $this->setIcon( $icon );
    }


    public function getDom( $doc = null, $majorVersion = 1, $minorVersion = null ) {
        $element = parent::getDOM( $doc, $majorVersion, $minorVersion );
        if ( $this->_icon != null ) {
            $element->appendChild( $this->_icon->getDOM( $element->ownerDocument ) );
        }
        return $element;
    }


    protected function takeChildFromDOM( $child ) {
        $absoluteNodeName = $child->namespaceURI . ':' . $child->localName;
        switch ( $absoluteNodeName ) {
            case $this->lookupNamespace( 'kml' ) . ':' . 'Icon':
                $icon = new Webready_Gdata_App_Extension_PlacemarkIcon( );
                $icon->transferFromDOM( $child );
                $this->_icon = $icon;
                break;
            default:
                break;
        }
    }


    /**
     * @return Webready_Gdata_App_Extension_PlacemarkIcon
     */
    public function getIcon() {
        return $this->_icon;
    }


    /**
     * @param Webready_Gdata_App_Extension_PlacemarkIcon $value
     * @return Webready_Gdata_App_Extension_IconStyle
     */
    public function setIcon( Webready_Gdata_App_Extension_PlacemarkIcon $value = null ) {
        $this->_icon = $value;
        return $this;
    }

    /**
     * Set a new icon object with and href value from a string.
     *
     * @param string $href
     * @return Webready_Gdata_App_Extension_IconStyle
     */
    public function newIconWithHrefValue( $href = null ) {
        $icon = new Webready_Gdata_App_Extension_PlacemarkIcon();
        $icon->newHref( $href );
        $this->setIcon( $icon );
        return $this;   
    }
}
