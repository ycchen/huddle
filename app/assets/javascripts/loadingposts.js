var recent_page =1;
var rootURL = location.protocol+'//'+location.host+'/';
function fetch_recent_posts(div) {
	$.ajax({
		url: "/home/recentposts",
		cache: false,
		success: function(html){
			if (recent_page ==1){
				div.html(html);
			}else{
				div.append(html);
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