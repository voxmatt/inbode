<?php

// misc
$db_prefix = '';
$update_free_access = FALSE;
// php settings
ini_set('arg_separator.output',     '&amp;');
ini_set('magic_quotes_runtime',     0);
ini_set('magic_quotes_sybase',      0);
ini_set('session.cache_expire',     200000);
ini_set('session.cache_limiter',    'none');
ini_set('session.cookie_lifetime',  2000000);
ini_set('session.gc_maxlifetime',   200000);
ini_set('session.save_handler',     'user');
ini_set('session.use_only_cookies', 1);
ini_set('session.use_trans_sid',    0);
ini_set('url_rewriter.tags',        '');
ini_set('memory_limit', '128M');
ini_set('error_reporting', E_ALL);


// set variables depending on environment
// this is not perfect, but it works
if (file_exists("/usr/www/users/stegic/git")) {

	// staging
	$db_url = 'mysqli://stegic_22:kp9DncwZ@db137c.pair.com/stegic_inbode';
	$base_url = 'http://inbode.ten7i.net';  // NO trailing slash!
	$cookie_domain = 'inbode.ten7i.net';
	
	// inbode variables
	// system path, depends on environment
	$conf['i_syspath'] = '/usr/www/users/stegic/git/inbode/inbode.com/src';	

	// URI to Image server
	$conf['i_imgsrv'] = 'http://inbode.ten7i.net/';
	
	// Inbode Application Name
	$conf['i_appname'] = 'Inbode Beta';

	// fusion tables specific
	// google account username
	$conf['i_GAuser'] = 'maps@inbode.com';
	// google account password	
	$conf['i_GApass'] = 'w1r3dmag';
	// fusion table datasrc id
	$conf['i_InbodeBeta-BuildingsUnits'] = '417990';

	
} else if (file_exists("/usr/www/users/inbode")) {

	// production
	$db_url = 'mysqli://inbode:MuN6bHMC@db139c.pair.com/inbode_drupal';
	$base_url = 'http://inbode.com';  // NO trailing slash!
	$cookie_domain = 'inbode.com';

	// inbode variables
	// system path, depends on environment
	$conf['i_syspath'] = '/usr/www/users/inbode/git/inbode/inbode.com/src';
	
	// URI to Image server
	$conf['i_imgsrv'] = 'http://inbode.com/';
	
	// Inbode Application Name
	$conf['i_appname'] = 'Inbode Beta';

	// fusion tables specific
	// google account username
	$conf['i_GAuser'] = 'maps@inbode.com';
	// google account password	
	$conf['i_GApass'] = 'w1r3dmag';
	// fusion table datasrc id
	$conf['i_InbodeBeta-BuildingsUnits'] = '422613';

} else if (file_exists("/Users/ivan/git/inbode/inbode.com/src")) {

	// ivan's local
	$db_url = 'mysqli://root:root@127.0.0.1/_drupal_inbode';
	$base_url = 'http://inbode';  // NO trailing slash!
	$cookie_domain = 'inbode';

	// inbode variables
	// system path, depends on environment
	$conf['i_syspath'] = '/Users/ivan/git/inbode/inbode.com/src';		// Ivan
	
	// URI to Image server
	$conf['i_imgsrv'] = 'http://inbode/';
	
	// Inbode Application Name
	$conf['i_appname'] = 'Inbode Beta';

	// fusion tables specific
	// google account username
	$conf['i_GAuser'] = 'maps@inbode.com';
	// google account password	
	$conf['i_GApass'] = 'w1r3dmag';
	// fusion table datasrc id
	$conf['i_InbodeBeta-BuildingsUnits'] = '517005';


} else if (file_exists("/Users/mtm/Documents/git_inbode/inbode.com/src")) {

	// matt's local
	$db_url = 'mysqli://root:@127.0.0.1:33066/_drupal_inbode';
	$base_url = 'http://inbode:8082';  // NO trailing slash!
	$cookie_domain = 'inbode';

	// inbode variables
	// system path, depends on environment
	$conf['i_syspath'] = '/Users/mtm/Documents/git_inbode/inbode.com/src';		// Matt
	
	// URI to Image server
	$conf['i_imgsrv'] = 'http://inbode:8082/';
	
	// Inbode Application Name
	$conf['i_appname'] = 'Inbode Beta';

	// fusion tables specific
	// google account username
	$conf['i_GAuser'] = 'maps@inbode.com';
	// google account password	
	$conf['i_GApass'] = 'w1r3dmag';
	// fusion table datasrc id
	$conf['i_InbodeBeta-BuildingsUnits'] = '517005';
	
		

} else {

	// local (will)
	$db_url = 'mysqli://root:root@127.0.0.1/_drupal_inbode';
	$base_url = 'http://inbode';  // NO trailing slash!
	$cookie_domain = 'inbode';

	// inbode variables
	// system path, depends on environment
	$conf['i_syspath'] = '/Users/william/git/inbode/inbode.com/src';		// William
	
	// URI to Image server
	$conf['i_imgsrv'] = 'http://inbode/';
	
	// Inbode Application Name
	$conf['i_appname'] = 'Inbode Beta';

	// fusion tables specific
	// google account username
	$conf['i_GAuser'] = 'maps@inbode.com';
	// google account password	
	$conf['i_GApass'] = 'w1r3dmag';
	// fusion table datasrc id
	$conf['i_InbodeBeta-BuildingsUnits'] = '517005';

}