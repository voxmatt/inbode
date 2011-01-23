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
	
		// get the location we're searching around
		$location = $this->uri->segment(3, $this->config->item('i_location'));		
		// really need to get the bounds of the viewport as well. if none are specified, then use a radius instead
		$box = $this->uri->segment(4, 0);
		
		// geocode the location
		$latlng = $this->inbode->geocode($location);
		
		// if there is no viewport, search by radius around location: get that number from the config file
		if (!$box) {
			$searchuri = $this->config->item('i_searchuri') . '&lat=' . $latlng['lat'] . '&lng=' . $latlng['lng'] . '&radius=' . $this->config->item('i_radius') ;
		} else {
			$searchuri = $this->config->item('i_searchuri') . '&box=' . $box;
		}

		// now do the spatial search using the google map
		$h = array('Authorization: AuthSub token="'.$this->config->item('i_token').'"');
		// the response, search results around the latlng or using a bounding box!
		$r = $this->inbode->request($searchuri, 'GET', NULL, $h);

		$a = $this->inbode->xml2array($r['response'], 0);
		if (isset($a['atom:feed']['atom:entry'])) {
			$es = $a['atom:feed']['atom:entry'];			
		}
		
		$results = $a['atom:feed']['openSearch:totalResults'];
		
		// if there are results, do the magic
		if ($results>0) {
		
			// extract these things
			$coords = array();
	
			// look for the special case of only one location (thanks array)
			if (isset($es['atom:id'])) {
				// single entry
				$murl = $es['atom:id'];
				$featureid = substr($murl, strpos($murl, '/'. $mapid .'/')+23, 21);
				$coords[$featureid] = $es['atom:content']['Placemark']['Point']['coordinates'];
			} else {
				// more than one entry
				foreach($es as $e) {
					// get all locations
					// get the feature id from the map url so we can look it up in the db
					$murl = $e['atom:id'];
					$featureid = substr($murl, strpos($murl, '/'. $mapid .'/')+23, 21);
					$coords[$featureid] = $e['atom:content']['Placemark']['Point']['coordinates'];
				}
			}
	
			// string of features for the db query
			$instr = '';
			foreach($coords as $k=>$v) {
				$instr .= '\''.$k.'\',';
			}
			$instr = trim($instr, ',');

	    $sql = 'SELECT n.nid, n.title AS building_name, l.street, l.additional, l.city, l.province, l.postal_code, UPPER(l.country) AS country, u.field_unit_bedroom_value as beds, u.field_unit_bathroom_value AS baths, u.field_unit_price_amount AS price, u.field_unit_price_currency AS currency, u.field_unit_area_value AS area, u.field_unit_available_value AS available, u.field_unit_description_value AS description, u.field_featureid_value AS featureid FROM content_type_unit u, location_instance li, location l, node n WHERE u.field_unit_building_nid=li.nid AND li.lid=l.lid AND u.field_unit_building_nid=n.nid  AND u.field_unit_status_value="listed" AND u.field_featureid_value IN ('. $instr .') ;';
			$query = $this->db->query( $sql );			
			$results = array();
			foreach ($query->result_array() as $row) {
				$results[$row['featureid']] = $row;
			}

			
			// get any images from the same set of feature ids
			$imagesql = 'SELECT u.field_featureid_value as featureid, f.filepath, i.nid, i.field_unit_images_fid, i.field_unit_images_data FROM content_field_unit_images i, files f, content_type_unit u WHERE u.nid=i.nid AND f.fid=i.field_unit_images_fid AND i.nid AND i.field_unit_images_fid IS NOT NULL AND u.field_featureid_value IN ('. $instr .') ORDER BY i.nid, i.delta';
			$imagequery = $this->db->query( $imagesql );			
			$imageresults = array();
			foreach ($imagequery->result_array() as $imagerow) {
				$imageresults[$imagerow['featureid']][] = $this->config->item('i_imgserver') . $imagerow['filepath'];
			}
			
			
			$items = array();
			foreach($coords as $fid=>$coo) {
				// lat lng is a bit messed up because we keep going between V3 and Data APIs
				if (isset($results[$fid]['featureid'])) {
					if ($fid==$results[$fid]['featureid']) {
						$ll=explode(',',$coo);
						unset($f);
						$f = array();
						$f['featureid'] = $fid;
						$f['lat'] = $ll[1];
						$f['lng'] = $ll[0];
						$f['nid'] = $results[$fid]['nid'];
						$f['building_name'] = $results[$fid]['building_name'];
						$f['street'] = $results[$fid]['street'];
						$f['additional'] = $results[$fid]['additional'];
						$f['city'] = $results[$fid]['city'];
						$f['province'] = $results[$fid]['province'];
						$f['postal_code'] = $results[$fid]['postal_code'];
						$f['country'] = $results[$fid]['country'];
						$f['beds'] = $results[$fid]['beds'];
						$f['baths'] = $results[$fid]['baths'];
						$f['price'] = (int) $results[$fid]['price'];
						$f['currency'] = $results[$fid]['currency'];
						$f['area'] = $results[$fid]['area'];
						$f['available'] = date( 'n/j/y', strtotime($results[$fid]['available']) );
						$f['description'] = $results[$fid]['description'];
						if (isset($imageresults[$fid])) {
							$f['images'] = $imageresults[$fid];						
						}
						$items[]=$f;
					}
				}
			};
			
			

		} else {
			
			// no results, return empty
			$items=array();
		
		}
		
		
		$return = array('status'=>'ok', 'location'=>$location, 'latlng'=>$latlng, 'items'=>$items);		
		$this->response($return, 200);
	
	}	
	
}