<?php

/*
if (

	isset($user->roles[3]) ||  	// super admin
	isset($user->roles[4]) || 	// building manager
	isset($user->roles[5]) || 	// user
	($user->uid==1)) {					// uid=1
	// show the page
*/
	
 ?><!DOCTYPE html>
<html>
<head>
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
  <title>inbode - easy online apartment search</title>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  <meta http-equiv="content-type" content="text/html; charset=us-ascii">
  <link type="text/css" href="/ui/css/custom-theme/jquery-ui-1.8.2.custom.css" rel="stylesheet">
  <link type="text/css" href="/ui/css/screen.css" rel="stylesheet">
  <link type="text/css" href="/ui/css/jquery.fancybox-1.3.4.css" rel="stylesheet">  
  <script type="text/javascript" src="/ui/js/jquery-1.4.2.min.js"></script>
  <script type="text/javascript" src="/ui/js/jquery-ui-1.8.2.custom.min.js"></script>
  <script type="text/javascript" src="/ui/js/jquery.cookie.js"></script>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
  <script type="text/javascript" src="http://code.google.com/apis/gears/gears_init.js"></script>
  <script type="text/javascript" src="http://www.google.com/jsapi"></script>
  <script type="text/javascript" src="/ui/js/jquery.fancybox-1.3.4.pack.js"></script>
  <script type="text/javascript" src="/ui/js/jquery.easing-1.3.pack.js"></script>
  <script type="text/javascript" src="/ui/js/jquery.crypt.js"></script>
  <script type="text/javascript" src="/ui/js/inbode.js"></script>
	<script type="text/javascript" src="/sites/all/themes/inbode/modernizr-1.7.min.js"></script>
  <script type="text/javascript">
		google.load('gdata', '2.x', { packages: ['maps'] });
  </script>

  <style type="text/css">
  	.no-borderradius #links .blog_link a {
  		padding: 50px !important;
  		background: none;
  		border: none;
  	}
  </style>


<!--[if (gte IE 9)|!(IE)]><!-->
<script type="text/javascript" src="/ui/js/jquery.checkbox.js"></script>
<script type="text/javascript">
$(document).ready( function() {
	// pretty checkboxes
	$('input:checkbox:not([safari])').checkbox({
	    cls: 'jquery-safari-checkbox'
	});
	$('input[safari]:checkbox').checkbox({
	    cls: 'jquery-safari-checkbox'
	});
	$('input:radio').checkbox({
	    cls: 'jquery-safari-checkbox'
	});
});
</script>
<!--<![endif]-->


</head>

<!--[if lt IE 7 ]> <body class="ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <body class="ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <body class="ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <body class="not_ie" lang="en"> <!--<![endif]-->
  <div id="map_canvas"></div>

  <div id="t7_container">
    <div id="t7_ui_container">
      <div class="top_cap"></div><!-- TOP_CAP END -->

      <div class="body_content">
        <!-- ============ Logo & Search Start ============ -->

        <div class="logo_search">
        	<div id="t7_mapleft">
        		<a href="http://blog.inbode.com/">blog</a>
        	</div>
          <div id="t7_signin">
						<?php 
            
            global $user;
            
            if ( isset($user->roles[3]) || isset($user->roles[4]) || isset($user->roles[5]) || $user->uid==1 ) {
            	 print '<a class="signingin" href="/user/'.$user->uid.'/inbode">my account</a>';
            } else {
            	print '<a href="/user/login">sign in</a>';
            }
            
            
            
            ?>
          </div><!-- t7_signin end -->
		  <a class="t7_logo_link" href="/home">Home</a>
          <div class="t7_city">
            <input id="t7_city" maxlength="50" value="City or Zip">
          </div><!-- t7_city end -->

          <div id="t7_filter_selector">
            <div id="t7_ldr"><img border="0" width="16" height="16" src=
            "/ui/img/ajax-loader.gif"></div><!-- t7_ldr end -->
            <a id="filtz" class="trigger_1 inactive" href="#">filters</a>
          </div><!-- t7_filter_selector end -->
        </div><!-- LOGO_SEARCH END -->
        <!-- ============ First Filter Set Start ============ -->

        <div class="first_set">
          <div id="main_slider_container">
            <div class="t7_vert_slider_container price">
              <div class="t7_slider_title">
                price
              </div><!-- t7_slider_title end -->

              <div class="t7_slider_holder">
                <div id="slider-price" class="t7_slider"></div>
                <!-- t7_slider & slider-price end -->
              </div><!-- t7_slider_holder end -->
            </div><!-- t7_vert_slider_container end -->

            <div class="t7_vert_slider_container beds">
              <div class="t7_slider_title">
                beds
              </div>

              <div class="t7_slider_holder">
                <div id="slider-beds" class="t7_slider"></div>
              </div><!-- t7_slider_holder end -->
            </div><!-- t7_vert_slider_container end -->

            <div class="t7_vert_slider_container baths">
              <div class="t7_slider_title">
                baths
              </div>

              <div class="t7_slider_holder">
                <div id="slider-baths" class="t7_slider"></div>
              </div><!-- t7_slider_holder end -->
            </div><!-- t7_vert_slider_container end -->
          </div><!-- main_slider_container end -->

          <div id="t7_more_filters">
            <a class="trigger_2 inactive" href="#">more filters</a>
          </div><!-- t7_more_filters end -->
        </div><!-- 1ST_SET END -->
        <!-- ============ Second Filter Set Start ============ -->

        <div class="second_set">
          <div id="t7_dates">
            move-in from <span id="date-from"></span> to <span id="date-to"></span>

            <div id="slider-dates"></div><!-- slider-dates end -->
          </div><!-- t7_dates end -->

          <div class="amenities" id="amenities">
            <ul class="left_col">
              <li><input class="jquery-safari-checkbox" type="checkbox" name="amenities"
              id="unit_am_balcony"><label for="unit_am_balcony">balcony</label></li>

              <li><input class="jquery-safari-checkbox" type="checkbox" name="amenities"
              id="unit_am_dishwasher"><label for=
              "unit_am_dishwasher">dishwasher</label></li>

              <li><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" id="unit_am_furnished"><label for=
              "unit_am_furnished">furnished</label></li>

              <li><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" id="unit_am_laundry"><label for=
              "unit_am_laundry">unit laundry</label></li>

              <li><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" id="unit_am_disposal"><label for=
              "unit_am_disposal">disposal</label></li>
            </ul>

            <ul class="right_col">
              <li><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" id="unit_am_garage"><label for=
              "unit_am_garage">garage</label></li>

              <li><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" id="building_am_pool"><label for=
              "building_am_pool">pool</label></li>

              <li><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" id="building_am_cats"><label for=
              "building_am_cats">cats</label></li>

              <li><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" id="building_am_dogs_small"><label for=
              "building_am_dogs_small">small dogs</label></li>

              <li><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" id="building_am_dogs_large"><label for=
              "building_am_dogs_large">large dogs</label></li>
            </ul>
          </div><!-- amenities end -->
        </div><!-- 2ND_SET END -->
      </div><!-- BODY_CONTENT END -->
    </div><!-- t7_ui_CONTAINER END -->
  </div>
  <div id="map_footer">
  	&#169; 2011 inbode inc. | <a href="http://blog.inbode.com/">blog</a> | <a href="http://blog.inbode.com/about">about</a> | <a href="http://inbode.com/legal/equal"><img src="/sites/all/themes/inbode/images/icon_eho.gif"> Equal Housing Opportunity</a>
  </div>
</body>
</html>
<?php

	//
/*
} else {

	// if we are anonymouse, redirect to home page

	header('Location: /');
};
*/

?>