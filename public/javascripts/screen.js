$(document).ready(function() {
	
	Cufon.replace('h2', {
		color: '-linear-gradient(#fff, #c5c5c5)'
	});
	
	Cufon.replace('h3', {
		color: '-linear-gradient(#474747, #171717)'
	});
	
	Cufon.replace('h4', {
		color: '-linear-gradient(#474747, #171717)'
	});
	
	$("div.scrollable").scrollable({ 
	        vertical:true,  
	        size: 3 
	});
	
	$(".image").click(function() {
		var image = $(this).attr("rel");
		$('#slides').fadeOut('slow').queue(function() {
			$('#slides').fadeIn('slow');
			$('#slides').html('<img src="' + image + '"/>');
			$(this).dequeue();
		});
		$(".selected").remove();
		$(this).append('<div class="selected">&nbsp;</div>');
		
		return false;
	});
	
});