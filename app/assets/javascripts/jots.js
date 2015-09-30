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
      $('#new-jot').focus();
    }
  });

   $('#new-jot-btn').click(function() {
    $('#jot-focus').slideDown('400');
   });

   $('#jot-close-btn').click(function() {
    $('#jot-focus').slideUp('400');
   });
});

