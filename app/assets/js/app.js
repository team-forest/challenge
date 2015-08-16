
	//Ghost
	function ghostDown(targetObject){
		$(targetObject)
			.css({display:'block', marginTop:'-6px'})
			.transition({
				opacity:1,
				y:6
			});
	}

	function ghostUp(targetObject){
		$(targetObject)
			.transition({
				opacity:0,
				y:0
			});
	}

	function reduceItem(targetObject){
		$(targetObject)
			.transition({
				scale:0
			});
	}

	function showNotification(){
		$('.notification-list')
			.transition({
				x:'420'
			});
	}
	function hideNotification(){
		$('.notification-list')
			.transition({
				x:'0'
			});
	}
	var notiShown = false;
	$('.show-noti').click(function(){
		if(notiShown){
			hideNotification();
			notiShown = false;
		}else{
			notiShown = true;
			showNotification();
		}
	});
	$('.hide-noti').click(function(){
		hideNotification();
	});

	$('.mark-done').click(function(){
		reduceItem($(this).parent());
		$(this).parent().fadeOut();
	});

	$('.open-modal').click(function(){
		//Fade In Modal
		$('#modal').fadeIn(500);

		//Close modal by pressing X button
		$('.close-modal').click(function(){	
			$('#modal').fadeOut(500);
		});

	});

	//Close modal if user clicks outside the modal
	$('#modal').click(function(){
		$(this).fadeOut(500);
	});
		//Prevent modal from closing when user interact with it
		$('#modal section').click(function(event){
			event.stopPropagation();
		});




	$('a#test').click(function() {
    $('#test').show;
    $(this).text($(this).text() == 'Completed' ? 'Mark as Done' : 'Completed');
    
	});