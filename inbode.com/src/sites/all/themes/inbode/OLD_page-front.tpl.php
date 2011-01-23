<!DOCTYPE html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<title>Inbode</title>

		<link type="text/css" href="/ui/css/custom-theme/jquery-ui-1.8.2.custom.css" rel="stylesheet" />	
		<link type="text/css" href="/ui/css/screen.css" rel="stylesheet" />
		<script type="text/javascript" src="/ui/js/jquery-1.4.2.min.js"></script> 
		<script type="text/javascript" src="/ui/js/jquery-ui-1.8.2.custom.min.js"></script> 
		<script type="text/javascript" src="/ui/js/inbode.js"></script> 
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
		<script type="text/javascript" src="http://code.google.com/apis/gears/gears_init.js"></script>

  <script type="text/javascript" src="http://www.google.com/jsapi"></script>
  <script type="text/javascript" src="/simple_sample.js"></script>
  <script type="text/javascript">
    google.load('gdata', '2.x', { packages: ['maps'] });
  </script>


		<script type="text/javascript">

			function initialize() {

				
				var authSubToken = google.accounts.user.checkLogin(MAPS_SCOPE);
				if (!authSubToken) {
					$('state-guest').style.display = '';
					return;
				}
				
				$('state-loggedin').style.display = '';
				
				var initialLocation;
				var mpls = new google.maps.LatLng(44.979965,-93.263836);
				var browserSupportFlag =  new Boolean();
		    var myOptions = {
		      zoom: 12,
		      disableDefaultUI: true,
		      navigationControl: true,
		      navigationControlOptions: {
		    		style: google.maps.NavigationControlStyle.SMALL
			  	},
		      mapTypeId: google.maps.MapTypeId.ROADMAP
		    }
		
		    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
		
			  // Try W3C Geolocation (Preferred)
				if(navigator.geolocation) {
				  browserSupportFlag = true;
				  navigator.geolocation.getCurrentPosition(function(position) {
				    initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
				    map.setCenter(initialLocation);
				  }, function() {
				    hasgeo(browserSupportFlag);
				  });
				// Try Google Gears Geolocation
				} else if (google.gears) {
				  browserSupportFlag = true;
				  var geo = google.gears.factory.create('beta.geolocation');
				  geo.getCurrentPosition(function(position) {
				    initialLocation = new google.maps.LatLng(position.latitude,position.longitude);
				    map.setCenter(initialLocation);
				  }, function() {
				    hasgeo(browserSupportFlag);
				  });
				// Browser doesn't support Geolocation
				} else {
				  browserSupportFlag = false;
				  hasgeo(browserSupportFlag);
				}


				var service = new google.gdata.maps.MapsService('inbode');
				var mapUrl = 'http://maps.google.com/maps/feeds/maps/inbodemaps@gmail.com/full/00048d00ffda2e6448768';
				
				var featureFeedUrl = 'http://maps.google.com/maps/feeds/features/201227743220873007129/00048d00ffda2e6448768/full';
				
				service.getFeatureFeed(featureFeedUrl, function(feedRoot) {
				
				  var feed = feedRoot.feed;
				  var features = feed.getEntries();
				
				  // Create an unordered list to hold
				  // the features' titles and contents.
				  var ul = document.createElement('ul');
				
				  for (var i = 0; i < features.length; i++) {
				
				    var feature = features[i];
				    var btitle = feature.getTitle().getText();
				    var hcontent = feature.getContent().getText();
						
						var xmlCont = jQuery('<xml>'); // You create a XML container
						xmlCont.append(hcontent);
						var description = xmlCont.find("description").html().replace(']]&gt;','');
						var pos = xmlCont.find("coordinates").text().replace(',0.0', '');
						var posa = pos.split(',');
						var posnew = new google.maps.LatLng(posa[1],posa[0]);
				    
					  marker = new google.maps.Marker({
					      position: posnew, 
					      map: map, 
					      title: btitle
					  });   

						attachMessage(marker, description);

				  }
				  
				  
				}, showGDataError);


function attachMessage(marker, msg) {
  var infowindow = new google.maps.InfoWindow(
      { content: msg,
      	maxWidth: 450
      });
  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
  });
}
					
				function hasgeo( errorFlag )
				{
				  if (errorFlag == true) {
				    initialLocation = mpls;
				  } else {
				    initialLocation = mpls;
				  }
				  map.setCenter(initialLocation);	
				}

			}
		
		</script>




		<style type="text/css">
		  html { height: 100% }
		  body { height: 100%; margin: 0px; padding: 0px }
		  #map_canvas { height: 100% }
		</style>

</head>
<body onload="initialize();">

  <img src="dot_clear.gif" style="display: none"/>

  <div id="errors" style="color: #f00; font-weight: bold; display: none"></div>

  <div id="state-guest" style="display: none">
    <a href="#" onclick="login(); return false;">Login</a>
  </div>
  
  <div id="state-loggedin" style="display: none">
    
  </div>
  
  <div id="out"></div>




  <div id="map_canvas"></div>
  
<div id="t7_container">
	
		<div id="t7_inbode_top">
			<div id="t7_signin"><a href="/user">Sign in</a></div>
			<div class="t7_city">
  			<input id="t7_city" maxlength="50" value="City or Zip" />
  		</div>
			<div id="t7_filter_selector"><a href="#">filters</a></div>
		</div>
		
		
		<div id="t7_inbode_filter">
			<div id="t7_filter_content">

				<div class="t7_vert_slider_container">
					<div class="t7_slider_title">$price</div>
					<div class="t7_slider_holder">
            <div id="slider-price" class="t7_slider"></div>
          </div> 
				</div>
				
				<div class="t7_vert_slider_container">
					<div class="t7_slider_title">beds</div>
					<div class="t7_slider_holder">
            <div id="slider-beds" class="t7_slider"></div>
          </div> 
				</div>
				
				<div class="t7_vert_slider_container">
					<div class="t7_slider_title">baths</div>
					<div class="t7_slider_holder">
            <div id="slider-baths" class="t7_slider"></div>
          </div> 
				</div>

				<div id="t7_more_filters"><a href="#">more filters</a></div>

				<div id="t7_more_filters_content">
				
  				<div id="t7_dates">
  					move-in dates from <span id="date-from">6/30/10</span> to <span id="date-to">2/28/11</span></a>
  					<div id="slider-dates"></div>
  				</div>

  				<ul>
    				<li><input type="checkbox" name="amenities" value="laundry" />unit laundry</li>
    				<li><input type="checkbox" name="amenities" value="dishwasher" />dishwasher</li>
  				</ul>
  				<ul>
    				<li><input type="checkbox" name="amenities" value="balcony" />balcony</li>
    				<li><input type="checkbox" name="amenities" value="disposal" />disposal</li>
  				</ul>
  				<ul>
    				<li><input type="checkbox" name="amenities" value="cats" />cats</li>
    				<li><input type="checkbox" name="amenities" value="dogs" />dogs</li>
  				</ul>
  				
        </div>

			</div>

		</div>
	
	</div>  
  
</body>
</html>
