<?php

class Image extends Controller {

	function logo($unit=NULL) {

		// this function generates the inbode logo as a png,
		// and it also records the unique unit number hit if it exists


		if ( is_numeric($unit) ) {


					$this->load->database();
					$getquery = $this->db->get_where('content_type_unit', array('nid' => $unit));
					$r = $getquery->result_array();
		
					
					if (isset($r[0]['field_unit_craigslist_views_value'])) {
						$views = intval($r[0]['field_unit_craigslist_views_value'])+1;
						$data = array(
						               'field_unit_craigslist_views_value' => $views
						            );
						$this->db->where('nid', $unit);
						$this->db->update('content_type_unit', $data); 
					}	

		}
	
		$name = $this->config->item('i_syspath').'/inbode.png';
		$fp = fopen($name, 'rb');
		
		// send the right headers
		header("Content-Type: image/png");
		header("Content-Length: " . filesize($name));
		
		// dump the picture and stop the script
		fpassthru($fp);
		exit;
	
	}

}


