google.maps.event.addDomListener(window, "load", function () {
    //
    // initialize map
    //
    var map = new google.maps.Map(document.getElementById("mapdiv"), {
        center: new google.maps.LatLng(-1.299129, 36.762697),
        zoom: 17,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    //
    // initialize marker
    //
    var marker = new google.maps.Marker({
        position: map.getCenter(),
        draggable: true,
        map: map
    });
    //
    // intercept map and marker movements
    //
    google.maps.event.addListener(map, "idle", function () {
        marker.setPosition(map.getCenter());
        var lat = map.getCenter().lat().toFixed(6);
        var lon = map.getCenter().lng().toFixed(6);


        $.ajax({
            type: "POST",
            url: "http://maps.googleapis.com/maps/api/geocode/json?latlng=" + lat + "," + lon + "&sensor=true"
        }).done(function( msg ) {
                $('#address').val(msg.results[0].formatted_address);
            });

        $('#product_lat').val(lat);
        $('#product_lon').val(lon);
    });
    google.maps.event.addListener(marker, "dragend", function (mapEvent) {
        map.panTo(mapEvent.latLng);
    });
    //
    // initialize geocoder
    //
    var geocoder = new google.maps.Geocoder();
    google.maps.event.addDomListener(document.getElementById("geolocate"), "click", function (domEvent) {
        if (domEvent.preventDefault) {
            domEvent.preventDefault();
        } else {
            domEvent.returnValue = false;
        }
        geocoder.geocode({
            address: document.getElementById("address").value
        }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var result = results[0];
                document.getElementById("address").value = result.formatted_address;
                if (result.geometry.viewport) {
                    map.fitBounds(result.geometry.viewport);
                }
                else {
                    map.setCenter(result.geometry.location);
                }
            } else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
                alert("Sorry, the geocoder failed to locate the specified address.");
            } else {
                alert("Sorry, the geocoder failed with an internal error.");
            }
        });
    });
});






function disableReview() {
}

function enableReview() {
   $('.login').hide();
   $('.user-review').removeClass('hide');
}

function login() {
    FB.login(function(response) {
        if (response.authResponse) {

            // connected
            FB.api('/me', function(response) {
                enableReview();
                console.log('Good to see you, ' + response.name + '.');
            });
        } else {
            // cancelled
            disableReview();
        }
    });
}

function review() {
    var val = getRatingValue();
    var slug = $('#slug').val();
    var desc = $('#my-rating').val();

    $.post('/products/' + slug + '/ratings', {
        val: {
            rating: val,
            description: desc,
            user_id: window.user.id,
            username: window.user.name
        }
    }, function(response) {
        window.location = window.location;
    }, 'json');
}

function getRatingValue() {
    var value = 0;
    for(var i=5;i>0;i--) {
        var rdo = "#star" + i;
        if ($(rdo).attr('checked') == "checked") {
            value = i;
            break;
        }
    }
    return value;
}

//function getGeoValues(address) {
//    var geocoder = new google.maps.Geocoder();
//
//    //TODO: Error message for when there is no results found...
//
//    geocoder.geocode( { 'address': address}, function(results, status) {
//
//        if (status == google.maps.GeocoderStatus.OK) {
//            var latitude = results[0].geometry.location.lat();
//            var longitude = results[0].geometry.location.lng();
//            $('#product_lat').val(latitude);
//            $('#product_lon').val(longitude);
//        }
//    });
//}

$(document).ready(function() {

    $('#loginLink').click(function() {
        login();
    });

    $('#submitLink').click(function() {
        review();
    });

//    $('#geolocate').click(function() {
//        getGeoValues($('#product_address').val());
//    });

});