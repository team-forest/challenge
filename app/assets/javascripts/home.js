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

$(document).ready(function() {
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

  $('.send').click(function() {
    $('#difficulty').val($(this).data('difficulty'));
    $('#name').val($(this).data('name'));
    $('#modalName').text($(this).data('name'));
  });

  $('.send-challenge').click(function() {
    $('#user_id').val($(this).data('user-id')); 
    $('#sendForm').submit();
  });

  $('.done').click(function() {
    var msg = '<span class="status completed">Completed</span>'; 
    var id = $(this).data('id');

    $.ajax({
      url: '/done',
      type: "GET",
      data: {id: id},
      success: function(data){
        $('#progress').html(msg); 
      }
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
});
