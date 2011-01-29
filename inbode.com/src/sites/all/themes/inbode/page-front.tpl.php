<!DOCTYPE html>
<html>
<head>
  <title>Inbode</title>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  <meta http-equiv="content-type" content="text/html; charset=us-ascii">
  <link type="text/css" href="/ui/css/custom-theme/jquery-ui-1.8.2.custom.css" rel=
  "stylesheet">
  <link type="text/css" href="/ui/css/screen.css" rel="stylesheet">
  <script type="text/javascript" src="/ui/js/jquery-1.4.2.min.js"></script>
  <script type="text/javascript" src="/ui/js/jquery-ui-1.8.2.custom.min.js"></script>
  <script type="text/javascript" src="/ui/js/jquery.cookie.js"></script>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
  <script type="text/javascript" src="/ui/js/jquery.checkbox.js"></script>
  <script type="text/javascript" src="http://code.google.com/apis/gears/gears_init.js"></script>
  <script type="text/javascript" src="http://www.google.com/jsapi"></script>
  <script type="text/javascript" src="/ui/js/inbode.js"></script>
  <script type="text/javascript">
		google.load('gdata', '2.x', { packages: ['maps'] });
		$(document).ready(function(){
		$("a.trigger_1").click(function () {
		        if ($("div.first_set").is(":hidden")) {
		                $("div.first_set").slideDown("slow");
		                $(this).removeClass("inactive").addClass("active");
		        } else {
		                $("div.first_set").slideUp("slow");
		                $("div.second_set").slideUp("slow");
		                $(this).removeClass("active").addClass("inactive");
		                $("a.trigger_2").removeClass("active").addClass("inactive");
		        }
		});
		        $("a.trigger_2").click(function () {
		                if ($("div.second_set").is(":hidden")) {
		                        $("div.second_set").slideDown("slow");
		                        $(this).removeClass("inactive").addClass("active");
		                } else {
		                        $("div.second_set").slideUp("slow");
		                        $(this).removeClass("active").addClass("inactive");
		                }
		        });
		$('input:checkbox:not([safari])').checkbox({cls:'jquery-safari-checkbox'});
		$('input[safari]:checkbox').checkbox({cls:'jquery-safari-checkbox'});
		$('input:radio').checkbox({cls:'jquery-safari-checkbox'});
		});
  </script>
</head>

<body>
  <div id="map_canvas"></div>

  <div id="t7_container">
    <div id="t7_ui_container">
      <div class="top_cap"></div><!-- TOP_CAP END -->

      <div class="body_content">
        <!-- ============ Logo & Search Start ============ -->

        <div class="logo_search">
          <div id="t7_signin">
            <a href="/user">Sign in</a>
          </div><!-- t7_signin end -->

          <div class="t7_city">
            <input id="t7_city" maxlength="50" value="City or Zip">
          </div><!-- t7_city end -->

          <div id="t7_filter_selector">
            <div id="t7_ldr"><img border="0" width="16" height="16" src=
            "/ui/img/ajax-loader.gif"></div><!-- t7_ldr end -->
            <a class="trigger_1 inactive" href="#">filters</a>
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

          <div class="amenities">
            <ul class="left_col">
              <li><input class="jquery-safari-checkbox" type="checkbox" name="amenities"
              value="balcony" id="balcony"><label for="balcony">balcony</label></li>

              <li><input class="jquery-safari-checkbox" type="checkbox" name="amenities"
              value="dishwasher" id="dishwasher"><label for=
              "dishwasher">dishwasher</label></li>

              <li><label for="dishwasher"><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" value="furnished" id="furnished"><label for=
              "furnished">furnished</label></label></li>

              <li><label for="dishwasher"><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" value="laundry" id="laundry"><label for=
              "laundry">unit laundry</label></label></li>

              <li><label for="dishwasher"><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" value="disposal" id="disposal"><label for=
              "disposal">disposal</label></label></li>
            </ul>

            <ul class="right_col">
              <li><label for="dishwasher"><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" value="garage" id="garage"><label for=
              "garage">garage</label></label></li>

              <li><label for="dishwasher"><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" value="pool" id="pool"><label for=
              "pool">pool</label></label></li>

              <li><label for="dishwasher"><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" value="cats" id="cats"><label for=
              "cats">cats</label></label></li>

              <li><label for="dishwasher"><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" value="small_dogs" id="small_dogs"><label for=
              "small_dogs">small dogs</label></label></li>

              <li><label for="dishwasher"><input class="jquery-safari-checkbox" type=
              "checkbox" name="amenities" value="large_dogs" id="large_dogs"><label for=
              "large_dogs">large dogs</label></label></li>
            </ul>
          </div><!-- amenities end -->
        </div><!-- 2ND_SET END -->
      </div><!-- BODY_CONTENT END -->
    </div><!-- t7_ui_CONTAINER END -->
  </div>
</body>
</html>
