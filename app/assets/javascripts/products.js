function disableReview() {

}

function enableReview() {
   $('.review.login').hide();
}

function login() {
    FB.login(function(response) {
        if (response.authResponse) {
            // connected
            enableReview();
        } else {
            // cancelled
            disableReview();
        }
    });
}

$(document).ready(function() {
    $('#loginLink').click(function() {
        login();
    });
});