<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language; ?>" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>">
 	<head>
		<meta name="author" content="Inbode Inc." />
		<title><?php print $head_title; ?></title>

		<link type="text/css" href="/ui/css/unit.css" rel="stylesheet" />	
		<script type="text/javascript" src="/ui/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="/ui/js/jquery.jcarousel.js"></script>



		<script>

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
			
			});

		</script>
		



	</head>
<body>

		<div id="t7_white_box">
		
		<?php
		
		
			$bd = node_load($node->field_unit_building[0]['nid'], NULL, TRUE);
		
		?>
		
			<!-- 
				container for image swap out 
											 -->
			<div id="t7_swapout_contain">
			
				<div id="t7-item-1" class="t7_swapout">
					<div id="t7_price">
						<h1>$<?php print intval($node->field_unit_price[0]['amount']); ?>&nbsp;<?php print $node->field_unit_bedroom[0]['value']; ?>bed&nbsp;<?php print $node->field_unit_bathroom[0]['value']; ?>bath</h1>
						<div class="contact">
							<a href="#"><img border="0" src="/sites/all/themes/inbode/images/unit/button.jpg" /></a>
						</div><!-- .contact end -->
						<div class="t7_fav_share" style="font-size:13px;font-family:Helvetica Neue;">
							<img src="/sites/all/themes/inbode/images/unit/grey_star.png" border="0" />&nbsp;<a class="t7_fav_link" href="#">favorite</a> &nbsp;<a href="#">get link</a></div>
					</div><!-- #t7_price end -->
					<div id="t7_address">
						<h1><?php print $title; ?></h1>
						<ul>
							<li><?php print $bd->field_building_address[0]['street']; ?></li>
							<li>available <?php print strtolower( date( 'F j, Y' , strtotime($node->field_unit_available[0]['value'])) ); ?></li>
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
							
								<p><?php str_ireplace("\n", "<br>", $bd->field_unit_description[0]['value']); ?></p>
								
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

	$ii=2;

	foreach ($node->field_unit_images as $im) {
		if ( isset($im['filepath'])) {
			print '<div id="t7-item-'.$ii.'" class="t7_swapout"><img src="/'.$im['filepath'].'" /></div>';
			$ii++;
		}
	}

	foreach ($node->field_unit_more_images as $im) {
		if ( isset($im['filepath'])) {
			print '<div id="t7-item-'.$ii.'" class="t7_swapout"><img src="/'.$im['filepath'].'" /></div>';
			$ii++;
		}
	}

?>

				
				
			</div><!-- .t7_swapout_contain END -->
			<div id="mycarousel" class="jcarousel-skin-tango">
			    <ul class="images">
					<li class="thumb-selected"><img id="t7-thumb-1" class="t7-thumb-image" src="/sites/all/themes/inbode/images/unit/unit_details.png" /></li>

<?php

	$ii=2;

	foreach ($node->field_unit_images as $im) {
		if ( isset($im['filepath'])) {
			print '<li><img id="t7-thumb-'.$ii.'" class="t7-thumb-image" src="/'.$im['filepath'].'" width="92" /></li>';
			$ii++;
		}
	}

	foreach ($node->field_unit_more_images as $im) {
		if ( isset($im['filepath'])) {
			print '<li><img id="t7-thumb-'.$ii.'" class="t7-thumb-image" src="/'.$im['filepath'].'" width="92" /></li>';
			$ii++;
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