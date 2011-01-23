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

/** @see Zend_Gdata_Feed */
require_once 'Zend/Gdata/Feed.php';

/** @see Webready_Gdata_Maps */
require_once 'Webready/Gdata/Maps.php';

/** @see Webready_Gdata_Maps_FeatureEntry */
require_once 'Webready/Gdata/Maps/FeatureEntry.php';

/**
 * Represents the meta-feed list of maps
 */
class Webready_Gdata_Maps_FeatureFeed extends Zend_Gdata_Feed
{
    
    protected $_entryClassName = 'Webready_Gdata_Maps_FeatureEntry';

    protected $_feedClassName = 'Webready_Gdata_Maps_FeatureFeed';
    
    
    public function __construct ($element = null)
    {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct($element);
    }
    
    
    public function getPostUrl ()
    {
        foreach ($this->_link as $link) {
            if (substr($link->rel, - 5) == '#post') {
                return $link->href;
            }
        }
        return false;
    }
}
