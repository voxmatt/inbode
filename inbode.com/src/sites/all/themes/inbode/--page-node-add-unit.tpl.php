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
/*			 UNIT node/add 				*/
/* ************************************ */
	
	/* ************************************ */
	/* CORRECTING AND SETTING UP CONTAINERS */
	/* ************************************ */
	/* SETTING UP CONTAINER */
		#t7_add_contain_unit {
			position: relative;
		}
		#t7_add_contain_unit #t7_content_ {
			width: 865px;
			background-color: #eeecec;
			-webkit-border-radius: 10px;
			-moz-border-radius: 10px;
			border-radius: 10px;
			float: left;
		}
		#t7_inside_unit {
			position: relative;
			width: 100%;
			float: left;
			padding: 10px 15px;
		}
	/* HIDING UNECESSARY ITEMS THEN OVER-RIDING TO DISPLAY SOME */
		#t7_add_contain_unit .form-item label,
		#t7_add_contain_unit #edit-field-unit-building-nid-nid-wrapper, 
		#t7_add_contain_unit .grippie,
		#t7_add_contain_unit legend, 
		#t7_add_contain_unit #edit-preview,
		#t7_add_contain_unit #swfupload_file_wrapper-field_unit_images thead,
		#t7_add_contain_unit #edit-field-unit-available-0-value-datepicker-popup-0-wrapper .description
			{display: none;}
		#edit-field-unit-bathroom-value-wrapper label, 
		#edit-field-unit-bedroom-value-wrapper label,
		#edit-field-unit-available-0-value-wrapper label,
		#edit-field-unit-status-value-wrapper label,
		#edit-field-unit-unit-nid-nid-wrapper label,
		#edit-field-featureid-0-value-wrapper label {display: inline !important;} 
	
	#t7_add_contain_unit .form-checkboxes label {
		display: inline;
		color: #666666;
		font-size: 13px;
	}
	
	
		/* 	ZERO-ING OUT DIVS and whatnot */
	#t7_add_contain_unit form input {margin:0;}
	#t7_add_contain_unit #edit-title-wrapper, 
	#t7_add_contain_unit #edit-title-wrapper div,
	#t7_add_contain_unit .location,
	#t7_add_contain_unit .location div,
	#t7_add_contain_unit .form-item,
	#t7_add_contain_unit .form-checkboxes,
	#t7_add_contain_unit #edit-submit {padding:0;margin:0;}
	.container-inline-date .form-item .form-item {float:none;}
	
	/* ************ */
	/* FIELD STYLES */
	/* ************ */
		/* get that text right */
	#t7_add_contain_unit textarea,
	#t7_add_contain_unit input,
	#t7_add_contain_unit label {
		font-size: 13px;
		color: #666666;
		padding: 1px 5px !important;
		font-weight: normal;
	}
	
		/* float em all */
	#edit-title,
	#edit-field-unit-bedroom-value-wrapper,
	#edit-field-unit-bathroom-value-wrapper,
	#edit-field-unit-price-0-wrapper, 
	#edit-field-unit-area-0-value-wrapper,
	#container-inline-date form-item date-clear-block,
	#edit-field-unit-available-0-value-wrapper label,
	#edit-field-unit-description-0-value, 
	.form-checkboxes, 
	.form-checkboxes .form-item {
		float: left;
		clear: none; 
	}
	.date-clear-block { display: inline; }
	
		/* setting the widths and what-have-you */
	#edit-title {
		width: 150px;
	}
	#edit-field-unit-bedroom-value {margin-right: 7px;}
	#edit-field-unit-bathroom-value {margin-right:10px;}
	#edit-field-unit-price-0-currency {margin-right: 10px;}
	#edit-field-unit-price-0-amount {
		width: 65px;
	}
	#edit-field-unit-area-0-value {
		width: 65px;
	}
	#edit-field-unit-description-0-value {
		margin: 10px 5px 0 0;
		width: 414px;
		height: 200px;
	}
	.form-checkboxes {
		margin: 10px 0 0 0 !important;
		width: 400px;
	}
	
	#edit-field-unit-status-value-wrapper {
		position: relative;
		padding: 5px !important;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;
		margin: 20px 30px 10px 0 !important;
		float: right;
		clear: both;
	}
		.listed {background-color: #efe4a6;}
		.rented {background-color: #b8cfd3;}
		.inactive {background-color: #dfdcdc;}
	#edit-field-unit-status-value-wrapper {color: white !important;}
	
	/* IMAGE UPLOAD STYLES  SWF UPLOAD */
	#SWFUpload_0 {width:102px !important;height:25px;}
	#t7_add_contain_unit #edit-field-unit-images {
		padding: 0 30px 0 0;
		margin: 10px 0 0 8px !important;
		float: right;
		clear: right;
	}
	/* table width */
	#t7_add_contain_unit #swfupload_file_wrapper-field_unit_images {
		margin-top: 10px;
		width: 405px;
		float: left;
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
	
	#t7_add_contain_unit .admin {padding: 0;}
	
#t7_add_contain_unit #edit-submit {
	margin: 0 30px 0 0;
	top: 32px;
	padding: 4px 6px;
	float: right;
	clear: both;
}

.swfupload_button div.center {
	cursor: pointer;
	background: #B9B9B9;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(white), to(#B9B9B9));
	background: -moz-linear-gradient(top, white, #B9B9B9);
	color: #000 !important;
	padding: 4px 9px;
	text-decoration: none;
	vertical-align: middle;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.398438) 0px 0px 2px;
	-moz-box-shadow: rgba(0, 0, 0, 0.398438) 0px 0px 2px;
	box-shadow: rgba(0, 0, 0, 0.398438) 0px 0px 2px;
	border: 1px solid rgba(0, 0, 0, 0.496094);
	text-shadow: rgba(255, 255, 255, 0.796875) 1px 1px 0px;
	font-family: 'helvetica neue', helvetica, arial, sans-serif;
	font-size: 13px;
	font-weight: normal;
	letter-spacing: -0.5px;	
   }


		</style>
</head>
	<body>
		<!-- main content container -->
		<div id="t7_container_" class="unit-entry">
			<?php if ($messages): ?>				
				<?php print $messages; ?>
			<?php endif; ?>
			<div id="t7_add_contain_unit">
				<!-- main content -->
				<div id="t7_content_">
					<div id="t7_inside_unit">
					<?php					
						// only show tabs if you have the admin role or you're user=1 (super admin)
						if ($tabs) {
							if ($user->uid==1 || isset($user->roles[3])) {
								print "<div class=\"tabs\">$tabs</div>";				
							}
						}
					?>									

					<?php if ($help): ?>				
						<?php print $help; ?>
					<?php endif; ?>
	
					<?php print $content; ?>

					</div> <!-- t7_inside_unit END -->
				</div> <!-- t7_content END -->
			</div><!-- t7_add_contain_unit END -->
		</div><!-- t7_container END -->
	</body>	
</html>
