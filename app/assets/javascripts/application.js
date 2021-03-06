// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

function success_notify(msg) {
	$('.alert-success').html(msg).slideDown('slow').delay(2000).slideUp('slow');
}

function error_notify(msg) {
	$('.alert-error').html(msg).slideDown('slow').delay(2000).slideUp('slow');
}

function get_post() {
	get_last_post();
	last_record_timestamp = $('span.light-span').first().data("timestamp");
	fetch_recent_posts($('#recent_posts'));

}

function get_last_post(){
	
	$("body").delegate('span.light-span','click',function(){
		lastspan = $('span.light-span').first().data("id");
	});
}

$(function(){
	
	$('.alert').delay(5000).slideUp('slow');

	if($(location).attr('href') == rootURL){
		get_last_post();	
		setInterval(function(){get_post()}, 30000);
	}

	
});

