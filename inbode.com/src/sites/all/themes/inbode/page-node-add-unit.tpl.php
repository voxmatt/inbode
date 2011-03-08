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


.form-item label {display: none;}

#edit-field-unit-bathroom-value-wrapper label, 
#edit-field-unit-bedroom-value-wrapper label,
#edit-field-unit-status-value-wrapper label,
#edit-field-unit-building-nid-nid-wrapper label,
#edit-field-featureid-0-value-wrapper label {display: block !important;}
.swf-upload .center {width: 200px;}



/* ************************************ */
/* CORRECTING AND SETTING UP CONTAINERS */
/* ************************************ */
#t7_add_contain_unit {
	position: relative;

}
#t7_add_contain_unit #t7_content {
	width: 865px;
	background-color: #eeecec;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}

/*

#t7_add_contain_unit .form-item label, 
#t7_add_contain_unit .grippie,
*/
#t7_add_contain_unit legend, 
#t7_add_contain_unit #edit-preview,
#t7_add_contain_unit #swfupload_file_wrapper-field_building_images thead
	{display: none;}
#t7_add_contain_unit fieldset.location legend {display: block !important;} 
/* td.title .wrapper, #swfupload-markup-progress {display:none !important;} */
	#t7_add_contain_unit .form-checkboxes label {
		display: inline;
		color: #666666;
		font-size: 13px;
	}
#t7_add_contain_unit fieldset {
	border: none;
	margin: 0;
	padding: 0;
	width: 670px;
}

	/* 	ZERO-ING OUT DIVS */
#t7_add_contain_unit #edit-title-wrapper, 
#t7_add_contain_unit #edit-title-wrapper div,
#t7_add_contain_unit .location,
#t7_add_contain_unit .location div,
#t7_add_contain_unit .form-item,
#t7_add_contain_unit #edit-submit {padding:0;margin:0;}


/* ************ */
/* FIELD STYLES */
/* ************ */
	/* get that text right */
#t7_add_contain_unit textarea,
#t7_add_contain_unit input,
#t7_add_contain_unit label,
#t7_add_contain_unit #swfupload_file_wrapper-field_building_images
#t7_add_contain_unit .center {
	font-size: 13px;
	color: #666666;
	padding: 1px 5px !important;
}


/* checkbox styles */
/*
#t7_add_contain_unit .form-checkboxes {
	padding: 0;
	margin: 10px 15px 0 0;

	float: left;
	
}
#t7_add_contain_unit .form-checkboxes .form-item {
	float: left;
	padding: 0 10px 0 0;
}
*/



/* IMAGE UPLOAD STYLES  SWF UPLOAD */
#SWFUpload_0 {width:60px !important;height:18px;top:5px;}
#t7_add_contain_unit #edit-field-unit-images, 
#t7_add_contain_unit #edit-field-unit-more-images
 {
	padding: 0 0 0 0;
	margin: 10px 15px 0 8px !important;
	float: right;
	clear: right;
}
/* table width */
#t7_add_contain_unit #swfupload_file_wrapper-field_unit_images,
#t7_add_contain_unit #swfupload_file_wrapper-field_unit_more_images {
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






/*

#t7_add_contain_unit .error, #t7_add_contain_unit .messages, #t7_add_contain_unit .warning {
	width: 850px;
	position: absolute;
	top: -50px;
	left: 0;
}
*/



#t7_add_contain_unit .admin {padding: 0;}
	/* submit button */
#t7_add_contain_unit #edit-submit {
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
		<div id="t7_container" class="unit-entry">

				<?php if ($messages): ?>				
					<?php print $messages; ?>
				<?php endif; ?>

		<div id="t7_add_contain_unit">
			<!-- main content -->
			<div id="t7_content">


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
			

		</div>
	</div>


	</body>
	
</html>
