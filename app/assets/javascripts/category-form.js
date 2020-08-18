$(function(){
  function appendOption(category){ // optionの作成
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML){ // 子セレクトボックスのhtml作成
    var childSelectHtml = '';
      childSelectHtml = `<div class='item-select-wrapper' id= 'children_wrapper'>
                        <select id="child_category" name="item[category_id]" class="Sale__selectForm">
                        <option value="---">---</option>
                        ${insertHTML}
                        </select>
                        </div>`;
    $('.category_select-children').append(childSelectHtml);
  }
  function appendGrandChildrenBox(insertHTML){ // 孫セレクトボックスのhtml作成
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class='item-select-wrapper' id= 'grandchildren_wrapper'>
                              <select id="grandchild_category" name="item[category_id]" class="Sale__selectForm">
                              <option value="---">---</option>
                              ${insertHTML} 
                              </select>
                              </div>`;
    $('.category_select-grandchildren').append(grandchildrenSelectHtml);
  }



  $(document).on('change', '#parent_category', function(){  // 親セレクトボックスの選択肢を変えたらイベント発火
    $('.selected_child_category').remove();
    $('.selected_grandchild_category').remove();
    var parent_category_id = document.getElementById('parent_category').value; 
  // ↑ parent_category_idに選択した親のvalueを代入
    if (parent_category_id != ''){
 // ↑ parent_category_idが空ではない場合のみAjax通信を行う｡選択肢を初期選択肢'---'に変えると､通信失敗となってしまうため｡
      $.ajax({
        url: `/items/${parent_category_id}/category_children`,
        type: 'GET',
        data: { parent_id: parent_category_id },
        dataType: 'json'
      })
      .done(function(children){  // 送られてきたデータをchildrenに代入
        var insertHTML = '';
        children.forEach(function(child){  
  // forEachでchildに一つずつデータを代入｡子のoptionが一つずつ作成される｡
          insertHTML += appendOption(child); 
        });
        appendChildrenBox(insertHTML); 
        $(document).on('change', '#parent_category', function(){
  // 通信成功時に親の選択肢を変えたらイベント発火｡子と孫を削除｡selectのidにかけるのではなく､親要素にかけないと残ってしまう
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');

      })
    }
  });


  // document､もしくは親を指定しないと発火しない
  $(document).on('change', '#child_category', function(){
    $('.selected_grandchild_category').remove();
    var child_category_id = document.getElementById('child_category').value;
    if (child_category_id != ''){
    $.ajax ({
      url: `/items/${child_category.id}/category_grandchildren`,
      type: 'GET',
      data: { child_id: child_category_id },
      dataType: 'json'
    })
    .done(function(grandchildren){
      var insertHTML = '';
      grandchildren.forEach(function(grandchild){
        insertHTML += appendOption(grandchild);
        });
        appendGrandChildrenBox(insertHTML);  
        $(document).on('change', '#child_category',function(){
          $('#grandchildren_wrapper').remove();
          })
        })  
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
    }
  });
});
