jQuery(function($){
    $('input[type="tel"]').mask("9999 - 999-999");
    $('.leads select').attr("required", "required")

    var validator = $("#new_lead").validate();

    $('#new_lead-form').submit(function() {
        var form = $(this);
        var valid = form.valid();
        var tel = $('#tel').val();

        if (tel == "____ - ___-___" || tel.length != "____ - ___-___".length) {
            valid = false;
        }
    });
});
