$(function() {

  $('.js-index-table tbody tr').hover(function() {
    $('button.td-action-button').css('visibility', 'hidden');
    $(this).find('button.td-action-button').css('visibility', 'visible');
  }, function() {
    $(this).find('button.td-action-button').css('visibility', 'hidden');
  });
});