<?php 

	//print_r($node->field_unit_images);
	$bd = node_load($node->field_unit_building[0]['nid'], NULL, TRUE);	
	//print_r($bd->field_building_images);
	$faveid = 'fave_'.$bd->nid."_".$node->nid;	
	
	$lat = $bd->field_building_address[0]['latitude'];
	$lng = $bd->field_building_address[0]['longitude'];
	
	
?><!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language; ?>" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>">
 	<head>
		<meta name="author" content="Inbode Inc." />
		<title><?php print $head_title; ?></title>

		<link type="text/css" href="/sites/all/themes/inbode/morestyles.css" rel="stylesheet" />	
		<link type="text/css" href="/ui/css/unit.css" rel="stylesheet" />	
		
		<script type="text/javascript" src="/ui/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="/ui/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="/ui/js/jquery.jcarousel.js"></script>
		<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script> 

		<script>

			var cookieexpiration = 365;

			$(document).ready(function() {

			    $('.t7_swapout:first').show();
			    $('t7-thumb-image:first').addClass('thumb-selected');
			
			    $('.t7-thumb-image').click(function() {
			        $('.t7-thumb-image:first, .t7-thumb-image').parent().removeClass('thumb-selected');
			        $(this).parent().addClass('thumb-selected');
			
			        var w = $(this).attr('id');
			        var f = w.split('-');
			        $('.t7_swapout').hide();
			        $('#t7-item-' + f[2]).show();

			        if (f[2]==2) {

								// street view
						    var sv = new google.maps.LatLng(<?php print $lat; ?>,<?php print $lng; ?>);
						    var panoramaOptions = {
						      position: sv,
							    addressControl: false			
						    };
						    var panorama = new  google.maps.StreetViewPanorama(document.getElementById("pano"),panoramaOptions);
			        
			        }
			        
			        
			    })
			
			    $('.t7-thumb-image').hover(function() {
			        $(this).css('cursor', 'pointer');
			    }, function() {
			        $(this).css('cursor', 'default');
			    })
			
			    $("#mycarousel").jcarousel({
			        scroll: 1
			    });
			    
					var h = document.location.hash.replace('#', '');
					
					if (h) {
						$('#mycarousel li').removeClass('thumb-selected');
						$('#t7-thumb-'+h).parent().addClass('thumb-selected');
						$('#t7-thumb-'+h).click();
					}
					
          if ($.cookie('faves').search('<?php echo $faveid; ?>') > 0) {
          
          	$('#favestar').attr('src', '/sites/all/themes/inbode/images/unit/yellow_star.png');
          
          }


			    
          
								
			});


			inbode = {};
			
			inbode.util = {
			
				getlink: function() {
				
	        $('#gl').toggle();
	        $('#glin').toggle();
	        $('#glin input').select();
	
				}
			
			}
			
			inbode.favorite = {
			
			  starclick: function(id) {
			  
			    if ($('#favestar').attr('src') === '/sites/all/themes/inbode/images/unit/grey_star.png') {
			
			        // now a fave :)
			        $('#favestar').attr('src', '/sites/all/themes/inbode/images/unit/yellow_star.png');
			        if ($.cookie('faves')) {
			            $.cookie('faves', $.cookie('faves') + '|' + id, {
			                expires: cookieexpiration,
			                path: '/'
			            });
			        } else {
			            $.cookie('faves', '|' + id, {
			                expires: cookieexpiration,
			                path: '/'
			            });
			        }
			        
			
			    } else {
			        // no longer a fave :(
			        $('#favestar').attr('src', '/sites/all/themes/inbode/images/unit/grey_star.png');
			        $.cookie('faves', $.cookie('faves').replace('|' + id, ''), {
	              expires: cookieexpiration,
	              path: '/'
			        });
			    }
			
			  }
			
			};





		</script>
		



	</head>
	<body>

		<div id="t7_white_box">
		
			<!-- container for image swap out  -->
			
			<div id="t7_swapout_contain">
			
				<div id="t7_swapout_header">
					
					<div id="t7_swapout_header_right">
						
						<div class="contact">
							<a href="mailto:<?php print $node->field_unit_email[0]['value']; ?>?subject=inbode:&cc=activity@inbode.com"><h3>contact manager</h3></a>
						</div><!-- .contact end -->


						<div class="t7_fav_share" style="font-size:13px;font-family:Helvetica Neue;">
							<a onClick="inbode.favorite.starclick('<?php echo $faveid; ?>');" href="#"><img id="favestar" src="/sites/all/themes/inbode/images/unit/grey_star.png" border="0" /></a>&nbsp;<a onClick="inbode.favorite.starclick('<?php echo $faveid; ?>');" href="#">favorite</a> &nbsp;
							<a href="#" onClick="inbode.util.getlink();" id="gl">get link</a><span  style="display:none;" id="glin"><input class="getlink" type="text" value="<?php 
								global $base_url;
								echo $base_url."/home#".$node->nid ; ?>" />
							<a href="#" onClick="inbode.util.getlink();">x</a></span>
						</div>

					</div>
					
					<div id="t7_swapout_header_left">
						<h1><?php print $title; ?>&nbsp;&ndash;&nbsp;$<?php print intval($node->field_unit_price[0]['amount']); ?>&nbsp;<?php 
								
								if ($node->field_unit_bedroom[0]['value']==0) {
									print "studio";
								} else {
									print $node->field_unit_bedroom[0]['value']."bed";
								}
								 ?>&nbsp;<?php print $node->field_unit_bathroom[0]['value']; ?>bath</h1>
					</div>
				
				</div>
				
				<div id="t7-item-1" class="t7_swapout">
				
					<div id="t7_price">
					

						
					</div><!-- #t7_price end -->
					
					<div id="t7_address">
						<ul>
							<li><?php print $bd->field_building_address[0]['street']; ?></li>
							<li>
								available <?php print strtolower( date( 'F j, Y' , strtotime($node->field_unit_available[0]['value'])) ); ?>
							</li>
							
							<li><?php print $node->field_unit_area[0]['value']; ?> square feet</li>
						</ul>
					</div><!-- #t7_address end -->	
					
					<table>
						<tr>
							<td>
								<h2>unit info:</h2>
							</td>					
							<td>
<?php

	if (isset($node->field_unit_amenities[0]['value'])) {
		print "<ul>";
		foreach($node->field_unit_amenities as $am) {
			print '<li>'.$am['value'].'</li>';
		}
		print "</ul>";
	}


?>
							</td>
							<td>
							
								<p><?php print str_ireplace("\n", "<br>", $node->field_unit_description[0]['value']); ?></p>
								
							</td>				
						</tr>
						<tr><td height="20"></td></tr>
						<tr>
							<td>
								<h2>bldg info:</h2>
							</td>					
							<td>

<?php

	if (isset($bd->field_building_amenities[0]['value'])) {
		print "<ul>";
		foreach($bd->field_building_amenities as $am) {
			print '<li>'.$am['value'];
			if ( !(stripos($am['value'], 'cat')===false) || !(stripos($am['value'], 'dog')===false)  ) {
				print '&nbsp;OK';
			}
			print '</li>';
		}
		print "</ul>";
	}


?>							</td>
							<td>
								<p><?php print str_ireplace("\n", "<br>", $bd->field_building_description[0]['value']); ?></p>
							</td>
						</tr>
					</table>
				</div><!-- .t7_swapout END -->

<?php

	print '<div id="t7-item-2" class="t7_swapout"><div id="pano" style="width: 700px; height: 440px;"></div></div>';


	$ii=3;

	foreach ($node->field_unit_images as $im) {
		if ( isset($im['filepath'])) {

			$cim = str_ireplace("sites/default/files", "sites/default/files/imagecache/lightbox_full", $im['filepath']);
			
			if ($im['data']['height']>440) {
				print '<div id="t7-item-'.$ii.'" class="t7_swapout"><img src="/'.$cim.'" height="440" /></div>';			
			} else {
				print '<div id="t7-item-'.$ii.'" class="t7_swapout"><img src="/'.$cim.'" /></div>';
			}
			
			$ii++;
		}
	}
	
	if (isset($bd->field_building_images[0]['filepath'])) {
		foreach ($bd->field_building_images as $im) {
			if ( isset($im['filepath'])) {
				
				$cim = str_ireplace("sites/default/files", "sites/default/files/imagecache/lightbox_full", $im['filepath']);

				if ($im['data']['height']>440) {
					print '<div id="t7-item-'.$ii.'" class="t7_swapout"><img src="/'.$cim.'" height="440" /></div>';			
				} else {
					print '<div id="t7-item-'.$ii.'" class="t7_swapout"><img src="/'.$cim.'" /></div>';
				}
				
				$ii++;
			}
		}
	}
	
	
?>

				
				
			</div><!-- .t7_swapout_contain END -->

			<div id="mycarousel" class="jcarousel-skin-tango">
			    <ul class="images">
					<li class="thumb-selected"><img id="t7-thumb-1" class="t7-thumb-image" src="/sites/all/themes/inbode/images/unit/unit_details.png" /></li>
					<li><img id="t7-thumb-2" class="t7-thumb-image" src="/sites/all/themes/inbode/images/unit/streetview.png" /></li>

<?php

	$ii=3;

	foreach ($node->field_unit_images as $im) {
		if ( isset($im['filepath'])) {
			$ctim = str_ireplace("sites/default/files", "sites/default/files/imagecache/lightbox_thumbnail", $im['filepath']);
			print '<li><img id="t7-thumb-'.$ii.'" class="t7-thumb-image" src="/'.$ctim.'" /></li>';
			$ii++;
		}
	}

	if (isset($bd->field_building_images[0]['filepath'])) {
		foreach ($bd->field_building_images as $im) {
			if ( isset($im['filepath']) ) {
				$ctim = str_ireplace("sites/default/files", "sites/default/files/imagecache/lightbox_thumbnail", $im['filepath']);
				print '<li><img height="62" id="t7-thumb-'.$ii.'" class="t7-thumb-image" src="/'.$ctim.'" /></li>';
				$ii++;
			}
		}
	}
	
	
?>

			    </ul>
				<div class="jcarousel-prev jcarousel-prev-horizontal" style="display: block;" disabled="false"></div>
				<div class="jcarousel-next jcarousel-next-horizontal" style="display: block;" disabled="false"></div>
			</div><!-- #mycarousel END -->			
		
		</div><!-- #t7_white_box END -->

</body>
</html>