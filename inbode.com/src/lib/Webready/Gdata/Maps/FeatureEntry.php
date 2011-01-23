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

/** @see Webready_Gdata_Maps */
require_once 'Webready/Gdata/Maps.php';

/** @see Webready_Gdata_Extension/Placemark */
require_once 'Webready/Gdata/Extension/Placemark.php';

/** @see Webready_Gdata_Extension/Content */
require_once 'Webready/Gdata/Extension/Content.php';

/**
 * Data model class for a Google Calendar Event Entry
 */
class Webready_Gdata_Maps_FeatureEntry extends Zend_Gdata_Entry
{

	protected $_mapContent;
	
    protected $_entryClassName = 'Webready_Gdata_Maps_FeatureEntry';


    public function __construct($element = null)
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct($element);
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
     * Get this entry's Content
     *
     * @return Webready_Gdata_Extension_Content
     */
    public function getContent() {
        return $this->_mapContent;
    }


    /**
     * Set this entry's Content
     *
     * @param Webready_Gdata_Extension_Content $value
     * @return Webready_Gdata_FeatureEntry
     */
    public function setContent( $value ) {
        $this->_mapContent = $value;
        return $this;
    }
    
    /**
     * get the feature element id portion of the id URI.
     *
     * @return string
     */
    public function getFeatureElementId()
    {
    	$value = false;
    	$urlPart = strrchr($this->getId(), '/');
    	if( $urlPart ) {
    		$value = trim( $urlPart, '/');
    	}    	
    	return $value;
    }
    
    /**
     * Set new content from a placemark
     *
     * @param Webready_Gdata_Extension_Placemark $Placemark The placemark.
     * @return Webready_Gdata_Maps_FeatureEntry
     */
    public function newContentWithPlacemark( Webready_Gdata_Extension_Placemark $Placemark ) {
        $content = new Webready_Gdata_Extension_Content( );
        $content->setPlacemark($Placemark);
        $this->setContent($content);
        return $this;
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
     * Set a new description from a string
     *
     * @param string $desc
     * @return Webready_Gdata_Maps_FeatureEntry
     */
    public function newDescription( $desc = null ) {
        $this->description = $this->getService()->newDescription( $desc );
        return $this;
    }
}
