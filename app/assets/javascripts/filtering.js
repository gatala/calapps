$(document).ready(function(){

  $(document).on('click', '#filter-btn', function() {
    $('#filter-btn').toggleClass('hide-btn');
    $('#filter-section').toggleClass('hide');
  });

  $(document).on('click', '#filter-btn.hide-btn', function() {
    $('#filter-btn').html("Hide Filters \
      <i><div class ='fa fa-caret-up caret-icon'></div></i>");
  });

  $(document).on('click', '#filter-btn:not(.hide-btn)', function() {
    $('#filter-btn').html("Show Filters \
      <i><div class ='fa fa-caret-down caret-icon'></div></i>");
  });

})