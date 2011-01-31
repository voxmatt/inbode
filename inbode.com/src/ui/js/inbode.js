// generals
var map;
var results = new Array();
var cookieexpiration = 365;

// limit arrays (min, max, step)
var price = new Array();
var price_lower, price_upper;
price[0] = 100;
price[1] = 3000;
price[2] = 50;
if($.cookie('price_lower')) { price_lower=$.cookie('price_lower') } else { price_lower=price[0]};
if($.cookie('price_upper')) { price_upper=$.cookie('price_upper') } else { price_upper=price[1]};

var beds = new Array();
var beds_lower, beds_upper;
beds[0] = 0;
beds[1] = 6;
beds[2] = 1;
if($.cookie('beds_lower')) { beds_lower=$.cookie('beds_lower') } else { beds_lower=beds[0]};
if($.cookie('beds_upper')) { beds_upper=$.cookie('beds_upper') } else { beds_upper=beds[1]};

var baths = new Array();
var baths_lower, baths_upper;
baths[0] = 0;
baths[1] = 5;
baths[2] = 0.5;
if($.cookie('baths_lower')) { baths_lower=$.cookie('baths_lower') } else { baths_lower=baths[0]};
if($.cookie('baths_upper')) { baths_upper=$.cookie('baths_upper') } else { baths_upper=baths[1]};

// initial dates
var now = new Date();
var then = new Date();
var dayspan = 100;
var fromdate = new Date();
var todate = new Date();
var yr = now.getFullYear() + "";
var y = yr.substring(2);
then.setDate(now.getDate() + dayspan);
var tr = then.getFullYear() + "";
var t = tr.substring(2);
var datez = new Array();
datez[0] = now.getMonth() + 1 + "/" + now.getDate() + "/" + y;
datez[1] = then.getMonth() + 1 + "/" + then.getDate() + "/" + t;
datez[2] = 1;

// now ready
$(document).ready(function () {
  // initialize inbode!
  inbode.util.init();
  $('#t7_city').keypress(function (e) {
    if (e.keyCode == 13) {
      inbode.util.search();
    }
  });
  $("#t7_filter_selector").toggle(

  function () {
    $("#t7_inbode_top").css('backgroundImage', 'url("/ui/img/inbode-logo-grey.png")');
    $("#t7_inbode_filter").show("drop", {
      direction: 'up'
    });
    // set initial values on sliders
    if (!$("#slider-price a:first").html()) {
      $("#slider-price a:first").html(price_lower)
    };
    if (!$("#slider-price a:last").html()) {
			if (price_upper==price[1]) {
	      $("#slider-price a:last").html(price_upper + "+")		
			} else {
	      $("#slider-price a:last").html(price_upper)		
			}
    };
    if (!$("#slider-beds a:first").html()) {
      $("#slider-beds a:first").html(beds_lower)
    };
    if (!$("#slider-beds a:last").html()) {
			if (beds_upper==beds[1]) {
	      $("#slider-beds a:last").html(beds_upper + "+")
	    } else {
	      $("#slider-beds a:last").html(beds_upper)
	    }
    };
    if (!$("#slider-baths a:first").html()) {
      $("#slider-baths a:first").html(baths_lower)
    };
    if (!$("#slider-baths a:last").html()) {
			if (baths_upper==baths[1]) {
		    $("#slider-baths a:last").html(baths_upper + "+")
		  } else {
		    $("#slider-baths a:last").html(baths_upper)
		  }
    };
  }, function () {
    $("#t7_inbode_top").css('backgroundImage', 'url("/ui/img/inbode-logo-plain.png")');
    $("#t7_inbode_filter").hide("drop", {
      direction: 'up'
    });
  });
  $("#t7_more_filters").toggle(

  function () {
    $("#t7_inbode_filter").effect("size", {
      to: {
        height: 319
      }
    }, "slow");
    $("#t7_more_filters_content").show();
    if (!$("#date-from").html()) {
      $("#date-from").html(datez[0])
    };
    if (!$("#date-to").html()) {
      $("#date-to").html(datez[1])
    };
  }, function () {
    $("#t7_inbode_filter").effect("size", {
      to: {
        height: 220
      }
    }, "slow");
    $("#t7_more_filters_content").hide();
  });
  // horizontal slide for date
  $("#slider-dates").slider({
    orientation: "horizontal",
    min: 0,
    max: dayspan,
    step: 1,
    range: true,
    values: [0, dayspan],
    slide: function (event, ui) {
      $("#date-from").html(ui.values[0]);
      $("#date-to").html(ui.values[1]);
    }
  });
  // vertical sliders
  $("#slider-price").slider({
    orientation: "vertical",
    min: price[0],
    max: price[1],
    step: price[2],
    range: true,
    values: [price_lower, price_upper],
    slide: function (event, ui) {
      // real time changes to the sliders
      $("#slider-price a:first").html(ui.values[0]);
      $("#slider-price a:last").html(ui.values[1]);
      if (ui.values[1] == price[1]) {
        $("#slider-price a:last").html(ui.values[1] + "+");
      }
      inbode.util.filter();
      $.cookie('price_lower', ui.values[0], { expires: cookieexpiration });
      $.cookie('price_upper', ui.values[1], { expires: cookieexpiration });

    }
  });
  $("#slider-beds").slider({
    orientation: "vertical",
    min: beds[0],
    max: beds[1],
    step: beds[2],
    range: true,
    values: [beds_lower, beds_upper],
    slide: function (event, ui) {
      // real time changes to the sliders
      $("#slider-beds a:first").html(ui.values[0]);
      $("#slider-beds a:last").html(ui.values[1]);
      if (ui.values[1] == beds[1]) {
        $("#slider-beds a:last").html(ui.values[1] + "+");
      }
      inbode.util.filter();
      $.cookie('beds_lower', ui.values[0], { expires: cookieexpiration });
      $.cookie('beds_upper', ui.values[1], { expires: cookieexpiration });
    }
  });
  $("#slider-baths").slider({
    orientation: "vertical",
    min: baths[0],
    max: baths[1],
    step: baths[2],
    range: true,
    values: [baths_lower, baths_upper],
    slide: function (event, ui) {
      // real time changes to the sliders
      $("#slider-baths a:first").html(ui.values[0]);
      $("#slider-baths a:last").html(ui.values[1]);
      if (ui.values[1] == baths[1]) {
        $("#slider-baths a:last").html(ui.values[1] + "+");
      }
      inbode.util.filter();
      $.cookie('baths_lower', ui.values[0], { expires: cookieexpiration });
      $.cookie('baths_upper', ui.values[1], { expires: cookieexpiration });
    }
  });
  
  // check box clicks
  $('#amenities .jquery-safari-checkbox').click( function() {
	  inbode.util.filter();
    $.cookie( $(this).attr('id'), !$(this).is(':checked'), { expires: cookieexpiration });
  });
  
  // set states of checkboxes
  $('#amenities .jquery-safari-checkbox').each(function(i) {
    	
		if ($.cookie($(this).attr('id'))=='true') {
			$(this).attr('checked', true);
		}
  	
  });
  
  
});

// inbode!
inbode = {};

inbode.favorite = {
  starclick: function () {},
  starover: function () {},
  starout: function () {},
};

inbode.util = {
  init: function () {
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
      var loci = new google.maps.LatLng(ll[0], ll[1]);
      map.setCenter(loci);
      $('#t7_city').val($.cookie('last_location'));
      inbode.util.search();
    } else {
      var loc;
      var mpls = new google.maps.LatLng(44.979965, -93.263836);
      var nyc = new google.maps.LatLng(40.743209, -74.004378);
      // create a map and set it to minneapolis by default so it renders
      map.setCenter(mpls);
      $("#t7_city").val("Minneapolis, MN, USA");
      // try to find the user's location if they'll let us
      // w3c preferred
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
          loc = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
          map.setCenter(loc);
          inbode.util.setloc(loc);
        }, function () {
          // set a cookie, default to Minneapolis!!
          $.cookie('last_latlng', mpls, { expires: cookieexpiration });
          $.cookie('last_location', 'Minneapolis, MN, USA', { expires: cookieexpiration });
          inbode.util.search();
        });
        // google gears
      } else if (google.gears) {
        var geo = google.gears.factory.create('beta.geolocation');
        geo.getCurrentPosition(function (position) {
          loc = new google.maps.LatLng(position.latitude, position.longitude);
          map.setCenter(loc);
          inbode.util.setloc(loc);
        }, function () {
          // set a cookie, default to Minneapolis!!
          $.cookie('last_latlng', mpls, { expires: cookieexpiration });
          $.cookie('last_location', 'Minneapolis, MN, USA', { expires: cookieexpiration });
          inbode.util.search();
        });
        // oops, no support
      } else {
        // set a cookie, default to Minneapolis!!
        $.cookie('last_latlng', mpls, {
          expires: cookieexpiration
        });
        $.cookie('last_location', 'Minneapolis, MN, USA', {
          expires: cookieexpiration
        });
        inbode.util.search();
      }
    }
  },
  setloc: function (latlng) {
    var geocoder;
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({
      'latLng': latlng
    }, function (results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[1]) {
          $.cookie('last_latlng', latlng, { expires: cookieexpiration });
          $.cookie('last_location', results[1].formatted_address, { expires: cookieexpiration });
          $('#t7_city').val(results[1].formatted_address);
          inbode.util.search();
        }
      }
    });
  },
  search: function () {
    $('#t7_ldr img').fadeIn();
    // url for query
    var searchurl = '/api/search/location/' + encodeURI($('#t7_city').val());
    // now perform a request to storelocator to find the stores around this location
    $.getJSON(searchurl, function (data) {
      var mrkr;
      results = [];
      // loop thru all results and create markers on the map
      $.each(data.items, function (i, item) {
        // location on earth where the store is
        var ll = new google.maps.LatLng(item.lat, item.lng);
        mrkr = new google.maps.Marker({
          position: ll,
          map: map
        });
        var inb = {
          "marker": mrkr,
          "beds": item.beds,
          "baths": item.baths,
          "price": item.price,
          "building_am_cats": item.building_am_cats,
          "building_am_dogs_small": item.building_am_dogs_small,
          "building_am_dogs_large": item.building_am_dogs_large,
          "building_am_pool": item.building_am_pool,
          "unit_am_laundry": item.unit_am_laundry,
          "unit_am_dishwasher": item.unit_am_dishwasher,
          "unit_am_disposal": item.unit_am_disposal,
          "unit_am_balcony": item.unit_am_balcony,
          "unit_am_furnished": item.unit_am_furnished,
          "unit_am_garage": item.unit_am_garage,
          "available": item.available,
          "status": item.status          
        };
        results.push(inb);
        // temp html
        var mrkrhtml = '<div class="t7_bubble">';
        mrkrhtml += '<h1>';
        // beds
        if (item.beds == 1) {
          mrkrhtml += item.beds + ' bed ';
        } else {
          mrkrhtml += item.beds + ' beds ';
        }
        // baths
        if (item.baths == 1) {
          mrkrhtml += item.baths + ' bath ';
        } else {
          mrkrhtml += item.baths + ' baths ';
        }
        // price
        mrkrhtml += '$' + item.price + '</h1>';
        // images
        if (item.images) {
          $.each(item.images, function (j, img) {
            mrkrhtml += '<div class="t7_apt_images"><img src="' + img + '" width="104" height="73" /></div>';
          });
        }
        // address
        mrkrhtml += '<div class="t7_bot">';
        mrkrhtml += '<div class="t7_text_left"><i>' + item.street + '</i></div>';
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
      $.cookie('last_latlng', '(' + data.latlng.lat + ',' + data.latlng.lng + ')', {
        expires: cookieexpiration
      });
      $.cookie('last_location', data.location, {
        expires: cookieexpiration
      });
      // center map at location							
      var l = new google.maps.LatLng(data.latlng.lat, data.latlng.lng);
      map.setCenter(l);
			
      // loader off	
      $('#t7_ldr img').fadeOut();
      
      // apply the filter
      inbode.util.filter();
      
      
    });
  },
  filter: function () {
  
    var pricemin = $("#slider-price a:first").html();
    if (!pricemin) { pricemin=price_lower};
    var pricemax = parseInt($("#slider-price a:last").html());
    if (!pricemax) { pricemax=price_upper};
    var bedsmin = $("#slider-beds a:first").html();
    if (!bedsmin) { bedsmin=beds_lower};
    var bedsmax = parseInt($("#slider-beds a:last").html());
    if (!bedsmax) { bedsmax=beds_upper};
    var bathsmin = $("#slider-baths a:first").html();
    if (!bathsmin) { bathsmin=baths_lower};
    var bathsmax = parseInt($("#slider-baths a:last").html());
    if (!bathsmax) { bathsmax=baths_upper};
    
    $.each(results, function (i, item) {
      if ((item.price <= pricemax) && (item.price >= pricemin) && (item.beds <= bedsmax) && (item.beds >= bedsmin) && (item.baths <= bathsmax) && (item.baths >= bathsmin)) {
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
  generateTriggerCallback: function (object, eventType) {
    return function () {
      google.maps.event.trigger(object, eventType);
    };
  },
  openInfoWindow: function (infoWindow, marker) {
    return function () {
      // Close the last selected marker before opening this one.
      if (sl.visibleInfoWindow) {
        sl.visibleInfoWindow.close();
      }
      infoWindow.open(map, marker);
      infoWindow.setContent();
      sl.visibleInfoWindow = infoWindow;
    };
  },
  clearMarkers: function () {
    for (var n = 0, marker; marker = sl.markers[n]; n++) {
      marker.setVisible(false);
    }
  }
};