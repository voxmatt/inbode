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

/** @see Webready_Gdata_App_Extension_IconHref */
require_once 'Webready/Gdata/App/Extension/IconHref.php';

/**
 * Represents the kml Icon element
 */
class Webready_Gdata_App_Extension_PlacemarkIcon extends Zend_Gdata_App_Extension
{

    protected $_rootElement = 'Icon';

    protected $_href = null;

    protected $_rootNamespace = null;

    protected $_rootNamespaceURI = null;


    public function __construct(Webready_Gdata_App_Extension_IconHref $href = null)
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct();
        $this->setHref( $href );
    }


    public function getDom( $doc = null, $majorVersion = 1, $minorVersion = null ) {
        $element = parent::getDOM( $doc, $majorVersion, $minorVersion );
        if ( $this->_href != null ) {
            $element->appendChild( $this->_href->getDOM( $element->ownerDocument ) );
        }
        return $element;
    }


    protected function takeChildFromDOM( $child ) {
        $absoluteNodeName = $child->namespaceURI . ':' . $child->localName;
        switch ( $absoluteNodeName ) {
            case $this->lookupNamespace( 'kml' ) . ':' . 'href':
                $href = new Webready_Gdata_App_Extension_IconHref( );
                $href->transferFromDOM( $child );
                $this->_href = $href;
                break;
            default:
                break;
        }
    }


    /**
     * @return Webready_Gdata_App_Extension_IconHref
     */
    public function getHref() {
        return $this->_href;
    }


    /**
     * @param Webready_Gdata_App_Extension_IconHref $value
     * @return Webready_Gdata_App_Extension_PlacemarkIcon
     */
    public function setHref( Webready_Gdata_App_Extension_IconHref $value = null ) {
        $this->_href = $value;
        return $this;
    }
    
    /**
     * Set a new href objec from a string.
     *
     * @param string $href
     * @return Webready_Gdata_App_Extension_PlacemarkIcon
     */
    public function newHref( $href = null )
    {
         $h = new Webready_Gdata_App_Extension_IconHref();
         $h->setText( $href );
         $this->setHref( $h );
         return $this;
    }

}
