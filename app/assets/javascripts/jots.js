$(document).ready(function() {

  $('.edit-why').on('click', function(e) {
    var $this = $(this);
    var id = $this.attr('id');
    var box = "#edit_box_" + id;
    $('.edit-box').hide();
    $(box).show();
  });

  $("body").keypress(function(e){
    if (e.which == 106) {
     $('#jot-focus').slideDown('400');
    }
  });

  $(document).keydown(function(e) {
    if (e.keyCode == 27)  $('#jot-focus').slideUp('400');
  });

  $(document).keydown(function(e) {
    if( $('#jot-focus').css('display') === "none") {
      if (e.keyCode == 84) {
        window.location = '/today';
      } else if (e.keyCode == 65 ){
        window.location = '/archives';
      } else if (e.keyCode == 71 ){
        window.location = '/tags';
      }
    }
  });

   $('#new-jot-btn').click(function() {
    $('#jot-focus').slideDown('400');
    $('#jot-title').focus();
   });

   $('#jot-close-btn').click(function() {
    $('#jot-focus').slideUp('400');
   });


   $('#new-jot__jot-input').keyup(function(event) {
      $('#new-jot__tip').fadeIn();
   });
});



