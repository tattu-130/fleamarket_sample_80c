$(function(){
  // 自己紹介の文字数を数える
  $(".FormField__input--width").on('keyup', function(){
    $(".count").text($(this).val().length + '文字');
  });
});