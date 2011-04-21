/*
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

*/



// general vars
var map;
var results = [];
var cookieexpiration = 365;
var visibleinfowindow = new google.maps.InfoWindow({});
// requesting a specific unit?
var unithash = document.location.hash.replace('#', '');
// limit arrays (min, max, step)
var price = [];
var price_lower, price_upper;
price[0] = 100;
price[1] = 3000;
price[2] = 50;
if ($.cookie('price_lower')) {
    price_lower = $.cookie('price_lower');
} else {
    price_lower = price[0];
}
if ($.cookie('price_upper')) {
    price_upper = $.cookie('price_upper');
} else {
    price_upper = price[1];
}

var beds = [];
var beds_lower, beds_upper;
beds[0] = 0;
beds[1] = 6;
beds[2] = 1;
if ($.cookie('beds_lower')) {
    beds_lower = $.cookie('beds_lower');
} else {
    beds_lower = beds[0];
}
if ($.cookie('beds_upper')) {
    beds_upper = $.cookie('beds_upper');
} else {
    beds_upper = beds[1];
}

var baths = [];
var baths_lower, baths_upper;
baths[0] = 0;
baths[1] = 5;
baths[2] = 0.5;
if ($.cookie('baths_lower')) {
    baths_lower = $.cookie('baths_lower');
} else {
    baths_lower = baths[0];
}
if ($.cookie('baths_upper')) {
    baths_upper = $.cookie('baths_upper');
} else {
    baths_upper = baths[1];
}

// dates
var date_lower, date_upper;
var datez = [];
var dayspan = 100;
var now = new Date();
var yr = now.getFullYear() + "";
var y = yr.substring(2);
var zm = now.getMonth() + 1;
if (zm < 10) {
    zm = '0' + zm;
}
var zd = now.getDate();
if (zd < 10) {
    zd = '0' + zd;
}
datez[0] = zm + "/" + zd + "/" + y;
var now = new Date();
now.setDate(now.getDate() + dayspan);
var yr = now.getFullYear() + "";
var y = yr.substring(2);
zm = now.getMonth() + 1;
if (zm < 10) {
    zm = '0' + zm;
}
zd = now.getDate();
if (zd < 10) {
    zd = '0' + zd;
}
datez[1] = zm + "/" + zd + "/" + y;

// now ready
$(document).ready(function() {

    // if we see a request for an individual unit, reset filters
    if (unithash) {
        inbode.util.resetfilter();
    }

    // search box
    $('#t7_city').focus(function() {
        if ($(this).val() === 'City or Zip') {
            $(this).val('');
        }
    });
    $('#t7_city').blur(function() {
        if ($(this).val() === '') {
            $(this).val('City or Zip');
        }
    });

    // initialize inbode!
    inbode.util.init();
    $('#t7_city').keypress(function(e) {
        if (e.keyCode === 13) {
            visibleinfowindow.close(map);
            inbode.util.search($('#t7_city').val());
        }
    });

    // horizontal slide for date
    $("#slider-dates").slider({
        orientation: "horizontal",
        min: 0,
        max: dayspan,
        step: 1,
        range: true,
        values: [0, dayspan],
        slide: function(event, ui) {

            var nows1 = new Date();
            nows1.setDate(nows1.getDate() + ui.values[0]);
            mnow = nows1.getMonth() + 1;
            if (mnow < 10) {
                mnow = '0' + mnow;
            }
            dnow = nows1.getDate();
            if (dnow < 10) {
                dnow = '0' + dnow;
            }
            ynow = nows1.getFullYear() + '';

            date_lower = mnow + "/" + dnow + "/" + ynow.substring(2);
            $.cookie('date_lower', date_lower, {
                expires: cookieexpiration,
                path: '/'
            });
            $("#date-from").html(date_lower);

            var nows2 = new Date();
            nows2.setDate(nows2.getDate() + ui.values[1]);
            mnow = nows2.getMonth() + 1;
            if (mnow < 10) {
                mnow = '0' + mnow;
            }
            dnow = nows2.getDate();
            if (dnow < 10) {
                dnow = '0' + dnow;
            }
            ynow = nows2.getFullYear() + '';
            date_upper = mnow + "/" + dnow + "/" + ynow.substring(2);
            $.cookie('date_upper', date_upper, {
                expires: cookieexpiration,
                path: '/'
            });
            $("#date-to").html(date_upper);

            inbode.util.filter();


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
        slide: function(event, ui) {
            // real time changes to the sliders
            $("#slider-price a:first").html(ui.values[0]);
            $("#slider-price a:last").html(ui.values[1]);
            if (ui.values[1] === price[1]) {
                $("#slider-price a:last").html(ui.values[1] + "+");
            }
            inbode.util.filter();
            $.cookie('price_lower', ui.values[0], {
                expires: cookieexpiration,
                path: '/'
            });
            $.cookie('price_upper', ui.values[1], {
                expires: cookieexpiration,
                path: '/'
            });

        }
    });
    $("#slider-beds").slider({
        orientation: "vertical",
        min: beds[0],
        max: beds[1],
        step: beds[2],
        range: true,
        values: [beds_lower, beds_upper],
        slide: function(event, ui) {
            // real time changes to the sliders
            $("#slider-beds a:first").html(ui.values[0]);
            $("#slider-beds a:last").html(ui.values[1]);
            if (ui.values[0] === beds[0]) {
                $("#slider-beds a:first").html("studio");
            }
            if (ui.values[1] === beds[1]) {
                $("#slider-beds a:last").html(ui.values[1] + "+");
            }
            inbode.util.filter();
            $.cookie('beds_lower', ui.values[0], {
                expires: cookieexpiration,
                path: '/'
            });
            $.cookie('beds_upper', ui.values[1], {
                expires: cookieexpiration,
                path: '/'
            });
        }
    });
    $("#slider-baths").slider({
        orientation: "vertical",
        min: baths[0],
        max: baths[1],
        step: baths[2],
        range: true,
        values: [baths_lower, baths_upper],
        slide: function(event, ui) {
            // real time changes to the sliders
            $("#slider-baths a:first").html(ui.values[0]);
            $("#slider-baths a:last").html(ui.values[1]);
            if (ui.values[1] === baths[1]) {
                $("#slider-baths a:last").html(ui.values[1] + "+");
            }
            inbode.util.filter();
            $.cookie('baths_lower', ui.values[0], {
                expires: cookieexpiration,
                path: '/'
            });
            $.cookie('baths_upper', ui.values[1], {
                expires: cookieexpiration,
                path: '/'
            });
        }
    });

    // check box clicks
    $('#amenities .jquery-safari-checkbox').click(function() {
        inbode.util.filter($(this).attr('id'), !$(this).is(':checked'));
        $.cookie($(this).attr('id'), !$(this).is(':checked'), {
            expires: cookieexpiration,
            path: '/'
        });
    });

    // set states of checkboxes
    $('#amenities .jquery-safari-checkbox').each(function(i) {
        if ($.cookie($(this).attr('id')) === 'true') {
            $(this).attr('checked', true);
        }
    });


});

// inbode yea
inbode = {};

inbode.favorite = {

    starclick: function(id, position) {

        if ($('#' + id).attr('src') === '/ui/img/grey_star.png') {
            // now a fave :)
            $('#' + id).attr('src', '/ui/img/yellow_star.png');
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

            $.each(results, function(i, item) {

                if (item.marker.position == position) {
                    // this is the marker whose icon we need to change!
                    item.marker.setIcon('/ui/img/inbmrkr.png');
                    item.marker.setShadow('/ui/img/inbmrkr_shadow.png');
                }
            });

        } else {
            // no longer a fave :(
            $('#' + id).attr('src', '/ui/img/grey_star.png');
            $.cookie('faves', $.cookie('faves').replace('|' + id, ''), {
		          expires: cookieexpiration,
		          path: '/'
            });

            $.each(results, function(i, item) {

                if (item.marker.position == position) {
                    // thi is the marker whose icon we need to change!
                    if ($.cookie('click_history').search(position) > 0) {
                        item.marker.setIcon('/ui/img/inbmrkr-grey.png');
                    } else {
                        item.marker.setIcon();
                    }


                }
            });


        }



    },

    starover: function(id) {
        $('#' + id).addClass('hand');
    },

    starout: function(id) {
        $('#' + id).removeClass('hand');
    }
};

inbode.util = {

		idle: function() {
		
			if ( map.getBounds()!=null && map.getBounds()!=undefined ) {
			
				// we should remember where the user was last
	      $.cookie('last_bounds', map.getBounds(), {
	          expires: cookieexpiration,
	          path: '/'
	      });			
			
			}
		
		},

    getlink: function(unit_id) {

        $('#gl_' + unit_id).toggle();
        $('#glin_' + unit_id).toggle();
        $('#glin_' + unit_id + ' input').select();

    },

    init: function() {

        // filter and more filter click events
        $("a.trigger_1").click(function() {
            inbode.util.open_filters();
        });

        $("a.trigger_2").click(function() {
            inbode.util.open_more_filters();
        });

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

        // map options
        var options = {
            zoom: 12,
            disableDefaultUI: true,
            navigationControl: true,
            navigationControlOptions: {
                style: google.maps.NavigationControlStyle.SMALL
            },
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            scaleControl: true
        };
        map = new google.maps.Map(document.getElementById("map_canvas"), options);

				// do something when the map is idle after pan or zoom
			  google.maps.event.addListener(map, 'idle', function()
			  { 

			  });
			  // do something after the zoom changes
			  google.maps.event.addListener(map, 'zoom_changed', function()
			  { 

			  });
			  
			  // close any infowindows if a user clicks anywhere but the marker or infowindow
			  google.maps.event.addListener(map, 'click', function()
			  { 
	        visibleinfowindow.close(map);
			  });


        // if this is a request for one specific unit, treat it differently
        if (unithash) {

            inbode.util.showunit(unithash);

        } else {

						// remember current bounds        
						$.cookie('last_bounds', map.getBounds(), {
							expires: cookieexpiration,
							path: '/'
						});			


            if ($.cookie('last_latlng') && $.cookie('last_location') && $.cookie('last_bounds')) {
                var l = $.cookie('last_latlng').replace('(', '').replace(')', '');
                ll = l.split(',');
                var loci = new google.maps.LatLng(ll[0], ll[1]);
                map.setCenter(loci);
                $('#t7_city').val($.cookie('last_location'));                
                inbode.util.search($.cookie('last_location'));
            } else {
                var loc;
                var mpls = new google.maps.LatLng(44.979965, -93.263836);
                // create a map and set it to minneapolis by default so it renders
                map.setCenter(mpls);
                $("#t7_city").val("Minneapolis, MN");
                // try to find the user's location if they'll let us
                // w3c preferred
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function(position) {
                        loc = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                        map.setCenter(loc);
                        inbode.util.setloc(loc);
                    }, function() {
                        // set a cookie, default to Minneapolis!!
                        $.cookie('last_latlng', mpls, {
                            expires: cookieexpiration,
						                path: '/'
                        });
                        $.cookie('last_location', 'Minneapolis, MN', {
                            expires: cookieexpiration,
						                path: '/'
                        });
                        inbode.util.search('Minneapolis, MN');
                    });
                    // google gears
                } else if (google.gears) {
                    var geo = google.gears.factory.create('beta.geolocation');
                    geo.getCurrentPosition(function(position) {
                        loc = new google.maps.LatLng(position.latitude, position.longitude);
                        map.setCenter(loc);
                        inbode.util.setloc(loc);
                    }, function() {
                        // set a cookie, default to Minneapolis!!
                        $.cookie('last_latlng', mpls, {
                            expires: cookieexpiration,
						                path: '/'
                        });
                        $.cookie('last_location', 'Minneapolis, MN', {
                            expires: cookieexpiration,
						                path: '/'
                        });
                        inbode.util.search('Minneapolis, MN');
                    });
                    // oops, no support
                } else {
                    // set a cookie, default to Minneapolis!!
                    $.cookie('last_latlng', mpls, {
                        expires: cookieexpiration,
				                path: '/'
                    });
                    $.cookie('last_location', 'Minneapolis, MN', {
                        expires: cookieexpiration,
				                path: '/'
                    });
                    inbode.util.search('Minneapolis, MN');
                }
            }

        }

    },
    fancybox: function(iid, unit_id) {

        var uu = '/unit/' + parseInt(unit_id);

        if (iid) {
            uu = uu + '#' + iid;
        }


        $.fancybox({
            'type': 'iframe',
            'href': uu,
            'autoDimensions': false,
            'width': 728,
            'height': 626,
            'transitionIn': 'fade',
            'transitionOut': 'fade',
            'speedIn': 400,
            'speedOut': 200,
            'overlayOpacity': 0.1,
            'overlayColor': '#000'
        });




    },
    showfilters: function() {

        // open up the filters if the cookie exists
        if ($.cookie('filters_visible') == 1) {
            inbode.util.open_filters();
        }

        if ($.cookie('more_filters_visible') == 1) {
            inbode.util.open_more_filters();
        }
    },

    setloc: function(latlng) {
        var geocoder;
        geocoder = new google.maps.Geocoder();
        geocoder.geocode({
            'latLng': latlng
        }, function(results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                if (results[1]) {
                    $.cookie('last_latlng', latlng, {
                        expires: cookieexpiration,
				                path: '/'
                    });
                    $.cookie('last_location', results[1].formatted_address, {
                        expires: cookieexpiration,
				                path: '/'
                    });
                    $('#t7_city').val(results[1].formatted_address);
                    inbode.util.search(results[1].formatted_address);
                }
            }
        });
    },


    showunit: function(unitid) {

        $('#t7_ldr img').fadeIn();

        // url for query
        var uniturl = '/api/search/unit/' + unitid;
        // now perform a request to inbode api
        $.getJSON(uniturl, function(data) {

            var l = data.latlng.replace('(', '').replace(')', '');
            ll = l.split(',');
            var loci = new google.maps.LatLng(ll[0], ll[1]);
            map.setCenter(loci);

            mrkr = new google.maps.Marker({
                position: loci,
                map: map,
                animation: google.maps.Animation.DROP
            });

            var item = data.items[0];
            var mrkrhtml = inbode.util.markerhtml(item, mrkr);

            // create the info windows and listeners
            var infowindow = new google.maps.InfoWindow({
                content: mrkrhtml,
                size: new google.maps.Size(270, 210),
                position: loci,
                pixelOffset: new google.maps.Size(0, -34)
            });

            // set marker click history
            if ($.cookie('click_history') !== null) {
                if ($.cookie('click_history').search(loci) > 0) {
                    mrkr.setIcon('/ui/img/inbmrkr-grey.png');
                    mrkr.setShadow('/ui/img/inbmrkr_shadow.png');
                }
            }
            // set marker if it's a favorite
            if ($.cookie('faves') !== null) {
                if ($.cookie('faves').search(item.nid) > 0) {
                    mrkr.setIcon('/ui/img/inbmrkr.png');
                    mrkr.setShadow('/ui/img/inbmrkr_shadow.png');
                }
            }

            // add marker click event listener
            google.maps.event.addListener(mrkr, 'click', function() {
                // close the visible one
                visibleinfowindow.close(map);
                infowindow.open(map);
                // add some click history
                if ($.cookie('click_history')) {
                    if ($.cookie('click_history').search(infowindow.position) === -1) {
                        $.cookie('click_history', $.cookie('click_history') + '|' + infowindow.position, {
                            expires: cookieexpiration,
						                path: '/'
                        });
                    }
                } else {
                    $.cookie('click_history', infowindow.position, {
                        expires: cookieexpiration,
				                path: '/'
                    });
                }
                // make the marker grey now pls
                if (this.getIcon() !== '/ui/img/inbmrkr.png') {
                    this.setIcon('/ui/img/inbmrkr-grey.png');
                }

            });

            // open automatically on the map
            visibleinfowindow = infowindow;

            results = [];
            // set the results array so other things work too
            var inb = {
                "marker": mrkr,
                "beds": item.beds,
                "baths": item.baths,
                "price": item.price,
                "unit_id": item.unit_id,
                "unit_name": item.unit_name,
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
                "status": item.status,
                "nid": item.nid,
                "unit_image_1": item.unit_image_1,
                "unit_image_2": item.unit_image_2,
                "visible": 1
            };

						// update results array
            results.push(inb);
            
            // pop up the lightbox
            infowindow.open(map);

			// done working, show user
            $('#t7_ldr img').fadeOut();


        });


    },

    markerhtml: function(item, mrkr) {

        var mrkrhtml = '<div class="t7_bubble">';
        mrkrhtml += '<h1>';

        // price
        mrkrhtml += '$' + item.price + '&nbsp;';

        // beds
        item.beds = parseInt(item.beds);
        if (item.beds === 1) {
            mrkrhtml += item.beds + ' bed ';
        } else {
            mrkrhtml += item.beds + ' beds ';
        }

        // baths
        item.baths = parseInt(item.baths);
        if (item.baths === 1) {
            mrkrhtml += item.baths + ' bath ';
        } else {
            mrkrhtml += item.baths + ' baths ';
        }

        mrkrhtml += '</h1>';

        // images
        if (item.unit_image_1) {

			// show imagecache thumbnails if not already there.
			if (item.unit_image_1.search('lightbox_thumbnail')==-1) {
				item.unit_image_1 = item.unit_image_1.replace('sites/default/files', 'sites/default/files/imagecache/lightbox_thumbnail');
			}

            mrkrhtml += '<div class="t7_apt_images"><a href="#" onclick="inbode.util.fancybox(3, \'' + item.unit_id + '\');"><img border="0" src="' + item.unit_image_1 + '" width="104" height="73" /></a></div>';
        }
        if (item.unit_image_2) {

			// show imagecache thumbnails if not already there.
			if (item.unit_image_2.search('lightbox_thumbnail')==-1) {
				item.unit_image_2 = item.unit_image_2.replace('sites/default/files', 'sites/default/files/imagecache/lightbox_thumbnail');
			}

            mrkrhtml += '<div class="t7_apt_images"><a href="#" onclick="inbode.util.fancybox(4, \'' + item.unit_id + '\');"><img border="0" src="' + item.unit_image_2 + '" width="104" height="73" /></a></div>';
        }



        // address
        mrkrhtml += '<div class="t7_bot">';
        var ist = item.street;
        if (ist.length>20){

	        mrkrhtml += '<div class="t7_text_left"><i>' + ist.substring(0,20) + '&hellip;</i></div>';

        } else {

	        mrkrhtml += '<div class="t7_text_left"><i>' + ist + '</i></div>';

        }

        mrkrhtml += '<div class="t7_text_right">';

        var uurl = 'http://' + document.domain + '/home#' + item.unit_id;

        // favorites (we <3 cookies)
        if ($.cookie('faves')) {
            if ($.cookie('faves').search(item.nid) > 0) {
                mrkrhtml += '<img class="t7_star" id="fave_' + item.nid + '" src="/ui/img/yellow_star.png" onClick="inbode.favorite.starclick(\'fave_' + item.nid + '\', \'' + mrkr.position + '\');" onMouseOver="inbode.favorite.starover(\'fave_' + item.nid + '\');" onMouseOut="inbode.favorite.starout(\'fave_' + item.nid + '\');" /> <a href="#" onClick="inbode.favorite.starclick(\'fave_' + item.nid + '\', \'' + mrkr.position + '\');" onMouseOver="inbode.favorite.starover(\'fave_' + item.nid + '\');" onMouseOut="inbode.favorite.starout(\'fave_' + item.nid + '\');">favorite</a>&nbsp;&nbsp;<span  style="display:none;" id="glin_' + item.unit_id + '"><input class="getlink" type="text" value="' + uurl + '" /> <a href="#" onClick="inbode.util.getlink(\'' + item.unit_id + '\');">x</a></span>';
            } else {
                mrkrhtml += '<img class="t7_star" id="fave_' + item.nid + '" src="/ui/img/grey_star.png" onClick="inbode.favorite.starclick(\'fave_' + item.nid + '\', \'' + mrkr.position + '\');" onMouseOver="inbode.favorite.starover(\'fave_' + item.nid + '\');" onMouseOut="inbode.favorite.starout(\'fave_' + item.nid + '\');" /> <a href="#" onClick="inbode.favorite.starclick(\'fave_' + item.nid + '\', \'' + mrkr.position + '\');" onMouseOver="inbode.favorite.starover(\'fave_' + item.nid + '\');" onMouseOut="inbode.favorite.starout(\'fave_' + item.nid + '\');">favorite</a>&nbsp;&nbsp;<span  style="display:none;" id="glin_' + item.unit_id + '"><input class="getlink" type="text" value="' + uurl + '" /> <a href="#" onClick="inbode.util.getlink(\'' + item.unit_id + '\');">x</a></span>';
            }
        } else {
            mrkrhtml += '<img class="t7_star" id="fave_' + item.nid + '" src="/ui/img/grey_star.png" onClick="inbode.favorite.starclick(\'fave_' + item.nid + '\', \'' + mrkr.position + '\');" onMouseOver="inbode.favorite.starover(\'fave_' + item.nid + '\');" onMouseOut="inbode.favorite.starout(\'fave_' + item.nid + '\');" /> <a href="#" onClick="inbode.favorite.starclick(\'fave_' + item.nid + '\', \'' + mrkr.position + '\');" onMouseOver="inbode.favorite.starover(\'fave_' + item.nid + '\');" onMouseOut="inbode.favorite.starout(\'fave_' + item.nid + '\');">favorite</a>&nbsp;&nbsp;<span  style="display:none;" id="glin_' + item.unit_id + '"><input class="getlink" type="text" value="' + uurl + '" /> <a href="#" onClick="inbode.util.getlink(\'' + item.unit_id + '\');">x</a></span>';
        }

        // button it up
        mrkrhtml += '</div>';
        mrkrhtml += '</div>';
        mrkrhtml += '<div class="t7_button"><h1><a href="#" onclick="inbode.util.fancybox(1, \'' + item.unit_id + '\');">view full listing</a></h1></div>';
        mrkrhtml += '</div>';
        return mrkrhtml;

    },

    search: function(location) {
    
    		// loading image
        $('#t7_ldr img').fadeIn();

    		// if there are bounds, we should find all apartments within them.
    		// otherwise, search around the city in the searchbox
				if (!location) {
	        // url for query
    			if ( map.getBounds()!=null && map.getBounds()!=undefined ) {
		        var searchurl = '/api/search/bounds/' + encodeURI(map.getBounds());
		      } else {
		      	return false;
		      }
				} else {
	        // url for query
	        var searchurl = '/api/search/location/' + encodeURI(location);				
				}
				
				
        // now perform a request to inbode api
        $.getJSON(searchurl, function(data) {

            var mrkr;
            results = [];
            // loop thru all results and create markers on the map
            $.each(data.items, function(i, item) {
                // location on earth where the store is
                var ll = new google.maps.LatLng(item.lat, item.lng);
                mrkr = new google.maps.Marker({
                    position: ll,
                    map: map,
		                animation: google.maps.Animation.DROP
                });

                var inb = {
                    "marker": mrkr,
                    "beds": item.beds,
                    "baths": item.baths,
                    "price": item.price,
                    "unit_id": item.unit_id,
                    "unit_name": item.unit_name,
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
                    "status": item.status,
                    "nid": item.nid,
                    "unit_image_1": item.unit_image_1,
                    "unit_image_2": item.unit_image_2,
                    "visible": 1
                };

                results.push(inb);

                // set marker click history
                if ($.cookie('click_history') !== null) {
                    if ($.cookie('click_history').search(ll) > 0) {
                        mrkr.setIcon('/ui/img/inbmrkr-grey.png');
                        mrkr.setShadow('/ui/img/inbmrkr_shadow.png');
                    }
                }
                // set marker if it's a favorite
                if ($.cookie('faves') !== null) {
                    if ($.cookie('faves').search(item.nid) > 0) {
                        mrkr.setIcon('/ui/img/inbmrkr.png');
                        mrkr.setShadow('/ui/img/inbmrkr_shadow.png');
                    }
                }

                // marker html
                var mrkrhtml = inbode.util.markerhtml(item, mrkr);


                // create the info windows and listeners
                var infowindow = new google.maps.InfoWindow({
                    content: mrkrhtml,
                    size: new google.maps.Size(270, 210),
                    position: ll,
                    pixelOffset: new google.maps.Size(0, -34)
                });

                // add marker click event listener
                google.maps.event.addListener(mrkr, 'click', function() {
                    // close the visible one
                    visibleinfowindow.close(map);
                    infowindow.open(map);
                    // add some click history
                    if ($.cookie('click_history')) {
                        if ($.cookie('click_history').search(infowindow.position) === -1) {
                            $.cookie('click_history', $.cookie('click_history') + '|' + infowindow.position, {
                                expires: cookieexpiration,
								                path: '/'
                            });
                        }
                    } else {
                        $.cookie('click_history', infowindow.position, {
                            expires: cookieexpiration,
						                path: '/'
                        });
                    }
                    // make the marker grey now pls
                    if (this.getIcon() !== '/ui/img/inbmrkr.png') {
                        this.setIcon('/ui/img/inbmrkr-grey.png');
                        this.setShadow('/ui/img/inbmrkr_shadow.png');
                    }

                    visibleinfowindow = infowindow;

                });



            });

            // record last location in a cookie
            $.cookie('last_latlng', '(' + data.latlng.lat + ',' + data.latlng.lng + ')', {
                expires: cookieexpiration,
                path: '/'
            });
            $.cookie('last_location', data.location, {
                expires: cookieexpiration,
                path: '/'
            });

            // center map at location
            var l = new google.maps.LatLng(data.latlng.lat, data.latlng.lng);
            map.setCenter(l);

            // loader off
            $('#t7_ldr img').fadeOut(function() {
                inbode.util.showfilters();
            });

            // apply the filter
            inbode.util.filter();


        });
    },

    resetfilter: function() {

        price_lower = price[0];
        $.cookie('price_lower', price_lower, {
            expires: cookieexpiration,
            path: '/'
        });
        price_upper = price[1];
        $.cookie('price_upper', price_upper, {
            expires: cookieexpiration,
            path: '/'
        });

        beds_lower = beds[0];
        $.cookie('beds_lower', beds_lower, {
            expires: cookieexpiration,
            path: '/'
        });
        beds_upper = beds[1];
        $.cookie('beds_upper', beds_upper, {
            expires: cookieexpiration,
            path: '/'
        });

        baths_lower = baths[0];
        $.cookie('baths_lower', baths_lower, {
            expires: cookieexpiration,
            path: '/'
        });
        baths_upper = baths[1];
        $.cookie('baths_upper', baths_upper, {
            expires: cookieexpiration,
            path: '/'
        });

        $('#amenities .jquery-safari-checkbox').each(function() {
            $.cookie($(this).attr('id'), false, {
                expires: cookieexpiration,
                path: '/'
            });
        });


    },

    open_filters: function() {

        if ($("div.first_set").is(":hidden")) {
            $("div.first_set").slideDown("slow");
            $("a.trigger_1").removeClass("inactive").addClass("active");

            // set initial values on sliders
            if (!$("#slider-price a:first").html()) {
                $("#slider-price a:first").html(price_lower);
            }
            if (!$("#slider-price a:last").html()) {
                if (price_upper == price[1]) {
                    $("#slider-price a:last").html(price_upper + "+");
                } else {
                    $("#slider-price a:last").html(price_upper);
                }
            }
            if (!$("#slider-beds a:first").html()) {
                if (beds_lower == beds[0]) {
                    $("#slider-beds a:first").html("studio");
                } else {
                    $("#slider-beds a:first").html(beds_lower);
                }
            }
            if (!$("#slider-beds a:last").html()) {
                if (beds_upper == beds[1]) {
                    $("#slider-beds a:last").html(beds_upper + "+");
                } else {
                    $("#slider-beds a:last").html(beds_upper);
                }
            }
            if (!$("#slider-baths a:first").html()) {
                $("#slider-baths a:first").html(baths_lower);
            }
            if (!$("#slider-baths a:last").html()) {
                if (baths_upper == baths[1]) {
                    $("#slider-baths a:last").html(baths_upper + "+");
                } else {
                    $("#slider-baths a:last").html(baths_upper);
                }
            }

            $.cookie('filters_visible', '1', {
                expires: cookieexpiration,
                path: '/'
            });


        } else {

            $("div.first_set").slideUp("slow");
            $("div.second_set").slideUp("slow");
            $("a.trigger_1").removeClass("active").addClass("inactive");
            $("a.trigger_2").removeClass("active").addClass("inactive");

            $.cookie('filters_visible', '0', {
                expires: cookieexpiration,
                path: '/'
            });
            $.cookie('more_filters_visible', '0', {
                expires: cookieexpiration,
                path: '/'
            });

        }

    },

    open_more_filters: function() {

        if ($("div.second_set").is(":hidden")) {
            $("div.second_set").slideDown("slow");
            $("a.trigger_2").removeClass("inactive").addClass("active");

            if (!$("#date-from").html()) {
                $("#date-from").html(datez[0]);
            }
            if (!$("#date-to").html()) {
                $("#date-to").html(datez[1]);
            }
            $.cookie('more_filters_visible', '1', {
                expires: cookieexpiration,
                path: '/'
            });

        } else {
            $("div.second_set").slideUp("slow");
            $("a.trigger_2").removeClass("active").addClass("inactive");

            $.cookie('more_filters_visible', '0', {
                expires: cookieexpiration,
                path: '/'
            });
        }

    },

    filter: function(idc, chkd) {

        if (chkd) {
            chkd = true;
        } else {
            chkd = false;
        }

        // major filters
        var pricemin = $("#slider-price a:first").html();
        if (!pricemin) {
            pricemin = price_lower;
        }
        var pricemax = parseInt($("#slider-price a:last").html(), 10);
        if (!pricemax) {
            pricemax = price_upper;
        }
        var bedsmin = $("#slider-beds a:first").html();
        if (!bedsmin || bedsmin=="studio") {
            bedsmin = beds_lower;
        }
        var bedsmax = parseInt($("#slider-beds a:last").html(), 10);
        if (!bedsmax) {
            bedsmax = beds_upper;
        }
        var bathsmin = $("#slider-baths a:first").html();
        if (!bathsmin) {
            bathsmin = baths_lower;
        }
        var bathsmax = parseInt($("#slider-baths a:last").html(), 10);
        if (!bathsmax) {
            bathsmax = baths_upper;
        }

        // go thru each one of the amenities and create an array of the current state
        // remember that the one we just clicked on (if we did) hasn't changed yet
        // and so the 'idc' and 'chkd' value will override anything we come into contact with
        amenities = [];
        $('#amenities .jquery-safari-checkbox').each(function(i) {
            //var am;
            if ($(this).attr('id') === idc) {
							if (chkd) {
                amenities[$(this).attr('id')] = 1;
							} else {
                amenities[$(this).attr('id')] = 0;
							}
            } else {
            	if ($(this).is(':checked')) {
                amenities[$(this).attr('id')] = 1;
            	} else {
                amenities[$(this).attr('id')] = 0;
            	}
            }
        });


        // first filter by price, beds and baths: the main shizzle
        $.each(results, function(i, item) {
            if ((item.price <= pricemax) && (item.price >= pricemin) && (item.beds <= bedsmax) && (item.beds >= bedsmin) && (item.baths <= bathsmax) && (item.baths >= bathsmin)) {
                item.visible = 1;
            } else {
                item.visible = 0;
            }
        });


        // now filter by amenities
        $.each(results, function(i, item) {
						// amenities
						for (am in amenities) {
							if (am) {
								// the magic of filtering by amenities
								if (item.visible==1 && amenities[am]==1 && item[am]==0) {
				        	item.visible=0;
								}
							} 
						}
        });
					
				// filter by date
				

        // i have a results object with the correct visibility, apply it!
        $.each(results, function(i, item) {
            if (item.visible) {
                item.marker.setVisible(true);
            } else {
                item.marker.setVisible(false);
            }
        });


    }
};
