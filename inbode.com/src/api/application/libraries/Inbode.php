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

		$CI =& get_instance();
  	$r = $this->request($loginurl, 'POST', $postparams, NULL);
  	if ($r['status'] == 'ok' && $r['info']['http_code'] == '200') {    	
	    $token_array = explode("=",  $r['response']);
	    $token = str_replace("\n", "", $token_array[3]);
	    return $token;
		} else {
			return $r['status'];	
		}

  }	

	// fusion tables query
	function fusionquery($query) {
	
		$qurl = 'https://www.google.com/fusiontables/api/query';
		$CI =& get_instance();
		$token = $CI->config->item('i_GAtoken');
		
	  if(preg_match("/^select|^show tables|^describe/i", $query)) { 

			$url = $qurl."/?sql=".urlencode($query);
			$headers = array('Authorization: GoogleLogin auth='.$token);
	  	$ret = $this->request($url, 'GET', NULL, $headers);

		} else {
		
	 	  $query = "sql=".urlencode($query);
	 	  $params = array( 'sql' => urlencode($query) );
			$headers = array( 
								      'Content-type: application/x-www-form-urlencoded', 
								      'Authorization: GoogleLogin auth='.$token         
								    );
	  	$ret = $this->request($qurl, 'POST', $params, $headers);
		
		}

		// response array
		$ra = array();
		$ra['info'] = $ret['info'];
		
		if ($ret['info']['content_type']=='text/plain; charset=UTF-8' && $ret['info']['http_code']=='200') {

		  $response = $ret['response'];
		  // get the response into an array of lines (responses are always csv from google, tables of data)
			$lines = explode("\n", $response);
			
			// now loop thru each line, and create an array to return with a header row
			$records=count($lines);
			
			if ($records>1) {

				$i=0;

				foreach ($lines as $line) {
					$cols = $this->str_getcsv($line);		
					if ($line) {
						// loop thru each of the cols, either header or data
						$k=0;
						foreach($cols as $col) {
							if ($i==0) {
								// first line of response are the column names
								$ra['column_name']['name'.$k] = $col;				
							} else {				
								// on to the data
								$ra['column_data'][$i][$ra['column_name']['name'.$k]] = $col;				
							}
							$k++;
						}				
						// increment			
						$i++;		
					}	
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
	

	function geocode($address) {

		$CI =& get_instance();
		$uri_geocode = $CI->config->item('i_geocodeuri') . '&address=' . urlencode($address);
  	$r = $this->request($uri_geocode, 'GET', NULL, NULL);
  	
  	// get the lat & lon from the response
  	if ($r['status'] == 'ok' && $r['info']['http_code'] == '200') {    	
  		$geor = json_decode($r['response']);    		
  		if ($geor->status == 'OK') {    		
  			$lat = $geor->results[0]->geometry->location->lat;
  			$lng = $geor->results[0]->geometry->location->lng;    		
  		}    	
  	}
  	
  	return array('lat'=>$lat, 'lng'=>$lng);

	}
	
	function request($uri = NULL, $type = 'GET', $params = NULL, $headers = NULL) {

		// when setting the $headers, set it explicitly
		// $headers = array('Content type: blah/blah');
		// not
		// $headers = array('Content type' => 'blah/blah');
		// !!!
	
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
			drupal_set_message('<p>There was an error: '. curl_error($ch). '</p>', 'error');
			watchdog('store_locator', 'Error in '. $type .' request to '. $uri .' with headers ['. addslashes(serialize($headers)) .'] and params ['. addslashes(serialize($params)) .'] -- '. addslashes(curl_error($ch)));
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
	  $r=fgetcsv($temp, 4096, $delimiter, $enclosure);
	  fclose($temp);
	  return $r;
	} 

	function xml2array($contents, $get_attributes=1, $priority = 'tag') { 
			// thanks!	
			// http://www.bin-co.com/php/scripts/xml2array/	
	    if(!$contents) return array(); 
	
	    if(!function_exists('xml_parser_create')) { 
	        //print "'xml_parser_create()' function not found!"; 
	        return array(); 
	    } 
	
	    //Get the XML parser of PHP - PHP must have this module for the parser to work 
	    $parser = xml_parser_create(''); 
	    xml_parser_set_option($parser, XML_OPTION_TARGET_ENCODING, "UTF-8"); # http://minutillo.com/steve/weblog/2004/6/17/php-xml-and-character-encodings-a-tale-of-sadness-rage-and-data-loss 
	    xml_parser_set_option($parser, XML_OPTION_CASE_FOLDING, 0); 
	    xml_parser_set_option($parser, XML_OPTION_SKIP_WHITE, 1); 
	    xml_parse_into_struct($parser, trim($contents), $xml_values); 
	    xml_parser_free($parser); 
	
	    if(!$xml_values) return;//Hmm... 
	
	    //Initializations 
	    $xml_array = array(); 
	    $parents = array(); 
	    $opened_tags = array(); 
	    $arr = array(); 
	
	    $current = &$xml_array; //Refference 
	
	    //Go through the tags. 
	    $repeated_tag_index = array();//Multiple tags with same name will be turned into an array 
	    foreach($xml_values as $data) { 
	        unset($attributes,$value);//Remove existing values, or there will be trouble 
	
	        //This command will extract these variables into the foreach scope 
	        // tag(string), type(string), level(int), attributes(array). 
	        extract($data);//We could use the array by itself, but this cooler. 
	
	        $result = array(); 
	        $attributes_data = array(); 
	         
	        if(isset($value)) { 
	            if($priority == 'tag') $result = $value; 
	            else $result['value'] = $value; //Put the value in a assoc array if we are in the 'Attribute' mode 
	        } 
	
	        //Set the attributes too. 
	        if(isset($attributes) and $get_attributes) { 
	            foreach($attributes as $attr => $val) { 
	                if($priority == 'tag') $attributes_data[$attr] = $val; 
	                else $result['attr'][$attr] = $val; //Set all the attributes in a array called 'attr' 
	            } 
	        } 
	
	        //See tag status and do the needed. 
	        if($type == "open") {//The starting of the tag '<tag>' 
	            $parent[$level-1] = &$current; 
	            if(!is_array($current) or (!in_array($tag, array_keys($current)))) { //Insert New tag 
	                $current[$tag] = $result; 
	                if($attributes_data) $current[$tag. '_attr'] = $attributes_data; 
	                $repeated_tag_index[$tag.'_'.$level] = 1; 
	
	                $current = &$current[$tag]; 
	
	            } else { //There was another element with the same tag name 
	
	                if(isset($current[$tag][0])) {//If there is a 0th element it is already an array 
	                    $current[$tag][$repeated_tag_index[$tag.'_'.$level]] = $result; 
	                    $repeated_tag_index[$tag.'_'.$level]++; 
	                } else {//This section will make the value an array if multiple tags with the same name appear together
	                    $current[$tag] = array($current[$tag],$result);//This will combine the existing item and the new item together to make an array
	                    $repeated_tag_index[$tag.'_'.$level] = 2; 
	                     
	                    if(isset($current[$tag.'_attr'])) { //The attribute of the last(0th) tag must be moved as well 
	                        $current[$tag]['0_attr'] = $current[$tag.'_attr']; 
	                        unset($current[$tag.'_attr']); 
	                    } 
	
	                } 
	                $last_item_index = $repeated_tag_index[$tag.'_'.$level]-1; 
	                $current = &$current[$tag][$last_item_index]; 
	            } 
	
	        } elseif($type == "complete") { //Tags that ends in 1 line '<tag />' 
	            //See if the key is already taken. 
	            if(!isset($current[$tag])) { //New Key 
	                $current[$tag] = $result; 
	                $repeated_tag_index[$tag.'_'.$level] = 1; 
	                if($priority == 'tag' and $attributes_data) $current[$tag. '_attr'] = $attributes_data; 
	
	            } else { //If taken, put all things inside a list(array) 
	                if(isset($current[$tag][0]) and is_array($current[$tag])) {//If it is already an array... 
	
	                    // ...push the new element into that array. 
	                    $current[$tag][$repeated_tag_index[$tag.'_'.$level]] = $result; 
	                     
	                    if($priority == 'tag' and $get_attributes and $attributes_data) { 
	                        $current[$tag][$repeated_tag_index[$tag.'_'.$level] . '_attr'] = $attributes_data; 
	                    } 
	                    $repeated_tag_index[$tag.'_'.$level]++; 
	
	                } else { //If it is not an array... 
	                    $current[$tag] = array($current[$tag],$result); //...Make it an array using using the existing value and the new value
	                    $repeated_tag_index[$tag.'_'.$level] = 1; 
	                    if($priority == 'tag' and $get_attributes) { 
	                        if(isset($current[$tag.'_attr'])) { //The attribute of the last(0th) tag must be moved as well
	                             
	                            $current[$tag]['0_attr'] = $current[$tag.'_attr']; 
	                            unset($current[$tag.'_attr']); 
	                        } 
	                         
	                        if($attributes_data) { 
	                            $current[$tag][$repeated_tag_index[$tag.'_'.$level] . '_attr'] = $attributes_data; 
	                        } 
	                    } 
	                    $repeated_tag_index[$tag.'_'.$level]++; //0 and 1 index is already taken 
	                } 
	            } 
	
	        } elseif($type == 'close') { //End of tag '</tag>' 
	            $current = &$parent[$level-1]; 
	        } 
	    } 
	     
	    return($xml_array); 
	} 
	

}	