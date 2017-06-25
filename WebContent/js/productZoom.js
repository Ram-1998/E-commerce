/**
 * 
 */

$(document).ready(function(){
	
	var divOffset = $("#zoom").offset();
	
	$("#zoom").mousemove(function(event){
		
		var top = event.pageY - divOffset.top;
		var left = event.pageX - divOffset.left;
		
		$("#zoom .zoomed").css({
			"opacity" : "1",
			"top" : "-"+top+"px",
			"left" : "-"+left+"px"
		});

	}).mouseleave(function(){
		$("#zoom .zoomed").css("opacity","0");
	});
});