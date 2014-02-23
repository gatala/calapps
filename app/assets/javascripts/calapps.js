$(document).ready(function(){
  var is_admin = $('#is-admin').attr("data-is-admin");

  if (is_admin == "true") {
    $('#toolbar a:last').tab('show');
    $('#toolbar a:last').addClass('active');
  }
  else {
    $('#toolbar a:first').tab('show');
    $('#toolbar a:first').addClass('active');
  }

  $(document).on('click', '#toolbar a:not(.active)', function() {
    $('#toolbar a').toggleClass('active');
  });

  $("#calapp_tag_list").select2({tags:$('#calapp_tag_list').data('all')});
  
  setTimeout(function(){
    $('#flash').slideUp();
  }, 3000);

});


