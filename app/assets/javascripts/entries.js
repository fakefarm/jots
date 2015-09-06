$(document).ready(function() {

  $('.edit-why').on('click', function(e) {
    var $this = $(this);
    var id = $this.attr('id');
    var box = "#edit_box_" + id;
    $('.edit-box').hide();
    $(box).show();
    // debugger;
  });

});
