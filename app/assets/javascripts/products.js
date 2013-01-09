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

function getGeoValues(address) {
    var geocoder = new google.maps.Geocoder();

    geocoder.geocode( { 'address': address}, function(results, status) {

        if (status == google.maps.GeocoderStatus.OK) {
            var latitude = results[0].geometry.location.lat();
            var longitude = results[0].geometry.location.lng();
            $('#product_lat').val(latitude);
            $('#product_lon').val(longitude);
        }
    });
}

$(document).ready(function() {

    $('#loginLink').click(function() {
        login();
    });

    $('#submitLink').click(function() {
        review();
    });

    $('#geolocate').click(function() {
        getGeoValues($('#product_address').val());
    });

});