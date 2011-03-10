<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language; ?>" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?>">
<!-- 

         _       __              __   
        (_)___  / /_  ____  ____/ /__ 
       / / __ \/ __ \/ __ \/ __  / _ \
      / / / / / /_/ / /_/ / /_/ /  __/
     /_/_/ /_/_.___/\____/\__,_/\___/ 

     inbode.com is made in America
     by the people of ten7i.com
       ______          ______                      
      /_  __/___  ____/__  (_) _________  ____ ___ 
       / /  / _ \/ __ \ / / / / ___/ __ \/ __ `__ \
      / /  /  __/ / / // / /_/ /__/ /_/ / / / / / /
     /_/   \___/_/ /_//_/_/(_)___/\____/_/ /_/ /_/ 


 -->
 
 	<head>

		<meta name="author" content="Inbode Inc." />
		<title><?php print $head_title; ?></title>
		<?php print $head; ?>
		<?php print $styles; ?>
		<?php print $scripts; ?>
		<style type="text/css">

/* ************************************ */
/*			 BUILDING node/add 			*/
/* ************************************ */

	/* ************************************ */
	/* CORRECTING AND SETTING UP CONTAINERS */
	/* ************************************ */

	#t7_add_contain {
		position: relative;
		float: left;
	}
	#t7_add_contain #t7_content_ {
		width: 865px;
		background-color: #eeecec;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		float: left;
	}
	
	#t7_add_contain legend, 
	#t7_add_contain #edit-title-wrapper label, 
	#t7_add_contain #edit-field-building-address-0-street-wrapper label,
	#t7_add_contain #edit-field-building-address-0-city-wrapper label, 
	#t7_add_contain #edit-field-building-address-0-city-wrapper label,
	#t7_add_contain #edit-field-building-address-0-province-wrapper label, 
	#t7_add_contain #edit-field-building-address-0-postal-code-wrapper label, 
	#t7_add_contain #edit-field-building-description-0-value-wrapper label, 
	#t7_add_contain .form-item label, 
	#t7_add_contain #field_building_images_values th, 
	#t7_add_contain #edit-field-building-images-0-filefield-upload, 
	#t7_add_contain #edit-field-building-images-1-filefield-upload, 
	#t7_add_contain #edit-field-building-images-2-filefield-upload,
	#t7_add_contain #edit-field-building-images-3-filefield-upload, 
	#t7_add_contain #edit-preview,
	#t7_add_contain .grippie,
	#t7_add_contain #swfupload_file_wrapper-field_building_images thead
		{display: none;}
	/* td.title .wrapper, #swfupload-markup-progress {display:none !important;} */
		#t7_add_contain .form-checkboxes label {
			display: inline;
			color: #666666;
			font-size: 13px;
		}
	#t7_add_contain fieldset {
		border: none;
		margin: 0;
		padding: 0;
		width: 670px;
	}
	#t7_add_contain fieldset .form-item {float: left;display: inline;clear: none;}
		/* 	ZERO-ING OUT DIVS */
	#t7_add_contain #edit-title-wrapper, 
	#t7_add_contain #edit-title-wrapper div,
	#t7_add_contain .location,
	#t7_add_contain .location div,
	#t7_add_contain .form-item,
	#t7_add_contain #edit-submit {padding:0;margin:0;}
	

	/* ************ */
	/* FIELD STYLES */
	/* ************ */
		/* get that text right */
	#t7_add_contain textarea,
	#t7_add_contain input,
	#t7_add_contain label,
	#t7_add_contain #swfupload_file_wrapper-field_building_images
	#t7_add_contain .center {
		font-size: 13px;
		color: #666666;
		padding: 1px 5px !important;
	}
		/* 	get those form fields floating left */
	#t7_add_contain #edit-title, 
	#t7_add_contain #edit-field-building-address-0-street, 
	#t7_add_contain #edit-field-building-address-0-city, 
	#t7_add_contain #edit-field-building-address-0-province, 
	#t7_add_contain #edit-field-building-address-0-postal-code, 
	#t7_add_contain #edit-field-building-description-0-value {float: left;}
	
		/* same-width inputs */
	#t7_add_contain #edit-title, 
	#t7_add_contain #edit-field-building-address-0-city, 
	#t7_add_contain #edit-field-building-address-0-province {
		padding: 0;
		margin: 10px 14px 0 0;
		width: 145px;
	}
		/* address input */
	#t7_add_contain #edit-field-building-address-0-street {
		padding: 0;
		margin: 10px 14px 0 0;
		width: 205px;
	}
		/* zip code input */
	#t7_add_contain #edit-field-building-address-0-postal-code {
		padding: 0;
		margin: 10px 0 0 0;
		width: 75px;
	}
		/* description textarea */
	#t7_add_contain #edit-field-building-description-0-value {
		padding: 0;
		margin: 10px 14px 15px 0;
		width: 414px;
		height: 200px;
		overflow: auto;
		
	}
		/* set the left margins */
		#t7_add_contain #edit-title,
		#t7_add_contain #edit-field-building-description-0-value,
		#swfupload_file_wrapper-field_building_images {margin-left: 15px;}
		#t7_add_contain .left {margin-left: 5px !important}
	
	
		/* checkbox styles */
	#t7_add_contain .form-checkboxes {
		padding: 0;
		margin: 10px 15px 0 0;
	/* 	width: 130px; */
		float: left;
		
	}
	#t7_add_contain .form-checkboxes .form-item {
		float: left;
		padding: 0 10px 0 0;
	}
	
	
	
	/* IMAGE UPLOAD STYLES  SWF UPLOAD */
	#SWFUpload_0 {width:60px !important;height:18px;top:5px;}
	#t7_add_contain #edit-field-building-images {
		padding: 0 0 0 0;
		margin: 10px 15px 0 8px !important;
		float: right;
		clear: right;
	}
	/* table width */
	#t7_add_contain #swfupload_file_wrapper-field_building_images {
		margin-top: 10px;
		width: 405px;
	}
	
	table.swfupload td {
		background-image: none;
		background-color: #fbfbfb;
	}
	.sfwupload-list-cancel {
		background-image: url(/sites/all/themes/inbode/images/cancel.png);
		background-repeat: no-repeat;
		background-position: top center;
	}
	/* BUTTON STYLES */
		.swfupload_button div.swfupload-wrapper .swfupload
		.swfupload_button div.left, .swfupload_button div.center, .swfupload_button div.right {background: none;float:none;height:auto;line-height: normal;}
		.swfupload_button div.left, .swfupload_button div.right {display: none;}
	

	#t7_add_contain .admin {padding: 0;}
		/* submit button */
	#t7_add_contain #edit-submit {
		margin: 0 15px 45px 0;
		position: relative;
		top: 32px;
		padding: 4px 6px;
		float: right;
		clear: both;
	}
	

		</style>
	</head>
	<body>



		<!-- main content container -->
		<div id="t7_container_" class="building-entry">
				<?php if ($messages): ?>				
					<?php print $messages; ?>
				<?php endif; ?>

		  <div id="t7_add_contain">
			<!-- main content -->
			<div id="t7_content_">



				<?php
				
				// only show tabs if you have the admin role or you're user=1 (super admin)
				if ($tabs) {
					if ($user->uid==1 || $user->roles[3]) {
						print "<div class=\"tabs\">$tabs</div>";				
					}
				}

				?>
				
								
				<?php if ($help): ?>				
					<?php print $help; ?>
				<?php endif; ?>

				<?php print $content; ?>

			</div> 

			
		  </div><!-- .t7_add_contain END -->

		</div>

	</body>
	
</html>
