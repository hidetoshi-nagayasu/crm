
/**
 * 定義
 */

// 都道府県
const pref_array = [
  {cd:"1", label:"北海道"},
  {cd:"2", label:"青森県"},
  {cd:"3", label:"岩手県"},
  {cd:"4", label:"宮城県"},
  {cd:"5", label:"秋田県"},
  {cd:"6", label:"山形県"},
  {cd:"7", label:"福島県"},
  {cd:"8", label:"茨城県"},
  {cd:"9", label:"栃木県"},
  {cd:"10", label:"群馬県"},
  {cd:"11", label:"埼玉県"},
  {cd:"12", label:"千葉県"},
  {cd:"13", label:"東京都"},
  {cd:"14", label:"神奈川県"},
  {cd:"15", label:"新潟県"},
  {cd:"16", label:"富山県"},
  {cd:"17", label:"石川県"},
  {cd:"18", label:"福井県"},
  {cd:"19", label:"山梨県"},
  {cd:"20", label:"長野県"},
  {cd:"21", label:"岐阜県"},
  {cd:"22", label:"静岡県"},
  {cd:"23", label:"愛知県"},
  {cd:"24", label:"三重県"},
  {cd:"25", label:"滋賀県"},
  {cd:"26", label:"京都府"},
  {cd:"27", label:"大阪府"},
  {cd:"28", label:"兵庫県"},
  {cd:"29", label:"奈良県"},
  {cd:"30", label:"和歌山県"},
  {cd:"31", label:"鳥取県"},
  {cd:"32", label:"島根県"},
  {cd:"33", label:"岡山県"},
  {cd:"34", label:"広島県"},
  {cd:"35", label:"山口県"},
  {cd:"36", label:"徳島県"},
  {cd:"37", label:"香川県"},
  {cd:"38", label:"愛媛県"},
  {cd:"39", label:"高知県"},
  {cd:"40", label:"福岡県"},
  {cd:"41", label:"佐賀県"},
  {cd:"42", label:"長崎県"},
  {cd:"43", label:"熊本県"},
  {cd:"44", label:"大分県"},
  {cd:"45", label:"宮崎県"},
  {cd:"46", label:"鹿児島県"},
  {cd:"47", label:"沖縄県"}
];


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


/**
 * 性別ラジオボタンの切り替え
 */
const addClassGenderRadio = () => {
  const CHECKED = 'checked';

  $('.label-gender-radio').on('click', function() {
    let isChecked = $(this).prop('checked');

    if(!isChecked) {
      $('.label-gender-radio').removeClass(CHECKED);
      $(this).addClass(CHECKED);
    }
  });
}


/**
 * 都道府県のプルダウン作成
 */
const createPrefecturePullDown = () => {
  let $select = $('.js-pref-pulldown');
  
  for(let i = 0; i < pref_array.length; i++) {
    let $option = $('<option>').attr('value', pref_array[i]['cd']).text(pref_array[i]['label']);
    console.log($option);
    $select.append($option);
  }
}

$(function() {

  toggleSidebar();

  showTableAction();

  setDeleteId();

  executeDelete();

  addClassGenderRadio();

  createPrefecturePullDown();
});
