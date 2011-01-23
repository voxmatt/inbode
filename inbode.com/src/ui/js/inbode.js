var map;

var results = new Array();

// limit arrays (min, max, step)
var price = new Array();
price[0] = 100;
price[1] = 3000;
price[2] = 50;
var beds = new Array();
beds[0] = 0;
beds[1] = 6;
beds[2] = 1;
var baths = new Array();
baths[0] = 0;
baths[1] = 5;
baths[2] = 0.5;

// initial dates
var now = new Date();
var then = new Date();
var dayspan = 100;
var fromdate = new Date();
var todate = new Date();
var yr = now.getFullYear()+"";
var y = yr.substring(2);
then.setDate(now.getDate() + dayspan);
var tr = then.getFullYear()+"";
var t = tr.substring(2);
var datez = new Array();
datez[0] = now.getMonth()+1+ "/" + now.getDate() + "/" + y;
datez[1] = then.getMonth()+1+ "/" + then.getDate() + "/" + t;
datez[2] = 1;

$(document).ready( function() {

	// initialize inbode!
	inbode.util.init();
	
  $('#t7_city').keypress( function(e) {
	  if (e.keyCode==13) {
	  	inbode.util.search();  
	  }
  });

	$("#t7_filter_selector").toggle(
	  function() {
	    $("#t7_inbode_top").css( 'backgroundImage', 'url("/ui/img/inbode-logo-grey.png")');
	    $("#t7_inbode_filter").show("drop", { direction: 'up'} );
			// set initial values on sliders
			if (!$("#slider-price a:first").html()) { $("#slider-price a:first").html( price[0] ) };
			if (!$("#slider-price a:last").html()) { $("#slider-price a:last").html( price[1]+"+") };
			
			if (!$("#slider-beds a:first").html()) { $("#slider-beds a:first").html( beds[0] ) };
			if (!$("#slider-beds a:last").html()) { $("#slider-beds a:last").html( beds[1]+"+") };
			
			if (!$("#slider-baths a:first").html()) { $("#slider-baths a:first").html( baths[0] ) };
			if (!$("#slider-baths a:last").html()) { $("#slider-baths a:last").html( baths[1]+"+") };

		},
	  function() {
	    $("#t7_inbode_top").css( 'backgroundImage', 'url("/ui/img/inbode-logo-plain.png")');
	    $("#t7_inbode_filter").hide("drop", { direction: 'up'} );
	  }
	); 
	


	$("#t7_more_filters").toggle(
	  function() {
	    $("#t7_inbode_filter").effect("size", {to: {height: 319}}, "slow" );
	    $("#t7_more_filters_content").show();      
			if (!$("#date-from").html()) { $("#date-from").html( datez[0] ) };
			if (!$("#date-to").html()) { $("#date-to").html( datez[1] ) };
	  },
	  function() {
	    $("#t7_inbode_filter").effect("size", {to: {height: 220}}, "slow" );
	    $("#t7_more_filters_content").hide();      
	  }
	);


	// horizontal slide for date
	$("#slider-dates").slider({
		orientation: "horizontal",
		min: 0,
		max: dayspan,
		step: 1,
		range: true,
		values: [0, dayspan],
		slide: function(event, ui) {
			$("#date-from").html( ui.values[0] );
			$("#date-to").html( ui.values[1] );
			
		}
	});


	// vertical sliders
	$("#slider-price").slider({
		orientation: "vertical",
		min: price[0],
		max: price[1],
		step: price[2],
		range: true,
		values: [price[0], price[1]],
		slide: function(event, ui) {
		   	// real time changes to the sliders
				$("#slider-price a:first").html( ui.values[0] );
				$("#slider-price a:last").html( ui.values[1] );
				if ( ui.values[1]==price[1] ) {
					$("#slider-price a:last").html( ui.values[1]+"+");
				}
				inbode.util.filter();
		}
	});


	
	$("#slider-beds").slider({
		orientation: "vertical",
		min: beds[0],
		max: beds[1],
		step: beds[2],
		range: true,
		values: [beds[0], beds[1]],
		slide: function(event, ui) {
		   	// real time changes to the sliders
				$("#slider-beds a:first").html( ui.values[0] );
				$("#slider-beds a:last").html( ui.values[1] );
				if ( ui.values[1]==beds[1] ) {
					$("#slider-beds a:last").html( ui.values[1]+"+");
				}
				inbode.util.filter();
		}
	});

	
	$("#slider-baths").slider({
		orientation: "vertical",
		min: baths[0],
		max: baths[1],
		step: baths[2],
		range: true,
		values: [baths[0], baths[1]],
		slide: function(event, ui) {
				// real time changes to the sliders
				$("#slider-baths a:first").html( ui.values[0] );
				$("#slider-baths a:last").html( ui.values[1] );
				if ( ui.values[1]==baths[1] ) {
					$("#slider-baths a:last").html( ui.values[1]+"+");
				}
				inbode.util.filter();
				
		}
	});







		
});




inbode = {};

inbode.favorite = {

	starclick: function() {
	
	},
	starover: function() {
	
	},	
	starout: function() {
	
	},

};


inbode.util = {

	init: function() {
	
	  var options = {
	    zoom: 12,
	    disableDefaultUI: true,
	    navigationControl: true,
	    navigationControlOptions: {
	  		style: google.maps.NavigationControlStyle.SMALL
	  	},
	    mapTypeId: google.maps.MapTypeId.ROADMAP,
      scaleControl: true
	  }

	  map = new google.maps.Map(document.getElementById("map_canvas"), options);
	  		
		if ($.cookie('last_latlng') && $.cookie('last_location')) {
			
			var l = $.cookie('last_latlng').replace('(', '').replace(')', '');
			ll = l.split(',');
			var loci = new google.maps.LatLng( ll[0], ll[1] );
		  map.setCenter(loci);
			$('#t7_city').val($.cookie('last_location'));		
			inbode.util.search();
			
		} else {
	
			var loc;
			var mpls = new google.maps.LatLng(44.979965,-93.263836);
			var nyc = new google.maps.LatLng(40.743209,-74.004378);
	
		  // create a map and set it to minneapolis by default so it renders
		  map.setCenter(mpls);
		  $("#t7_city").val("Minneapolis, MN, USA");
		
		  // try to find the user's location if they'll let us
		  // w3c preferred
			if(navigator.geolocation) {
			  navigator.geolocation.getCurrentPosition(function(position) {
			    loc = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
				  map.setCenter(loc);
			    inbode.util.setloc(loc);
			  }, function() {
					// set a cookie, default to Minneapolis!!
					$.cookie('last_latlng', mpls, { expires: 365 });
					$.cookie('last_location', 'Minneapolis, MN, USA', { expires: 365 });
					inbode.util.search();					
			  });
			// google gears
			} else if (google.gears) {
			  var geo = google.gears.factory.create('beta.geolocation');
			  geo.getCurrentPosition(function(position) {
			    loc = new google.maps.LatLng(position.latitude,position.longitude);
			    map.setCenter(loc);
			    inbode.util.setloc(loc);
			  }, function() {
					// set a cookie, default to Minneapolis!!
					$.cookie('last_latlng', mpls, { expires: 365 });
					$.cookie('last_location', 'Minneapolis, MN, USA', { expires: 365 });
					inbode.util.search();
			  });
			// oops, no support
			} else {
				// set a cookie, default to Minneapolis!!
				$.cookie('last_latlng', mpls, { expires: 365 });
				$.cookie('last_location', 'Minneapolis, MN, USA', { expires: 365 });
				inbode.util.search();
			}
	
		}
	
	},
	

	setloc: function(latlng) {
		var geocoder;
    geocoder = new google.maps.Geocoder();
		geocoder.geocode({'latLng': latlng}, function(results, status) {
	    if (status == google.maps.GeocoderStatus.OK) {
	      if (results[1]) {
					$.cookie('last_latlng', latlng, { expires: 365 });
					$.cookie('last_location', results[1].formatted_address, { expires: 365 });
	      	$('#t7_city').val(results[1].formatted_address);
					inbode.util.search();
	      }
	    }
	  });	  
	},
	
	search: function() {
	
		$('#t7_ldr img').fadeIn();
	
		// url for query
		var searchurl = 'http://inbode/api/search/location/' + $('#t7_city').val();
	
	    // now perform a request to storelocator to find the stores around this location
	    $.getJSON( searchurl, 
	    			function(data) {

							var mrkr;
							
							results = [];
							
							// loop thru all results and create markers on the map
		          $.each(data.items, function(i, item){
						    
						    // location on earth where the store is
						    var ll = new google.maps.LatLng(item.lat, item.lng);
								mrkr = new google.maps.Marker({
							      position: ll, 
							      map: map
							  });
							  
							  var inb = {"marker": mrkr, "beds": item.beds, "baths": item.baths, "price": item.price};
							  results.push(inb);
							  
							  // temp html
							  var mrkrhtml = '<div class="t7_bubble">';
							  mrkrhtml += '<h1>';
							  // beds
							  if (item.beds==1) {
							  	mrkrhtml += item.beds +' bed ';
							  } else {
							  	mrkrhtml += item.beds +' beds ';
							  }
							  // baths
							  if (item.baths==1) {
							  	mrkrhtml += item.baths +' bath ';
							  } else {
							  	mrkrhtml += item.baths +' baths ';
							  }
							 	// price
						  	mrkrhtml += '$'+ item.price +'</h1>';
							  
							  // images
							  if (item.images) {
							  	$.each(item.images, function(j, img) {
									  mrkrhtml += '<div class="t7_apt_images"><img src="'+ img +'" width="104" height="73" /></div>';		
							  	});
							  }
							  
							  // address
							  mrkrhtml += '<div class="t7_bot">';
							  mrkrhtml += '<div class="t7_text_left"><i>'+ item.street +'</i></div>';
							  mrkrhtml += '<div class="t7_text_right">';
							  mrkrhtml += '<img class="t7_star" src="/ui/img/grey_star.png" onClick="inbode.favorite.starclick();" onMouseOver="inbode.favorite.starover();" onMouseOut="inbode.favorite.starout();" /> favorite';
							  mrkrhtml += '</div>';
							  mrkrhtml += '</div>';
							  mrkrhtml += '<a href="/"><div id="t7_button"><h1>view full listing</h1></div></a>';
							  mrkrhtml += '</div>';

								// create the info windows and listeners
					      var infoWindow = new google.maps.InfoWindow({
					        content: mrkrhtml,
					        size: new google.maps.Size(270, 210)
					      });

					      // Add marker click event listener.
					      google.maps.event.addListener(mrkr, 'click', sl.openInfoWindow(infoWindow, mrkr));							  
							  
		          });

							// record last location in a cookie		          
							$.cookie('last_latlng', '('+data.latlng.lat+','+data.latlng.lng+')', { expires: 365 });
							$.cookie('last_location', data.location, { expires: 365 });

							// center map at location							
							var l = new google.maps.LatLng( data.latlng.lat, data.latlng.lng );
						  map.setCenter(l);
							
							// loader off	
							$('#t7_ldr img').fadeOut();
							

			});		
	
	},
	
	
	filter: function() {

		var pricemin = $("#slider-price a:first").html();
		var pricemax = parseInt($("#slider-price a:last").html());
		var bedsmin = $("#slider-beds a:first").html();
		var bedsmax = parseInt($("#slider-beds a:last").html());
		var bathsmin = $("#slider-baths a:first").html();
		var bathsmax = parseInt($("#slider-baths a:last").html());


    $.each(results, function(i, item){ 
    
    	if ( (item.price<=pricemax) && (item.price>=pricemin) &&
    				(item.beds<=bedsmax) && (item.beds>=bedsmin) &&
    				(item.baths<=bathsmax) && (item.baths>=bathsmin)
			 		) {
    			
	    	item.marker.setVisible(true);    	
	    	
    	} else {
    	
	    	item.marker.setVisible(false);  	
	    	
    	}
    
    });
	
	
	}

};




var sl = {
  map: null,
  mapContainer: document.getElementById('mapContainer'),
  sideContainer: document.getElementById('sideContainer'),
  generateLink: document.getElementById('generateLink'),
  markers: [],

  visibleInfoWindow: null,

  generateTriggerCallback: function(object, eventType) {
    return function() {
      google.maps.event.trigger(object, eventType);
    };
  },
  
  
  

  openInfoWindow: function(infoWindow, marker) {
    return function() {
      // Close the last selected marker before opening this one.
      if (sl.visibleInfoWindow) {
        sl.visibleInfoWindow.close();
      }

      infoWindow.open(map, marker);
      infoWindow.setContent();
      sl.visibleInfoWindow = infoWindow;
    };
  },
  
  

  clearMarkers: function() {
    for (var n = 0, marker; marker = sl.markers[n]; n++) {
      marker.setVisible(false);
    }
  }
  
};

