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

/** @see Zend_Gdata_Entry */
require_once 'Zend/Gdata/Entry.php';

/** @see Webready_Gdata_Extension_Content */
require_once 'Webready/Gdata/Extension/Content.php';

/** @see Webready_Gdata_Maps */
require_once 'Webready/Gdata/Maps.php';

/**
 * Data model class for a Google Calendar Event Entry
 */
class Webready_Gdata_Maps_MapEntry extends Zend_Gdata_Entry
{

	protected $_edited;
	
    protected $_entryClassName = 'Webready_Gdata_Maps_MapEntry';

    protected $_mapContent;
    
    public function __construct($element = null)
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct($element);
    }
    
    /**
     * get the map element id portion of the id URI.
     *
     * @return string
     */
    public function getMapElementId()
    {
    	$value = false;
    	$urlPart = strrchr($this->getId(), '/');
    	if( $urlPart ) {
    		$value = trim( $urlPart, '/');
    	}    	
    	return $value;
    }
    
   public function getDom( $doc = null, $majorVersion = 1, $minorVersion = null ) {
        $element = parent::getDOM( $doc, $majorVersion, $minorVersion );
        if ($this->_mapContent != null) {
            $element->appendChild($this->_mapContent->getDOM($element->ownerDocument));
        }
        return $element;
    }
    
    
	/**
	 * Parse the incoming FEED.
	 * 
	 * Parse atom for content.
	 *
	 * @param DomElement $child
	 */
    protected function takeChildFromDOM( $child ) {
        $absoluteNodeName = $child->namespaceURI . ':' . $child->localName;
        switch ( $absoluteNodeName ) {
            case $this->lookupNamespace( 'atom' ) . ':' . 'content':
            	$content = new Webready_Gdata_Extension_Content( );
                $content->transferFromDOM( $child );
                $this->_mapContent = $content;
                break;
            default:
                parent::takeChildFromDOM( $child );
                break;
        }
    }

    /**
     * Set a new title from a string
     *
     * @param string $title
     * @return Webready_Gdata_Maps_FeatureEntry
     */
    public function newTitle( $title = null ) {
        $this->title = $this->getService()->newTitle( $title );
        return $this;
    }
    
    /**
     * Set a new summary from a string
     *
     * @param string $summary
     * @return Webready_Gdata_Maps_FeatureEntry
     */
    public function newSUmmary( $summary = null ) {
        $this->summary = $this->getService()->newSummary( $summary );
        return $this;
    }
    
}
