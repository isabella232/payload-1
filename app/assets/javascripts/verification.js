// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('select.dropdown')
    .dropdown();

$('.ui.accordion')
    .accordion();

// hide the bank_name override
$('.bank-name-override').hide();

// Show the bank_name override when Other is selected
$('.bank-name').on('change', function() {
    if ($('.bank-name :selected').text() == 'Other') {
        $('.bank-name-override').show();
        $('.bank-name').hide();
    } else {
        $('.bank-name-override').hide();
    }
});
