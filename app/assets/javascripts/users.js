$(function(){
  // 自己紹介の文字数を数える
  let text_max = 300;

  $(".FormField__input--width").on('keyup', function(){
    $(".count_number").text(text_max - $(this).val().length + '文字');

    // ifで10以下なら文字の色分け
    let text_length = $(this).val().length
    let countdown = text_max - text_length
    if(countdown <= 10){
      $('.count_number').css({
        color:'#ff0000',
      });
    } else {
      $('.count_number').css({
          color:'#000000',
          fontWeight:'normal'
      });
    }
  });
});