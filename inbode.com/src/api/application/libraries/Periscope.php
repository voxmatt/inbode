<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

class Periscope {

	// check for the existence of cache and return it if it has not expired. delete the cache if it's expired! (self cleaning cache)
	function get_cache($cachehash) {
	
		$CI =& get_instance();
		$cachetime = $CI->config->item('api_cache_time');
		$query = $CI->db->query("SELECT id, hash, cache, created FROM periscope_cache WHERE hash='".$cachehash."' LIMIT 1");
		$row = $query->row_array();
		// if there is a cache in the database, then act on it
		if(isset($row['id'])) {

			// if the cache is fresh, return it else delete it
			if ( (time()-strtotime($row["created"])) < $cachetime ) {
				// fresh!
				return unserialize($row["cache"]); 
			} else {
				// stale, delete it
				$CI->db->delete('periscope_cache', array('hash' => $cachehash)); 
				return 0;
			}

		} else {
			return 0;
		}
	
	}
	
	// set the cache for a particular request
	function set_cache($cachehache, $cache) {
	
		$CI =& get_instance();
		$datatoinsert=array(
												'hash' => $cachehache,
												'cache' => serialize($cache)
									);
									
		// nice query string
		$sql = $CI->db->insert_string('periscope_cache', $datatoinsert);
		$result = $CI->db->query($sql);
	
		if (!$result)
		{
		  // if query returns null
			log_message('error', 'Failed to insert cache: '.serialize($datatoinsert));
			return 0;
		}	else {
			return $cachehache;
		}
	
	}
	
	
	// check if a uid exists in the users table
	function check_uid($uid=0) {

		$CI =& get_instance();
		$query = $CI->db->query("SELECT uid FROM users WHERE uid=$uid LIMIT 1");				
		$row = $query->row_array();
		if(isset($row['uid'])) {
			return $row['uid'];			
		} else {
			return 0;
		}

	}
	
	
	// set which accounts are enabled for a user
	function enable_accounts($uid, $accounts) {
	
		$CI =& get_instance();

		// set all accounts to disabled first
		$datatoupdate=array(
												'enabled' => '0'
									);
		$where = "uid = ".$uid;
		$sql = $CI->db->update_string('periscope_accounts', $datatoupdate, $where);
		$result = $CI->db->query($sql);		
		if (!$result) {
		  // if query returns null
			log_message('error', 'There was an error disabling all accounts for user  '.$uid );
			return 0;
		}

		// now enable accounts that are submitted
		$a=implode(",", $accounts);
		$datatoupdate=array(
												'enabled' => '1'
									);
		$where = "uid = ". $uid ." AND aid IN (". $a .")";
		$sql = $CI->db->update_string('periscope_accounts', $datatoupdate, $where);
		$result = $CI->db->query($sql);		
		if (!$result) {
		  // if query returns null
			log_message('error', 'There was an error enabling accounts for user '. $uid .' with accounts '. $a);
			return 0;
		}
		
		return 1;
		
	
	}
		
	// create a user's account info
	function create_user($account_info)
	{
	
		// account info object looks something like this:
		// {"accounts":[{"href":"https:\/\/ten7.highrisehq.com","name":"Ten Seven Interactive","product":"highrise","id":82985},{"href":"https:\/\/ten7.basecamphq.com","name":"Ten Seven Interactive","product":"basecamp","id":1023285},{"href":"https:\/\/localdesign.basecamphq.com","name":"Local Design Group","product":"basecamp","id":921040},{"href":"https:\/\/daltonsherman.basecamphq.com","name":"Dalton Sherman","product":"basecamp","id":865475},{"href":"https:\/\/rentalproperty.highrisehq.com","name":"Rental Property","product":"highrise","id":1175686},{"href":"https:\/\/ten7.backpackit.com","name":"ten7","product":"backpack","id":1244339},{"href":"https:\/\/prscp.campfirenow.com","name":"Ten 7 Interactive, LLC","product":"campfire","id":1254747}],"expires_at":"2010-06-21T04:10:07Z","identity":{"first_name":"Ivan","email_address":"ivan@ten7i.net","last_name":"Stegic","id":83619}, "access_token": "asdasd~~asdasdas"}

		$CI =& get_instance();
		$success="";

		// create user
		$datatoinsert=array(
												'uid' => $account_info->identity->id,
												'name' => $account_info->identity->first_name.$account_info->identity->last_name.$account_info->identity->id, 
												'pass' => md5($account_info->access_token),
												'mail' => $account_info->identity->email_address,
												'created' => time(),
												'access' => time(),
												'login' => time(),
												'status' => '1'
									);
									
				
		// nice query string
		$sql = $CI->db->insert_string('users', $datatoinsert);
		$result = $CI->db->query($sql);
	
		if (!$result)
		{
		  // if query returns null
			log_message('error', 'Failed to create user in users: '.serialize($datatoinsert));
			return 0;
		}


		// insert first name
		$datatoinsert=array(
												'fid' => 1,
												'uid' => $account_info->identity->id,
												'value' => $account_info->identity->first_name
									);
		$sql = $CI->db->insert_string('profile_values', $datatoinsert);
		$result = $CI->db->query($sql);

		if (!$result)
		{
		  // if query returns null
			log_message('error', 'There was an error inserting profile_values first_name with '.serialize($datatoupdate));
			return 0;
		}		

		// insert last name
		$datatoinsert=array(
												'fid' => 2,
												'uid' => $account_info->identity->id,
												'value' => $account_info->identity->last_name
									);
		$sql = $CI->db->insert_string('profile_values', $datatoinsert);
		$result = $CI->db->query($sql);
		if (!$result)
		{
		  // if query returns null
			log_message('error', 'There was an error inserting profile_values last_name with '.serialize($datatoinsert));
			return 0;
		}	

		
		// insert all accounts
		foreach($account_info->accounts as $account)
		{
		
			// no record of account, insert new info
			$datatoinsert=array(
												'uid' => $account_info->identity->id,
												'aid' => $account->id,
												'href' => $account->href,
												'name' => $account->name,
												'product' => $account->product,
												'updated' => time()
										);
			
			// nice query string
			$sql = $CI->db->insert_string('periscope_accounts', $datatoinsert);
			$result = $CI->db->query($sql);
		
			if (!$result)
			{
			  // if query returns null
				log_message('error', 'Failed to insert data in periscope_accounts: '.serialize($datatoinsert));
				return 0;
			}
			
			$account->enabled="0";

		}


		// everything went well, return a modified array
		$authinfo = (array) $account_info;
		$authinfo["new"]="1";				
		return $authinfo;
		
			
	}
		
	// update a user's account info
	function update_user($account_info)
	{	

		// account info object looks something like this:
		// {"accounts":[{"href":"https:\/\/ten7.highrisehq.com","name":"Ten Seven Interactive","product":"highrise","id":82985},{"href":"https:\/\/ten7.basecamphq.com","name":"Ten Seven Interactive","product":"basecamp","id":1023285},{"href":"https:\/\/localdesign.basecamphq.com","name":"Local Design Group","product":"basecamp","id":921040},{"href":"https:\/\/daltonsherman.basecamphq.com","name":"Dalton Sherman","product":"basecamp","id":865475},{"href":"https:\/\/rentalproperty.highrisehq.com","name":"Rental Property","product":"highrise","id":1175686},{"href":"https:\/\/ten7.backpackit.com","name":"ten7","product":"backpack","id":1244339},{"href":"https:\/\/prscp.campfirenow.com","name":"Ten 7 Interactive, LLC","product":"campfire","id":1254747}],"expires_at":"2010-06-21T04:10:07Z","identity":{"first_name":"Ivan","email_address":"ivan@ten7i.net","last_name":"Stegic","id":83619}}

		$CI =& get_instance();
		$success="";

		// update email, password, access time
		$datatoupdate=array(
												'pass' => md5($account_info->access_token),
												'mail' => $account_info->identity->email_address,
												'access' => time(),
												'login' => time()
									);
		$where = "uid = ".$account_info->identity->id;
		$sql = $CI->db->update_string('users', $datatoupdate, $where);
		$result = $CI->db->query($sql);		
		if (!$result)
		{
		  // if query returns null
			log_message('error', 'There was an error updating users '.$account_info->identity->id.' with '.serialize($datatoupdate));
			return 0;
		}		

		// update first name
		$datatoupdate=array(
												'value' => $account_info->identity->first_name
									);
		$where = " fid=1 AND uid=".$account_info->identity->id;
		$sql = $CI->db->update_string('profile_values', $datatoupdate, $where);
		$result = $CI->db->query($sql);
		if (!$result)
		{
		  // if query returns null
			log_message('error', 'There was an error updating profile_values first_name with '.serialize($datatoupdate));
			return 0;
		}		

		// update last name
		$datatoupdate=array(
												'value' => $account_info->identity->last_name
									);
		$where = " fid=2 AND uid=".$account_info->identity->id;
		$sql = $CI->db->update_string('profile_values', $datatoupdate, $where);
		$result = $CI->db->query($sql);
		if (!$result)
		{
		  // if query returns null
			log_message('error', 'There was an error updating profile_values last_name with '.serialize($datatoupdate));
			return 0;
		}	

		// look to see what accounts we already have
		$query = $CI->db->get_where('periscope_accounts', array('uid' => $account_info->identity->id));
		
		// array of accounts already configured
		$accountid=array();
		$enabled=array();
		
		foreach ($query->result() as $row)
		{
		    $accountid[] = $row->aid;
		    $enabled[$row->aid] = $row->enabled;
		}

		
		// update all accounts
		foreach($account_info->accounts as $account)
		{

			if (in_array($account->id, $accountid))
			{
				// the account is in the db, update
				$datatoupdate=array(
														'href' => $account->href,
														'name' => $account->name,
														'product' => $account->product
											);
				$where = " uid=".$account_info->identity->id." AND aid= ".$account->id;
				$sql = $CI->db->update_string('periscope_accounts', $datatoupdate, $where);
				$result = $CI->db->query($sql);
				if (!$result)
				{
				  // if query returns null
					log_message('error', 'There was an error updating periscope_accounts with '.serialize($datatoupdate));
					return 0;
				}	
				
			}
			else
			{
				// no record of account, insert new info
				$datatoinsert=array(
													'uid' => $account_info->identity->id,
													'aid' => $account->id,
													'href' => $account->href,
													'name' => $account->name,
													'product' => $account->product,
													'updated' => time()
											);
				
				// nice query string
				$sql = $CI->db->insert_string('periscope_accounts', $datatoinsert);
				$result = $CI->db->query($sql);
			
				if (!$result)
				{
				  // if query returns null
					log_message('error', 'Failed to insert data in periscope_accounts: '.serialize($datatoinsert));
					return 0;
				}

			}
			
			$account->enabled=$enabled[$account->id];
			

		}

		$authinfo = (array) $account_info;
		$authinfo["new"]="0";				
		return $authinfo;

		
	}

	// return an array of urls of enabled accounts
	function get_accounts($uid)
	{
	
		$CI =& get_instance();
		$query = $CI->db->query("SELECT * FROM periscope_accounts WHERE uid=$uid AND enabled=1;");				
		return $query->result_array();
	
	
	}

	
	// log info to the database
	function dblog($uid=0, $type="periscope", $message=NULL, $variables=NULL, $severity=1, $link=NULL, $location=NULL, $referer=NULL, $hostname )
	{
	
		// codeigniter instance
		$CI =& get_instance();
		
		// setup the array with info
		$datatolog=array(
											'uid' => $uid,
											'type' => $type,
											'message' => $message,
											'variables' => $variables,
											'severity' => $severity,
											'link' => $link,
											'location' => $location,
											'referer' => $referer,
											'hostname' => $hostname,
											'timestamp' => time()
									);
		
		// nice query string
		$sql = $CI->db->insert_string('watchdog', $datatolog);
		$result = $CI->db->query($sql);
	
		if (!$result)
		{
		  // if query returns null
			log_message('error', 'There was an error logging to the database: '.$CI->db->_error_number().' '.$CI->db->_error_message());
			log_message('error', 'Array values we tried to log: '.serialize($datatolog));
		}

	
	}


	// multiple http requests
	function multiRequest($data, $options = array(), $header) {
	
		// array of curl handles
		$curly = array();
		// data to be returned
		$result = array();
		
		// multi handle
		$mh = curl_multi_init();
		
		// loop through $data and create curl handles
		// then add them to the multi-handle
		foreach ($data as $id => $d) {
		
		  $curly[$id] = curl_init();
		
		  $url = (is_array($d) && !empty($d['url'])) ? $d['url'] : $d;
		  curl_setopt($curly[$id], CURLOPT_URL,            $url);
		  curl_setopt($curly[$id], CURLOPT_HEADER,         0);
		  curl_setopt($curly[$id], CURLOPT_RETURNTRANSFER, 1);

		  
		  if ($header) {
			  curl_setopt($curly[$id], CURLOPT_HTTPHEADER, array($header) );
		  }
		
		  // post?
		  if (is_array($d)) {
		    if (!empty($d['post'])) {
		      curl_setopt($curly[$id], CURLOPT_POST,       1);
		      curl_setopt($curly[$id], CURLOPT_POSTFIELDS, $d['post']);
		    }
		  }
		
		  // extra options?
		  if (!empty($options)) {
		    curl_setopt_array($curly[$id], $options);
		  }
		
		  curl_multi_add_handle($mh, $curly[$id]);
		}
		
		// execute the handles
		$running = null;
		do {
		  curl_multi_exec($mh, $running);
		} while($running > 0);
		
		// get content and remove handles
		foreach($curly as $id => $c) {
		  $result[$id] = curl_multi_getcontent($c);
		  curl_multi_remove_handle($mh, $c);
		}
		
		// all done
		curl_multi_close($mh);
		
		return $result;
	}

	// safely encode something so we can use it in an url
	function urlsafe_b64encode($string) {
		$data = base64_encode($string);
		$data = str_replace(array('+','/','='),array('-','_',''),$data);
		return $data;
	}

	// decode something that was safely encoded
	function urlsafe_b64decode($string) {
		$data = str_replace(array('-','_'),array('+','/'),$string);
		$mod4 = strlen($data) % 4;
		if ($mod4) {
			$data .= substr('====', $mod4);
		}
		return base64_decode($data);
	}


	// try to guess what happened based on the string: file upload, comment made, milestone checked, what?
	function guess_event( $s ) {
	
		// Backpack
		if (stristr($s, "made changes to")) { return "updated"; }	
		if (stristr($s, "Made a new page")) { return "new-page"; }	
		if (stristr($s, "Added a reminder")) { return "reminder-added"; }	
	
		// Highrise 
		if (stristr($s, "Deal created")) { return "deal-created"; }	
		if (stristr($s, "Email about")) { return "email-about"; }	
		if (stristr($s, "Note about")) { return "note-about"; }	
		if (stristr($s, "Task completed")) { return "task-completed"; }	


		// Basecamp
		// Todos
		if (stristr($s, "Todo added")) { return "todo-added";}
		if (stristr($s, "Todo completed")) { return "todo-completed"; }
		if (stristr($s, "Todo reopened")) { return "todo-reopened"; }
		// Messages
		if (stristr($s, "Comment posted")) { return "comment-posted"; }
		if (stristr($s, "Message posted")) { return "message-posted"; }
		// Milestones
		if (stristr($s, "Milestone added")) { return "milestone-added"; }
		if (stristr($s, "Milestone completed")) { return "milestone-completed"; }
		if (stristr($s, "Milestone reopened")) { return "milestone-reopened"; }
		// Writeboards
		if (stristr($s, "Writeboard added")) { return "writeboard-added"; }
		if (stristr($s, "Writeboard updated")) { return "writeboard-updated"; }
		
		// files
		if (stristr($s, "File uploaded")) {
			// probably try to determine what kind of file was uploaded
			if (stristr($s, "JPG")) { return "file-uploaded-image"; };
			if (stristr($s, "JPEG")) { return "file-uploaded-image"; };
			if (stristr($s, "TIF")) { return "file-uploaded-image"; };
			if (stristr($s, "TIFF")) { return "file-uploaded-image"; };
			if (stristr($s, "GIF")) { return "file-uploaded-image"; };
			if (stristr($s, "PNG")) { return "file-uploaded-image"; };
			if (stristr($s, "PSD")) { return "file-uploaded-psd"; };
			if (stristr($s, "PDF")) { return "file-uploaded-pdf"; };
			if (stristr($s, "PPT")) { return "file-uploaded-ppt"; };
			if (stristr($s, "DOC")) { return "file-uploaded-doc"; };
			if (stristr($s, "DOCX")) { return "file-uploaded-doc"; };
			if (stristr($s, "XLS")) { return "file-uploaded-xls"; };
			if (stristr($s, "ZIP")) { return "file-uploaded-zip"; };
			if (stristr($s, "GZ")) { return "file-uploaded-zip"; };
			if (stristr($s, "GZIP")) { return "file-uploaded-zip"; };
			if (stristr($s, "TAR")) { return "file-uploaded-zip"; };
			if (stristr($s, "TXT")) { return "file-uploaded-txt"; };
			if (stristr($s, "CSV")) { return "file-uploaded-csv"; };
			if (stristr($s, "RTF")) { return "file-uploaded-doc"; };
			if (stristr($s, "RAR")) { return "file-uploaded-zip"; };
			if (stristr($s, "MOV")) { return "file-uploaded-video"; };
			if (stristr($s, "WMV")) { return "file-uploaded-video"; };
			if (stristr($s, "MPG")) { return "file-uploaded-video"; };
			if (stristr($s, "MPEG")) { return "file-uploaded-video"; };
			if (stristr($s, "AI")) { return "file-uploaded-ai"; };
			return "file-uploaded";
		}		


		
		
		return "generic-event";
	
	
	}
	
	
	
	// get the product being used based on the domain info
	function getproduct($url, $abb=NULL)
	{	
		// basecamp
		if (stristr($url, "basecamphq.com")) { if ($abb) { return "B"; } else { return "basecamp"; } };
		// highrise
		if (stristr($url, "highrisehq.com")) { if ($abb) { return "H"; } else { return "highrise"; } };
		// campfire
		if (stristr($url, "campfirenow.com")) { if ($abb) { return "C"; } else { return "campfire"; } };
		// backpack
		if (stristr($url, "backpackit.com")) { if ($abb) { return "Bp"; } else { return "backpack"; } };
		return "unknown";	
	}


}


























