$(function(){
  // 編集画面表示時、プレビューが5枚あったらラベルを隠す
  let countEditPreviews = $('.previewBox').length;
  if (countEditPreviews >= 5){
    $('.dropBox').hide();
  }
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[item_imgs_attributes][${index}][src]"
                    id="item_item_imgs_attributes_${index}_src"><br>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class=previewBox><img data-index="${index}" src="${url}" width="100px" height="100px"><div class=js-remove-previews>削除</div></div>`;
    // プレビューが5枚あったらラベルを隠す
    let count = $('.previewBox').length;
    if (count == 4){
      $('.dropBox').hide();
    }
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').prepend(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  // 新規出品時にプレビュー直下に削除ボタンを設置
  $('#previews').on('click', '.js-remove-previews', function() {
    const targetIndex = $(this).prev().data('index')
    $(this).parent().remove();
    $(`.js-file_group[data-index="${targetIndex}"]`).remove();
    // プレビューが4枚以下ならラベルを表示
    let count = $('.previewBox').length;
    if (count < 5){
      $('.dropBox').show();
    }
  });

  // 編集時の削除メソッド
  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).prev().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    // プレビューが4枚以下ならラベルを表示
    let count = $('.previewBox').length;
    if (count < 5){
      $('.dropBox').show();
    }

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

  // dropBox押下時にinputを呼び出す
  $('.dropBox').on('click', function() {
    lastIndex = $('.js-file_group:last').children('input')[0];
    $(lastIndex).trigger("click");
  });
});
