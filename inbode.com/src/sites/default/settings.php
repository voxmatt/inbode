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
	
	// Google Account username and password
	$conf['i_Guser'] = 'inbodemaps@gmail.com';
	$conf['i_Gpass'] = 'w1r3dmag';
	
	// Google Maps unique ID
	$conf['i_mid'] = '00048d00ffda2e6448768';
	
	// URI to Image server
	$conf['i_imgsrv'] = 'http://inbode.ten7i.net/';
	
	// Inbode Application Name
	$conf['i_appname'] = 'Inbode Alpha';

	// fusion tables specific
	// google account username
	$conf['i_GAuser'] = 'maps@inbode.com';
	// google account password	
	$conf['i_GApass'] = 'w1r3dmag';
	// google token for client login
	$conf['i_GAtoken'] = 'DQAAAJUBAACXh_6YQC7wSnZEb1W3zZOr7pUwZ5UoFvMG9mGiP20GL5ikh6vR4rHp_0ADPCU_fc5PKDdi5NpS5VIysIbJAm-HSGXtxXRkAqqbb-2kgZoeCdNb6DygF0bTUtf-6PwWZqauY3ysFe-QOYyp5erz5Innrn1hseQsBOvkMCmVwUsedJq8x9D-rAiOlzIDL_TsYWmL6sQI08FuewPOk_OVbCIP8IZ05blm0CCFjze8of-ZhAs4xKNRpGGzzT1U7ml9MfMbDWVW_cBnsNVLIujuk8RDnlXMYDwihBIDMi924rEAc5_7bapwz_mF6p7RCGGsZ7tNzwmjNBC5G8h63m8OziduAsWYMSWJME37qsVmi13ADT3PD2pkGcvHZp9Z43V3uzZjkvdSsZicq-AqOlbfdGQ2cvmO7mqiYoCAK0tWIiOBHp8MaHiexeG9XF4s0IipV_zscHie4IALxY-qyKhsdLtWXSCPcgordPWXInesZVpQyaz0u09gUSi5sfQx94bH7abIGsE8UjluOQQZWJjzTR29gDHHFuzOHhrjpLcOflJ0Eg';
	$conf['i_InbodeBeta-BuildingsUnits'] = '417990';
	// to be used in the future
	$conf['i_InbodeBeta-Building'] = '000000';
	$conf['i_InbodeBeta-Unit'] = '000000';
	
	
} else if (file_exists("/usr/www/users/inbode")) {

	// production
	$db_url = 'mysqli://inbode:MuN6bHMC@db139c.pair.com/inbode_drupal';
	$base_url = 'http://inbode.com';  // NO trailing slash!
	$cookie_domain = 'inbode.com';

	// inbode variables
	// system path, depends on environment
	$conf['i_syspath'] = '/usr/www/users/inbode/git/inbode/inbode.com/src';
	
	// Google Account username and password
	$conf['i_Guser'] = 'inbodemaps@gmail.com';
	$conf['i_Gpass'] = 'w1r3dmag';
	
	// Google Maps unique ID
	$conf['i_mid'] = '00048d00ffda2e6448768';
	
	// URI to Image server
	$conf['i_imgsrv'] = 'http://inbode.com/';
	
	// Inbode Application Name
	$conf['i_appname'] = 'Inbode Alpha';

	// fusion tables specific
	// google account username
	$conf['i_GAuser'] = 'maps@inbode.com';
	// google account password	
	$conf['i_GApass'] = 'w1r3dmag';
	// google token for client login
	$conf['i_GAtoken'] = 'DQAAAJUBAACXh_6YQC7wSnZEb1W3zZOr7pUwZ5UoFvMG9mGiP20GL5ikh6vR4rHp_0ADPCU_fc5PKDdi5NpS5VIysIbJAm-HSGXtxXRkAqqbb-2kgZoeCdNb6DygF0bTUtf-6PwWZqauY3ysFe-QOYyp5erz5Innrn1hseQsBOvkMCmVwUsedJq8x9D-rAiOlzIDL_TsYWmL6sQI08FuewPOk_OVbCIP8IZ05blm0CCFjze8of-ZhAs4xKNRpGGzzT1U7ml9MfMbDWVW_cBnsNVLIujuk8RDnlXMYDwihBIDMi924rEAc5_7bapwz_mF6p7RCGGsZ7tNzwmjNBC5G8h63m8OziduAsWYMSWJME37qsVmi13ADT3PD2pkGcvHZp9Z43V3uzZjkvdSsZicq-AqOlbfdGQ2cvmO7mqiYoCAK0tWIiOBHp8MaHiexeG9XF4s0IipV_zscHie4IALxY-qyKhsdLtWXSCPcgordPWXInesZVpQyaz0u09gUSi5sfQx94bH7abIGsE8UjluOQQZWJjzTR29gDHHFuzOHhrjpLcOflJ0Eg';
	$conf['i_InbodeBeta-BuildingsUnits'] = '417990';
	// to be used in the future
	$conf['i_InbodeBeta-Building'] = '000000';
	$conf['i_InbodeBeta-Unit'] = '000000';


} else if (file_exists("/Users/ivan/git/inbode/inbode.com/src")) {

	// ivan's local
	$db_url = 'mysqli://root:root@127.0.0.1/_drupal_inbode';
	$base_url = 'http://inbode';  // NO trailing slash!
	$cookie_domain = 'inbode';

	// inbode variables
	// system path, depends on environment
	$conf['i_syspath'] = '/Users/ivan/git/inbode/inbode.com/src';		// Ivan
	
	// Google Account username and password
	$conf['i_Guser'] = 'inbodemaps@gmail.com';
	$conf['i_Gpass'] = 'w1r3dmag';
	
	// Google Maps unique ID
	$conf['i_mid'] = '00048d00ffda2e6448768';
	
	// URI to Image server
	$conf['i_imgsrv'] = 'http://inbode/';
	
	// Inbode Application Name
	$conf['i_appname'] = 'Inbode Alpha';

	// fusion tables specific
	// google account username
	$conf['i_GAuser'] = 'maps@inbode.com';
	// google account password	
	$conf['i_GApass'] = 'w1r3dmag';
	// google token for client login
	$conf['i_GAtoken'] = 'DQAAAJUBAACXh_6YQC7wSnZEb1W3zZOr7pUwZ5UoFvMG9mGiP20GL5ikh6vR4rHp_0ADPCU_fc5PKDdi5NpS5VIysIbJAm-HSGXtxXRkAqqbb-2kgZoeCdNb6DygF0bTUtf-6PwWZqauY3ysFe-QOYyp5erz5Innrn1hseQsBOvkMCmVwUsedJq8x9D-rAiOlzIDL_TsYWmL6sQI08FuewPOk_OVbCIP8IZ05blm0CCFjze8of-ZhAs4xKNRpGGzzT1U7ml9MfMbDWVW_cBnsNVLIujuk8RDnlXMYDwihBIDMi924rEAc5_7bapwz_mF6p7RCGGsZ7tNzwmjNBC5G8h63m8OziduAsWYMSWJME37qsVmi13ADT3PD2pkGcvHZp9Z43V3uzZjkvdSsZicq-AqOlbfdGQ2cvmO7mqiYoCAK0tWIiOBHp8MaHiexeG9XF4s0IipV_zscHie4IALxY-qyKhsdLtWXSCPcgordPWXInesZVpQyaz0u09gUSi5sfQx94bH7abIGsE8UjluOQQZWJjzTR29gDHHFuzOHhrjpLcOflJ0Eg';
	$conf['i_InbodeBeta-BuildingsUnits'] = '417990';
	// to be used in the future
	$conf['i_InbodeBeta-Building'] = '000000';
	$conf['i_InbodeBeta-Unit'] = '000000';


} else {

	// local
	$db_url = 'mysqli://root:root@127.0.0.1/_drupal_inbode';
	$base_url = 'http://inbode';  // NO trailing slash!
	$cookie_domain = 'inbode';

	// inbode variables
	// system path, depends on environment
	$conf['i_syspath'] = '/Users/william/git/inbode/inbode.com/src';		// William
	
	// Google Account username and password
	$conf['i_Guser'] = 'inbodemaps@gmail.com';
	$conf['i_Gpass'] = 'w1r3dmag';
	
	// Google Maps unique ID
	$conf['i_mid'] = '00048d00ffda2e6448768';
	
	// URI to Image server
	$conf['i_imgsrv'] = 'http://inbode/';
	
	// Inbode Application Name
	$conf['i_appname'] = 'Inbode Alpha';

	// fusion tables specific
	// google account username
	$conf['i_GAuser'] = 'maps@inbode.com';
	// google account password	
	$conf['i_GApass'] = 'w1r3dmag';
	// google token for client login
	$conf['i_GAtoken'] = 'DQAAAJUBAACXh_6YQC7wSnZEb1W3zZOr7pUwZ5UoFvMG9mGiP20GL5ikh6vR4rHp_0ADPCU_fc5PKDdi5NpS5VIysIbJAm-HSGXtxXRkAqqbb-2kgZoeCdNb6DygF0bTUtf-6PwWZqauY3ysFe-QOYyp5erz5Innrn1hseQsBOvkMCmVwUsedJq8x9D-rAiOlzIDL_TsYWmL6sQI08FuewPOk_OVbCIP8IZ05blm0CCFjze8of-ZhAs4xKNRpGGzzT1U7ml9MfMbDWVW_cBnsNVLIujuk8RDnlXMYDwihBIDMi924rEAc5_7bapwz_mF6p7RCGGsZ7tNzwmjNBC5G8h63m8OziduAsWYMSWJME37qsVmi13ADT3PD2pkGcvHZp9Z43V3uzZjkvdSsZicq-AqOlbfdGQ2cvmO7mqiYoCAK0tWIiOBHp8MaHiexeG9XF4s0IipV_zscHie4IALxY-qyKhsdLtWXSCPcgordPWXInesZVpQyaz0u09gUSi5sfQx94bH7abIGsE8UjluOQQZWJjzTR29gDHHFuzOHhrjpLcOflJ0Eg';
	$conf['i_InbodeBeta-BuildingsUnits'] = '417990';
	// to be used in the future
	$conf['i_InbodeBeta-Building'] = '000000';
	$conf['i_InbodeBeta-Unit'] = '000000';


}