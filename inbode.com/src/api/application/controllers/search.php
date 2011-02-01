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
		

	function location_get() {
	
		// libs and help
		$this->load->database();
		$this->load->library('inbode');
	
		// some vars
		$mapid = $this->config->item('i_mid');
		$tableid = $this->config->item('i_InbodeBeta-BuildingsUnits');
		$records = 0;
	
		// get the location we're searching around
		$location = $this->uri->segment(3, $this->config->item('i_location'));		
		// really need to get the bounds of the viewport as well. if none are specified, then use a radius instead
		$box = $this->uri->segment(4, 0);
		
		// geocode the location
		// really should have some sort of caching here for locations that have already been geocoded
		$latlng = $this->inbode->geocode($location);

		// we used to do a spatial search on google maps using the google maps data api
		// we are now better and smarter and use google fusion tables. yay us.
		// fusion table with buildings and units is 417990
		//$q = 'SELECT * FROM '.$tableid.' WHERE ST_INTERSECTS(\'latlng\', CIRCLE( LATLNG('.$latlng['lat'].','.$latlng['lng'].'), 80000) )';
		$q = "SELECT * FROM $tableid WHERE 'status'='listed'" ;
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
				$f['building_id'] = $result['building_id'];
				$f['building_name'] = $result['building_name'];
				$f['building_description'] = $result['building_description'];
				$f['street'] = $result['street'];
				$f['additional'] = $result['street2'];
				$f['city'] = $result['city'];
				$f['province'] = $result['province'];
				$f['postal_code'] = $result['postal_code'];
				$f['country'] = $result['country'];
				$f['building_am_cats'] = $result['building_am_cats'];
				$f['building_am_dogs_small'] = $result['building_am_dogs_small'];
				$f['building_am_dogs_large'] = $result['building_am_dogs_large'];
				$f['building_am_pool'] = $result['building_am_pool'];
				
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
				$f['nid'] = $result['building_id']."_".$result['unit_id'];
				$f['beds'] = $result['bedrooms'];
				$f['baths'] = $result['bathrooms'];
				$f['price'] = (int) $result['price'];
				$f['currency'] = $result['currency'];
				$f['area'] = $result['area'];
				if ($result['available_date']) {
					$f['available'] = date( 'n/j/y', strtotime($result['available_date']) );			
				} else {
					$f['available'] = 0;							
				}
				$f['unit_id'] = $result['unit_id'];
				$f['unit_name'] = $result['unit_name'];
				$f['unit_description'] = $result['unit_description'];
				$f['unit_am_laundry'] = $result['unit_am_laundry'];
				$f['unit_am_dishwasher'] = $result['unit_am_dishwasher'];
				$f['unit_am_disposal'] = $result['unit_am_disposal'];
				$f['unit_am_balcony'] = $result['unit_am_balcony'];
				$f['unit_am_furnished'] = $result['unit_am_furnished'];
				$f['unit_am_garage'] = $result['unit_am_garage'];
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
		
		// return some results, empty even		
		$return = array('status'=>'ok', 'location'=>$location, 'latlng'=>$latlng, 'count'=>$records, 'items'=>$items);		
		$this->response($return, 200);
	
	}	
	
}