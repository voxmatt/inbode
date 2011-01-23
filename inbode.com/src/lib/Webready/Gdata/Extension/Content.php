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

/** @see Webready_Gdata_Extension_Placemark */
require_once 'Webready/Gdata/Extension/Placemark.php';

/**
 * Represents the Content element
 */
class Webready_Gdata_Extension_Content extends Zend_Gdata_App_Extension
{

    protected $_rootElement = 'content';

    protected $_placemark = null;

    protected $_extensionAttributes = array( 
        array( 
            'name' => 'type', 
            'value' => 'application/vnd.google-earth.kml+xml' 
        ) 
    );


    public function __construct($element = null)
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct($element);
    }

    
    public function getDom( $doc = null, $majorVersion = 1, $minorVersion = null ) {
        $element = parent::getDOM( $doc, $majorVersion, $minorVersion );
        if ( $this->_placemark != null ) {
            $element->appendChild( $this->_placemark->getDOM( $element->ownerDocument ) );
        }
        return $element;
    }

	/**
	 * Parse the incoming FEED.
	 * 
	 * Parse kml for Placemark.
	 *
	 * @param DomNode $child
	 */  
    protected function takeChildFromDOM( $child ) {
        $absoluteNodeName = $child->namespaceURI . ':' . $child->localName;
        switch ( $absoluteNodeName ) {
            case $this->lookupNamespace( 'kml' ) . ':' . 'Placemark':
                $placemark = new Webready_Gdata_Extension_Placemark( );
                $placemark->transferFromDOM( $child );
                $this->_placemark = $placemark;
                break;
            default:
                break;
        }
    }


    /**
     * @return Webready_Gdata_Extension_Placemark
     */
    public function getPlacemark() {
        return $this->_placemark;
    }


    /**
     * @param Webready_Gdata_Extension_Placemark $value
     * @return Webready_Gdata_Extension_Content
     */
    public function setPlacemark( Webready_Gdata_Extension_Placemark $value ) {
        $this->_placemark = $value;
        return $this;
    }

}
