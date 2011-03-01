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
	$conf['i_GAtoken'] = 'DQAAAJ8BAAD_iDEUDg77F8rmBLZxkTQrUenastqFcUT73A-DgTyPE2dBKActL7hEqcOJ4Bn4EOY0sJJkKarzn9fcAjKIIBsCSTh36_nJJfSxxAhQGbQuckbc9TS0N7W2ZuHbAQ-nAT3XM3W3HOMe8jPWxD7Lz1gH2RrIeFG5losmnZzecXDxpNQz9Jxw-KaldOmMSa0rnf8q6yOQdfhr8BN7DTNac81EwamEJWVWnfHIlV9IlKo7fC_ejXbAKybjID0kxRENY-S9WCNWpeOX08cmdMUkygEmM6_-EAyMWvyXCTG9x99BzZMHddmH9FM3GmQ-GHUjwCNg-vekYhEbeO_f3DlFasRfasQXJSWHAJ2UsxVsJ9BsciRGXThL2jgBsEhn_aAaMaNiV5ov4ly1KDDCV7-4JYBgfWvbID87lmvNYPD0OO14TPUWYXCE8ma_PYZMOgxhKFuDFo2k2W_NlbC5cSF26_ruRX-nizIlm7fulPrd3VQ-wtInQXrkunjEthcBLNqY324b3t_niRgEkgSzBM99siqfkhpfp40_Vkm-eofMhdhp_A';
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
	$conf['i_GAtoken'] = 'DQAAAJ8BAAD_iDEUDg77F8rmBLZxkTQrUenastqFcUT73A-DgTyPE2dBKActL7hEqcOJ4Bn4EOY0sJJkKarzn9fcAjKIIBsCSTh36_nJJfSxxAhQGbQuckbc9TS0N7W2ZuHbAQ-nAT3XM3W3HOMe8jPWxD7Lz1gH2RrIeFG5losmnZzecXDxpNQz9Jxw-KaldOmMSa0rnf8q6yOQdfhr8BN7DTNac81EwamEJWVWnfHIlV9IlKo7fC_ejXbAKybjID0kxRENY-S9WCNWpeOX08cmdMUkygEmM6_-EAyMWvyXCTG9x99BzZMHddmH9FM3GmQ-GHUjwCNg-vekYhEbeO_f3DlFasRfasQXJSWHAJ2UsxVsJ9BsciRGXThL2jgBsEhn_aAaMaNiV5ov4ly1KDDCV7-4JYBgfWvbID87lmvNYPD0OO14TPUWYXCE8ma_PYZMOgxhKFuDFo2k2W_NlbC5cSF26_ruRX-nizIlm7fulPrd3VQ-wtInQXrkunjEthcBLNqY324b3t_niRgEkgSzBM99siqfkhpfp40_Vkm-eofMhdhp_A';
	$conf['i_InbodeBeta-BuildingsUnits'] = '422613';
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
	$conf['i_GAtoken'] = 'DQAAAJ8BAAD_iDEUDg77F8rmBLZxkTQrUenastqFcUT73A-DgTyPE2dBKActL7hEqcOJ4Bn4EOY0sJJkKarzn9fcAjKIIBsCSTh36_nJJfSxxAhQGbQuckbc9TS0N7W2ZuHbAQ-nAT3XM3W3HOMe8jPWxD7Lz1gH2RrIeFG5losmnZzecXDxpNQz9Jxw-KaldOmMSa0rnf8q6yOQdfhr8BN7DTNac81EwamEJWVWnfHIlV9IlKo7fC_ejXbAKybjID0kxRENY-S9WCNWpeOX08cmdMUkygEmM6_-EAyMWvyXCTG9x99BzZMHddmH9FM3GmQ-GHUjwCNg-vekYhEbeO_f3DlFasRfasQXJSWHAJ2UsxVsJ9BsciRGXThL2jgBsEhn_aAaMaNiV5ov4ly1KDDCV7-4JYBgfWvbID87lmvNYPD0OO14TPUWYXCE8ma_PYZMOgxhKFuDFo2k2W_NlbC5cSF26_ruRX-nizIlm7fulPrd3VQ-wtInQXrkunjEthcBLNqY324b3t_niRgEkgSzBM99siqfkhpfp40_Vkm-eofMhdhp_A';
	$conf['i_InbodeBeta-BuildingsUnits'] = '517005';
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
	$conf['i_GAtoken'] = 'DQAAAJ8BAAD_iDEUDg77F8rmBLZxkTQrUenastqFcUT73A-DgTyPE2dBKActL7hEqcOJ4Bn4EOY0sJJkKarzn9fcAjKIIBsCSTh36_nJJfSxxAhQGbQuckbc9TS0N7W2ZuHbAQ-nAT3XM3W3HOMe8jPWxD7Lz1gH2RrIeFG5losmnZzecXDxpNQz9Jxw-KaldOmMSa0rnf8q6yOQdfhr8BN7DTNac81EwamEJWVWnfHIlV9IlKo7fC_ejXbAKybjID0kxRENY-S9WCNWpeOX08cmdMUkygEmM6_-EAyMWvyXCTG9x99BzZMHddmH9FM3GmQ-GHUjwCNg-vekYhEbeO_f3DlFasRfasQXJSWHAJ2UsxVsJ9BsciRGXThL2jgBsEhn_aAaMaNiV5ov4ly1KDDCV7-4JYBgfWvbID87lmvNYPD0OO14TPUWYXCE8ma_PYZMOgxhKFuDFo2k2W_NlbC5cSF26_ruRX-nizIlm7fulPrd3VQ-wtInQXrkunjEthcBLNqY324b3t_niRgEkgSzBM99siqfkhpfp40_Vkm-eofMhdhp_A';
	$conf['i_InbodeBeta-BuildingsUnits'] = '517005';
	// to be used in the future
	$conf['i_InbodeBeta-Building'] = '000000';
	$conf['i_InbodeBeta-Unit'] = '000000';


}