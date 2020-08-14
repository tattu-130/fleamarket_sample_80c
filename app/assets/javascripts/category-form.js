$("#category_form").change(function () {
  // 選択した親の値を取得する
  let parentValue = $("#category_form").val();
  // 初期値("---")以外を選択したらajaxを開始
  if (parentValue.length != 0) {
    $.ajax({
      url: '/items/search',
      type: 'GET',
      // itemsコントローラーにparamsをparent_idで送る
      data: { parent_id: parentValue },
      dataType: 'json'
    })
      .done(function (data) {
      })
      .fail(function () {
      });
  }
});