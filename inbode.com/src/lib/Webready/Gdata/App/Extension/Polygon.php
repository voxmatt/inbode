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

/**
 * @see Zend_Gdata_App_Extension
 */
require_once 'Webready/Gdata/Maps.php';
require_once 'Zend/Gdata/App/Extension.php';

/**
 * @see Webready_Gdata_App_Extension_OuterBoundaryIs
 */
require_once 'Webready/Gdata/App/Extension/OuterBoundaryIs.php';

/**
 * Represents the kml Polygon element
 */
class Webready_Gdata_App_Extension_Polygon extends Zend_Gdata_App_Extension
{

    protected $_rootElement = 'Polygon';

    protected $_outerBoundaryIs = null;

    protected $_rootNamespace = null;

    protected $_rootNamespaceURI = null;


    public function __construct( Webready_Gdata_App_Extension_OuterBoundaryIs $OuterBoundaryIs = null )
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct();
        $this->setOuterBoundaryIs( $OuterBoundaryIs );
    }


    public function getDom( $doc = null, $majorVersion = 1, $minorVersion = null ) {
        $element = parent::getDOM( $doc, $majorVersion, $minorVersion );
        if ( $this->_outerBoundaryIs != null ) {
            $element->appendChild( $this->_outerBoundaryIs->getDOM( $element->ownerDocument ) );
        }
        return $element;
    }


    protected function takeChildFromDOM( $child ) {
        $absoluteNodeName = $child->namespaceURI . ':' . $child->localName;
        switch ( $absoluteNodeName ) {
            case $this->lookupNamespace( 'kml' ) . ':' . 'outerBoundaryIs':
                $outerBoundaryIs = new Webready_Gdata_App_Extension_OuterBoundaryIs( );
                $outerBoundaryIs->transferFromDOM( $child );
                $this->_outerBoundaryIs = $outerBoundaryIs;
                break;
            default:
                break;
        }
    }


    /**
     * @return Webready_Gdata_App_Extension_OuterBoundaryIs
     */
    public function getOuterBoundaryIs() {
        return $this->_outerBoundaryIs;
    }


    /**
     * @param Webready_Gdata_App_Extension_OuterBoundaryIs $value
     * @return Webready_Gdata_App_Extension_LineStyle
     */
    public function setOuterBoundaryIs( Webready_Gdata_App_Extension_OuterBoundaryIs $value = null ) {
        $this->_outerBoundaryIs = $value;
        return $this;
    }
    
}
