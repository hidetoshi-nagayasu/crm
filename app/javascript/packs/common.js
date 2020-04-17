
/**
 * サイドバーのClose切り替え
 */
const toggleSidebar = () => {
  
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
}


/**
 * 一覧テーブル内アクションメニューの表示切り替え
 */
const showTableAction = () => {
  $('.js-index-table tbody tr').hover(function() {
    $('button.td-action-button').css('visibility', 'hidden');
    $(this).find('button.td-action-button').css('visibility', 'visible');
  }, function() {
    $(this).find('button.td-action-button').css('visibility', 'hidden');
  });
}


/**
 * Deleteボタン押下時に対象IDをModalに持たせる
 */
const setDeleteId = () => {
  $('.js-delete-button').on('click', function() {
    let id = $(this).data('id');
    $('.js-delete-execute').data('id', id);
  });
}

/**
 * 削除実行
 */
const executeDelete = () => {
  $('.js-delete-execute').on('click', function() {
    const id = $(this).data('id');
    const url = location.href + '/' + id;
    const method = 'DELETE';

    $.ajax({
      url: url,
      method: method
    })
    .done( () => {

    })
    .fail( () => {
      console.log('error');
    });
  });
}

$(function() {

  toggleSidebar();

  showTableAction();

  setDeleteId();

  executeDelete();
});
