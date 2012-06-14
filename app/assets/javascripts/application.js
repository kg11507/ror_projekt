// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require datatables/jquery.dataTables
//= require_tree .
//= require rails.validations


$(function() {
    $( "#example_publish_date" ).datepicker({
        dateFormat: "yy-mm-dd"
    });
});

$(function() {
    $( "#example_buy_date" ).datepicker({
        dateFormat: "yy-mm-dd"
    });
});

