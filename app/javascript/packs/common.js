$(function() {

  /**
   * サイドバーのClose切り替え
   */
  $('button.js-sidebar-toggle').on('click', function() {

    const CLASS_CLOSE = 'close';
    const $sidebar = $('#sidebar');
    const isClosed = $sidebar.hasClass(CLASS_CLOSE);

    if(isClosed) {
      $sidebar.removeClass(CLASS_CLOSE);
    } else {
      $sidebar.addClass(CLASS_CLOSE);
    }
  });


  /**
   * 一覧テーブル内アクションメニューの表示切り替え
   */
  $('.js-index-table tbody tr').hover(function() {
    $('button.td-action-button').css('visibility', 'hidden');
    $(this).find('button.td-action-button').css('visibility', 'visible');
  }, function() {
    $(this).find('button.td-action-button').css('visibility', 'hidden');
  });

});