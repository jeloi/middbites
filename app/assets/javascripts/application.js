// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require foundation
//= require jquery_nested_form
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });

var id; // Global variable
var screen_width = $(window).width();
$(window).resize(function() {
    clearTimeout(id);
    id = setTimeout(
    	doneResizing, 800);
    
});

// Resize functionality after its done resizing
function doneResizing(){
	// if the width of the window changed only
	if ($(window).width() != screen_width) {
		$('.ingredient-fields').css("transform","translateX("+0+"px)");
		screen_width = $(window).width();
	};
	console.log("Window Resized");
}