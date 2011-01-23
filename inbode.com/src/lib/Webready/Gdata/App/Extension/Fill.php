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

/**
 * Represents the kml fill element
 */
class Webready_Gdata_App_Extension_Fill extends Zend_Gdata_App_Extension
{

    protected $_rootElement = 'fill';

    protected $_rootNamespace = null;

    protected $_rootNamespaceURI = null;

	/**
	 * instantiate a new Webready_Gdata_App_Extension_Fill object.
	 *
	 * @param boolean $bool True or False
	 */
    public function __construct( $bool = null ) {
        $this->registerAllNamespaces(Webready_Gdata_Maps::$namespaces);
        parent::__construct();
        $this->setText( $bool ? '1' : '0' );
    }
}
