$(document).ready(function() {
	$('.story-textarea').on('keydown keyup blur focus', function() { 				
		var char_delta = 300 - $(this).val().length;		
		$('.char-count').text( char_delta )

		if (char_delta < 0) {
			$('.story-textarea-label').css('color', 'red');
		} else {
			$('.story-textarea-label').css('color', 'black');
		}
		
	});
})