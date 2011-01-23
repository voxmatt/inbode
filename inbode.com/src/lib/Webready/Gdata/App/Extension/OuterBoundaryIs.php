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

/** @see Webready_Gdata_App_Extension_LinearRing */
require_once 'Webready/Gdata/App/Extension/LinearRing.php';

/**
 * Represents the kml OuterBoundaryIs element
 */
class Webready_Gdata_App_Extension_OuterBoundaryIs extends Zend_Gdata_App_Extension
{

    protected $_rootElement = 'OuterBoundaryIs';

    protected $_linearRing = null;

    protected $_rootNamespace = null;

    protected $_rootNamespaceURI = null;


    public function __construct( Webready_Gdata_App_Extension_LinearRing $linearRing = null )
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct();
        $this->setLinearRing( $linearRing );
    }


    public function getDom( $doc = null, $majorVersion = 1, $minorVersion = null ) {
        $element = parent::getDOM( $doc, $majorVersion, $minorVersion );
        if ( $this->_linearRing != null ) {
            $element->appendChild( $this->_linearRing->getDOM( $element->ownerDocument ) );
        }
        return $element;
    }


    protected function takeChildFromDOM( $child ) {
        $absoluteNodeName = $child->namespaceURI . ':' . $child->localName;
        switch ( $absoluteNodeName ) {
            case $this->lookupNamespace( 'kml' ) . ':' . 'LinearRing':
                $linearRing = new Webready_Gdata_App_Extension_LinearRing( );
                $linearRing->transferFromDOM( $child );
                $this->_linearRing = $linearRing;
                break;
            default:
                break;
        }
    }


    /**
     * @return Webready_Gdata_App_Extension_LinearRing
     */
    public function getLinearRing() {
        return $this->_linearRing;
    }


    /**
     * @param Webready_Gdata_App_Extension_LinearRing $value
     * @return Webready_Gdata_App_Extension_OuterBoundaryIs
     */
    public function setLinearRing( Webready_Gdata_App_Extension_LinearRing $value = null ) {
        $this->_linearRing = $value;
        return $this;
    }

}
