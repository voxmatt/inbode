<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

class Inbode {


	// a way to get the auth token for clientlogin on google accounts, we'll prob need this
	function getauthtoken($username, $password) {
		$loginurl = 'https://www.google.com/accounts/ClientLogin';
		$postparams = array(
											'Email' => $username,
											'Passwd' => $password,
											'service' => 'fusiontables',
											'accountType' => 'GOOGLE'
										);
	
		$r = $this->request($loginurl, 'POST', $postparams, NULL);
		if ($r['status'] == 'ok' && $r['info']['http_code'] == '200') {    	
			$response = $r['response'];
			$pieces = explode("\n", $r['response']);
			$token = '';
			foreach($pieces as $line) {
				if (substr($line, 0, 5)=='Auth=') {
					$token=str_ireplace('Auth=', '', $line);
				}
			}
	    return $token;
		} else {
			return $r['status'];	
		}
  }	


	// get the auth token
	function getactualtoken() {

		$CI =& get_instance();	
		$query = $CI->db->get_where('inbode_auth', array('id' => 1));
		$r = $query->result_array();
		
		if (isset($r[0]['token'])) {
			return $r[0]['token'];
		} else {
			return 0;
		}

	}

	// set the auth token
	function setactualtoken($token) {

		$CI =& get_instance();	
		$data = array(
		               'token' => $token
		            );
		$CI->db->where('id', 1);
		$CI->db->update('inbode_auth', $data); 

		return 1;

	}


	// fusion tables query
	function fusionquery($query) {
	
		$qurl = 'https://www.google.com/fusiontables/api/query';
		$token = $this->getactualtoken();
		
	  if(preg_match("/^select|^show tables|^describe/i", $query)) { 

			$url = $qurl."/?sql=".urlencode($query);
			$headers = array('Authorization: GoogleLogin auth='.$token);
	  	$ret = $this->request($url, 'GET', NULL, $headers);

		} else {

	 	  $query = "sql=".urlencode($query);
			$headers = array( 
								      'Content-type: application/x-www-form-urlencoded', 
								      'Authorization: GoogleLogin auth='.$token,
											'Content-Length: '.strlen($query)
								    );
	  	$ret = $this->request($qurl, 'POST', $query, $headers);
		
		}
		
		// response array
		$ra = array();
		$ra['info'] = $ret['info'];
		
		// if we got a unauthorized, then try to silently get a new token and try again
		if ($ret['info']['http_code']=='401') {
	
			// get a new token
			$CI =& get_instance();
			$token = $this->getauthtoken($CI->config->item('i_GAuser'),  $CI->config->item('i_GApass'));
			$set = $this->setactualtoken($token);
																			
			if ($set) {
			  unset($ret);
		  	$ret = $this->request($qurl, 'POST', $query, array('Authorization: GoogleLogin auth='.$token));
		  		
			}
																			
			
		}




		
		if ($ret['info']['content_type']=='text/plain; charset=UTF-8' && $ret['info']['http_code']=='200') {

		  $response = $ret['response'];
			$data = $this->str_getcsv($response, ',', '"' );

			// now loop thru each line, and create an array to return with a header row
			$records=count($data);
						
			if ($records>1) {

				$i=0;
				
				foreach ($data as $row) {
				
					$k = 0;
				
					foreach ($row as $col) {
					
							if ($i==0) {
								// first line of response are the column names
								$ra['column_name']['name'.$k] = $col;				
							} else {				
								// on to the data
								$ra['column_data'][$i][$ra['column_name']['name'.$k]] = $col;				
							}
							$k++;						
					
					}
					
					$i++;
				
				}

				$ra['count'] = $i-1;
			
			} else {
			
				$ra['response'] = $ret['response'];
				$ra['count'] = 0;		
			
			}
		
		} else {
		
			$ra['response'] = $ret['response'];
			$ra['count'] = 0;		
		}

		return $ra;
	  
	}
	
	function getcache($hash) {
	
		$CI =& get_instance();	
		$query = $CI->db->get_where('inbode_cache_geocode', array('hash' => $hash));
		$r = $query->result_array();
		
		if (isset($r[0]['lat']) && isset($r[0]['lng'])) {
	  	$ret = array('lat'=>$r[0]['lat'], 'lng'=>$r[0]['lng'], 'status'=>'OK', 'source'=>'CACHE');
	  	return $ret;
		} else {
			return 0;
		}		
	
	}

	function setcache($location) {

		// expect $location to be an array of location, lat, lng	
		$CI =& get_instance();	
		$data = array(
		               'searched_location' => $location['location'],
		               'lat' => $location['lat'],
		               'lng' => $location['lng'],
		               'hash' => md5($location['location'])
		            );

		$CI->db->insert('inbode_cache_geocode', $data); 

		return 1;
	
	}
	
	function geocode($address) {

		$cached_location = $this->getcache( md5($address) );

		if ( is_array( $cached_location ) ) {
			
			// we have an exact match, no need to geocode!
			return $cached_location;
			
		} else {
			
			// nothing in cache, geocode
	
			$CI =& get_instance();		
			$uri_geocode = $CI->config->item('i_geocodeuri') . '&address=' . urlencode($address);
	  	$r = $this->request($uri_geocode, 'GET', NULL, NULL);
	  	
			// json decode the response from google
			$geor = json_decode($r['response']);    		
	
	  	// get the lat & lon from the response
	  	if ($r['status'] == 'ok' && $r['info']['http_code'] == '200') {    	
	  		if ($geor->status == 'OK') {    		
	  			$lat = $geor->results[0]->geometry->location->lat;
	  			$lng = $geor->results[0]->geometry->location->lng;    		
	  		} else {
	  			
	  		}
	  	}
	  	
	  	if (isset($lat) && isset($lng)) {
				$location = array(
						               'location' => $address,
						               'lat' => $lat,
						               'lng' => $lng
													);
	  		$cc = $this->setcache($location);
		  	$ret = array('lat'=>$lat, 'lng'=>$lng, 'status'=>'OK');
	  	} else {
		  	$ret = array('lat'=>0, 'lng'=>0, 'status'=>$geor->status);
	  	}
	  	
	  	return $ret;

		}


	}
	
	function request($uri = NULL, $type = 'GET', $params = NULL, $headers = NULL) {

		// when setting the $headers, set it explicitly
		// $headers = array('Content type: blah/blah');
		// not
		// $headers = array('Content type' => 'blah/blah');
	
		$return = array();
	
		if (!$uri) {
			$return['status'] = 'error';
			$return['message'] = 'No URI specified.';
			return $return;
		}
		
		$ch = curl_init($uri);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $type);
		
		// if any headers are supplied
		if ($headers) {
			curl_setopt($ch, CURLOPT_HTTPHEADER, $headers );
		}
		
		// if any post parameters are supplied
		if (($type=='POST' && isset($params)) || ($type=='PUT' && isset($params))) {
			curl_setopt($ch, CURLOPT_POSTFIELDS, $params );
		}

		// misc options		
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);		
		curl_setopt($ch, CURLINFO_HEADER_OUT, 0);

		
		// get the response
		$return['response'] = curl_exec($ch);	
 		$return['info'] = curl_getinfo($ch);

		// check for curl errors
		if(curl_errno($ch)) {
	 		// uh ohhh	
			$return['status'] = 'error';
			$return['message'] = curl_error($ch);
	 		curl_close($ch);	
			return $return;
		}

		// destroy the curl session
 		curl_close($ch);		
	
		// respond
		$return['status'] = 'ok';
		return $return;

	}

	function str_getcsv($input, $delimiter=',', $enclosure='"', $escape=null, $eol=null) { 
	  $temp=fopen("php://memory", "rw"); 
	  fwrite($temp, $input); 
	  fseek($temp, 0); 
	  $r = array(); 
	  while (($data = fgetcsv($temp, 4096, $delimiter, $enclosure)) !== false) { 
	    $r[] = $data; 
	  } 
	  fclose($temp); 
	  return $r; 
	} 

	

}	