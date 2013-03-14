var recent_page =1;
var last_record_timestamp='' ;
var rootURL = location.protocol+'//'+location.host+'/';
var homeURL = rootURL+'home';

function fetch_recent_posts(div) {
	url= "/home/recentposts";
	if(last_record_timestamp != ''){
		url += '?timestamp=' +last_record_timestamp

	}

	$.ajax({
		url: url,
		cache: false,
		success: function(html){
			if (recent_page ==1){
				div.html(html);
			}else{
				div.prepend(html);
			}
			recent_page++;
		}
	});// end of .ajax calls

}

$(function(){
	
	if($(location).attr('href') == rootURL){
		fetch_recent_posts($('#recent_posts'));
	}		
	
	// Add click event to a DIV
	$("#recent_load_more").click(function(e){
		e.preventDefault();
		fetch_recent_posts($('#recent_posts'));
	});

	$("#recent_load_more").hide();

});