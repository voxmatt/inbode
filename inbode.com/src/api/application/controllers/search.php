<?php

require(APPPATH.'/libraries/REST_Controller.php');

class Search extends REST_Controller
{



	function index()
	{

		$ret=array( "Error" => "Can't touch this." );
		$this->response($ret, 200);
	
	}
	


	function index_get()
	{

		$ret = array( "Data" => $_GET );
		$this->response($ret, 200);
	
	}	
		

	function bounds_get() {
	
		// libs and help
		$this->load->database();
		$this->load->library('inbode');
	
		// some vars
		$mapid = $this->config->item('i_mid');
		$tableid = $this->config->item('i_InbodeBeta-BuildingsUnits');
	
		// bounds
		$bounds = $this->uri->segment(3);		

		if ($bounds) {

			$bounds = str_ireplace("(", "", $bounds);
			$bounds = str_ireplace("&#40;", "", $bounds);			
			$bounds = str_ireplace(")", "", $bounds);
			$bounds = str_ireplace("&#41;", "", $bounds);
			$bounds = str_ireplace(" ", "", $bounds);
			$ll=explode(",", $bounds);

			if ( is_numeric($ll[0]) &&
						is_numeric($ll[1]) &&
						is_numeric($ll[2]) &&
						is_numeric($ll[3]) ) {
						
				
				// we do a spatial search in fusion tables given only the bounds of the map
				// useful when a user pans or zooms
				// SELECT * FROM 297050 WHERE ST_INTERSECTS(Address, RECTANGLE(LATLNG(37.2, -122.3), LATLNG(37.6, -121.9)))		
				$q = "SELECT * FROM $tableid WHERE ST_INTERSECTS('latlng', RECTANGLE( LATLNG($ll[0], $ll[1]), LATLNG($ll[2], $ll[3]) ) )";
				$fusionresult = $this->inbode->fusionquery($q);		
				
				$processed = $this->process_fusionresult($fusionresult);
				
				// return some results, empty even		
				$return = array('status'=>'ok', 'location'=>'', 'latlng'=>'', 'count'=>$processed['records'], 'items'=>$processed['items']);		
				$this->response($return, 200);
			
			}
	
		
		}

	
	}	
	
		

	function location_get() {
	
		// libs and help
		$this->load->database();
		$this->load->library('inbode');
	
		// some vars
		$mapid = $this->config->item('i_mid');
		$tableid = $this->config->item('i_InbodeBeta-BuildingsUnits');
	
		// get the location we're searching around
		$location = $this->uri->segment(3, $this->config->item('i_location'));		
		// really need to get the bounds of the viewport as well. if none are specified, then use a radius instead
		$box = $this->uri->segment(4, 0);
		
		// geocode the location
		$latlng = $this->inbode->geocode($location);
		
		if ($latlng['status']=='OVER_QUERY_LIMIT') {
			// minneapolis!
			$latlng['lat'] = 44.979965;
			$latlng['lng'] = -93.263836;
			$location = "(Minneapolis, MN)";
		}
		
		// we used to do a spatial search on google maps using the google maps data api
		// we are now better and smarter and use google fusion tables. yay us.
		//$q = 'SELECT * FROM '.$tableid.' WHERE ST_INTERSECTS(\'latlng\', CIRCLE( LATLNG('.$latlng['lat'].','.$latlng['lng'].'), 80000) )';
		$q = "SELECT * FROM $tableid WHERE 'status'='listed'" ;
		$fusionresult = $this->inbode->fusionquery($q);		
		
		$processed = $this->process_fusionresult($fusionresult);
		
		// return some results, empty even		
		$return = array('status'=>'ok', 'location'=>$location, 'latlng'=>$latlng, 'count'=>$processed['records'], 'items'=>$processed['items']);		
		$this->response($return, 200);
	
	}		

	function process_fusionresult($fusionresult) {
	
		if ( isset($fusionresult['count'])) {
	 		$records = $fusionresult['count'];	
		} else {
			$records = 0;
		}

		$results = array();
		
		if ($fusionresult['info']['http_code']==200 && $fusionresult['info']['content_type']=='text/plain; charset=UTF-8' && $records>0 && isset($fusionresult['column_data'])) {
			// got back some sort of result
			$results = $fusionresult['column_data'];
		}
		
		$items = array();

		// if there are results, return them 
		if ($records>0 && isset($results)) {
		
			// loop thru all results from fusion tables
			foreach($results as $result) {
				unset($f);
				$f = array();
				// building specific
				$ll=explode(',',$result['latlng']);
				$f['lat'] = $ll[0];
				$f['lng'] = $ll[1];
				$f['building_id'] = intval($result['building_id']);
				$f['building_name'] = $result['building_name'];
				$f['building_description'] = $result['building_description'];
				$f['street'] = $result['street'];
				$f['additional'] = $result['street2'];
				$f['city'] = $result['city'];
				$f['province'] = $result['province'];
				$f['postal_code'] = intval($result['postal_code']);
				$f['country'] = $result['country'];
				$f['building_am_cats'] = intval($result['building_am_cats']);
				$f['building_am_dogs_small'] = intval($result['building_am_dogs_small']);
				$f['building_am_dogs_large'] = intval($result['building_am_dogs_large']);
				$f['building_am_pool'] = intval($result['building_am_pool']);
				
				// building images some day too
				$f['building_image_1'] = $result['building_image_1'];
				if (substr($f['building_image_1'], 0, 1)!="/" && $result['building_image_1']) { $f['building_image_1']="/".$f['building_image_1'];}; 
				
				$f['building_image_2'] = $result['building_image_2'];
				if (substr($f['building_image_2'], 0, 1)!="/" && $result['building_image_2']) { $f['building_image_2']="/".$f['building_image_2'];}; 
				
				$f['building_image_3'] = $result['building_image_3'];
				if (substr($f['building_image_3'], 0, 1)!="/" && $result['building_image_3']) { $f['building_image_3']="/".$f['building_image_3'];}; 
				
				$f['building_image_4'] = $result['building_image_4'];
				if (substr($f['building_image_4'], 0, 1)!="/" && $result['building_image_4']) { $f['building_image_4']="/".$f['building_image_4'];}; 

				// unit specific				
				$f['featureid'] = md5(intval($result['building_id'])."_".intval($result['unit_id']));
				$f['nid'] = intval($result['building_id'])."_".intval($result['unit_id']);
				$f['beds'] = intval($result['bedrooms']);
				$f['baths'] = intval($result['bathrooms']);
				$f['price'] = intval($result['price']);
				$f['currency'] = $result['currency'];
				$f['area'] = intval($result['area']);
				if ($result['available_date']) {
					$f['available'] = date( 'n/j/y', strtotime($result['available_date']) );			
				} else {
					$f['available'] = 0;							
				}
				$f['available_ts'] = time($result['available_date']);
				$f['unit_id'] = intval($result['unit_id']);
				$f['unit_name'] = $result['unit_name'];
				$f['unit_description'] = $result['unit_description'];
				$f['unit_am_laundry'] = intval($result['unit_am_laundry']);
				$f['unit_am_dishwasher'] = intval($result['unit_am_dishwasher']);
				$f['unit_am_disposal'] = intval($result['unit_am_disposal']);
				$f['unit_am_balcony'] = intval($result['unit_am_balcony']);
				$f['unit_am_furnished'] = intval($result['unit_am_furnished']);
				$f['unit_am_garage'] = intval($result['unit_am_garage']);
				$f['status'] = $result['status'];
				
				// unit images
				$f['unit_image_1'] = $result['unit_image_1'];
				if (substr($f['unit_image_1'], 0, 1)!="/" && $result['unit_image_1']) { $f['unit_image_1']="/".$f['unit_image_1'];}; 

				$f['unit_image_2'] = $result['unit_image_2'];
				if (substr($f['unit_image_2'], 0, 1)!="/" && $result['unit_image_2']) { $f['unit_image_2']="/".$f['unit_image_2'];}; 

				$f['unit_image_3'] = $result['unit_image_3'];
				if (substr($f['unit_image_3'], 0, 1)!="/" && $result['unit_image_3']) { $f['unit_image_3']="/".$f['unit_image_3'];}; 

				$f['unit_image_4'] = $result['unit_image_4'];
				if (substr($f['unit_image_4'], 0, 1)!="/" && $result['unit_image_4']) { $f['unit_image_4']="/".$f['unit_image_4'];}; 

				$f['unit_image_5'] = $result['unit_image_5'];
				if (substr($f['unit_image_5'], 0, 1)!="/" && $result['unit_image_5']) { $f['unit_image_5']="/".$f['unit_image_5'];}; 

				$f['unit_image_6'] = $result['unit_image_6'];
				if (substr($f['unit_image_6'], 0, 1)!="/" && $result['unit_image_6']) { $f['unit_image_6']="/".$f['unit_image_6'];}; 

				$f['unit_image_7'] = $result['unit_image_7'];
				if (substr($f['unit_image_7'], 0, 1)!="/" && $result['unit_image_7']) { $f['unit_image_1']="/".$f['unit_image_7'];}; 

				$f['unit_image_8'] = $result['unit_image_8'];
				if (substr($f['unit_image_8'], 0, 1)!="/" && $result['unit_image_8']) { $f['unit_image_1']="/".$f['unit_image_8'];}; 

				// backwards compatible
				$f['description'] = $result['unit_description'];


				$items[]=$f;

			}

		}	
		
		$processed=array();
		$processed['records']=$records;
		$processed['items']=$items;
		
		return $processed;
	
	}

	function unit_get() {
	
		// libs and help
		$this->load->database();
		$this->load->library('inbode');
	
		// some vars
		$mapid = $this->config->item('i_mid');
		$tableid = $this->config->item('i_InbodeBeta-BuildingsUnits');
		$records = 0;
	
		// get the unit id
		$unit_id = $this->uri->segment(3, 0);		

		// google fusion, please may we have some detail?
		$q = "SELECT * FROM $tableid WHERE 'unit_id'='$unit_id'" ;
		$fusionresult = $this->inbode->fusionquery($q);		
		
		if ( isset($fusionresult['count'])) {
	 		$records = $fusionresult['count'];	
		} 

		$results = array();
		
		if ($fusionresult['info']['http_code']==200 && $fusionresult['info']['content_type']=='text/plain; charset=UTF-8' && $records>0 && isset($fusionresult['column_data'])) {
			// got back some sort of result
			$results = $fusionresult['column_data'];
		}
		
		$items = array();

		// if there are results, return them 
		if ($records>0 && isset($results)) {
		
			// loop thru all results from fusion tables
			foreach($results as $result) {
				unset($f);
				$f = array();
				// building specific
				$ll=explode(',',$result['latlng']);
				$f['lat'] = $ll[0];
				$f['lng'] = $ll[1];
				$f['building_id'] = intval($result['building_id']);
				$f['building_name'] = $result['building_name'];
				$f['building_description'] = $result['building_description'];
				$f['street'] = $result['street'];
				$f['additional'] = $result['street2'];
				$f['city'] = $result['city'];
				$f['province'] = $result['province'];
				$f['postal_code'] = intval($result['postal_code']);
				$f['country'] = $result['country'];
				$f['building_am_cats'] = intval($result['building_am_cats']);
				$f['building_am_dogs_small'] = intval($result['building_am_dogs_small']);
				$f['building_am_dogs_large'] = intval($result['building_am_dogs_large']);
				$f['building_am_pool'] = intval($result['building_am_pool']);
				
				// building images some day too
				$f['building_image_1'] = $result['building_image_1'];
				if (substr($f['building_image_1'], 0, 1)!="/" && $result['building_image_1']) { $f['building_image_1']="/".$f['building_image_1'];}; 
				
				$f['building_image_2'] = $result['building_image_2'];
				if (substr($f['building_image_2'], 0, 1)!="/" && $result['building_image_2']) { $f['building_image_2']="/".$f['building_image_2'];}; 
				
				$f['building_image_3'] = $result['building_image_3'];
				if (substr($f['building_image_3'], 0, 1)!="/" && $result['building_image_3']) { $f['building_image_3']="/".$f['building_image_3'];}; 
				
				$f['building_image_4'] = $result['building_image_4'];
				if (substr($f['building_image_4'], 0, 1)!="/" && $result['building_image_4']) { $f['building_image_4']="/".$f['building_image_4'];}; 

				// unit specific				
				$f['featureid'] = md5($result['building_id']."_".$result['unit_id']);
				$f['nid'] = intval($result['building_id'])."_".intval($result['unit_id']);
				$f['beds'] = intval($result['bedrooms']);
				$f['baths'] = intval($result['bathrooms']);
				$f['price'] = intval($result['price']);
				$f['currency'] = $result['currency'];
				$f['area'] = intval($result['area']);
				if ($result['available_date']) {
					$f['available'] = date( 'n/j/y', strtotime($result['available_date']) );			
				} else {
					$f['available'] = 0;							
				}
				$f['unit_id'] = intval($result['unit_id']);
				$f['unit_name'] = $result['unit_name'];
				$f['unit_description'] = $result['unit_description'];
				$f['unit_am_laundry'] = intval($result['unit_am_laundry']);
				$f['unit_am_dishwasher'] = intval($result['unit_am_dishwasher']);
				$f['unit_am_disposal'] = intval($result['unit_am_disposal']);
				$f['unit_am_balcony'] = intval($result['unit_am_balcony']);
				$f['unit_am_furnished'] = intval($result['unit_am_furnished']);
				$f['unit_am_garage'] = intval($result['unit_am_garage']);
				$f['status'] = $result['status'];
				
				// unit images
				$f['unit_image_1'] = $result['unit_image_1'];
				if (substr($f['unit_image_1'], 0, 1)!="/" && $result['unit_image_1']) { $f['unit_image_1']="/".$f['unit_image_1'];}; 

				$f['unit_image_2'] = $result['unit_image_2'];
				if (substr($f['unit_image_2'], 0, 1)!="/" && $result['unit_image_2']) { $f['unit_image_2']="/".$f['unit_image_2'];}; 

				$f['unit_image_3'] = $result['unit_image_3'];
				if (substr($f['unit_image_3'], 0, 1)!="/" && $result['unit_image_3']) { $f['unit_image_3']="/".$f['unit_image_3'];}; 

				$f['unit_image_4'] = $result['unit_image_4'];
				if (substr($f['unit_image_4'], 0, 1)!="/" && $result['unit_image_4']) { $f['unit_image_4']="/".$f['unit_image_4'];}; 

				$f['unit_image_5'] = $result['unit_image_5'];
				if (substr($f['unit_image_5'], 0, 1)!="/" && $result['unit_image_5']) { $f['unit_image_5']="/".$f['unit_image_5'];}; 

				$f['unit_image_6'] = $result['unit_image_6'];
				if (substr($f['unit_image_6'], 0, 1)!="/" && $result['unit_image_6']) { $f['unit_image_6']="/".$f['unit_image_6'];}; 

				$f['unit_image_7'] = $result['unit_image_7'];
				if (substr($f['unit_image_7'], 0, 1)!="/" && $result['unit_image_7']) { $f['unit_image_1']="/".$f['unit_image_7'];}; 

				$f['unit_image_8'] = $result['unit_image_8'];
				if (substr($f['unit_image_8'], 0, 1)!="/" && $result['unit_image_8']) { $f['unit_image_1']="/".$f['unit_image_8'];}; 

				// backwards compatible
				$f['description'] = $result['unit_description'];

				$location = $f['city'].", ".$f['province'];
				$latlng = $result['latlng'];

				$items[]=$f;

			}

		}

		
		// return some results, empty even		
		if ($records) {
			$return = array('status'=>'ok', 'location'=>$location, 'latlng'=>$latlng, 'count'=>$records, 'items'=>$items);					
		} else {
			$return = array('status'=>'ok', 'location'=>null, 'latlng'=>null, 'count'=>0, 'items'=>null);		
		
		}
		$this->response($return, 200);
	
	}	
	
}