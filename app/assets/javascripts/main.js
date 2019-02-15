// ロゴマークをスクロールすると変化させる
$(function() {
  var $win = $(window),
      $header = $('.blog-header-logo'),
      animationClass = 'is-animation';

  $win.on('load scroll', function() {
    var value = $(this).scrollTop();
    if ( value > 100 ) {
      $header.addClass(animationClass);
    } else {
      $header.removeClass(animationClass);
    }
  });
});

// マークダウンプレビュー
window.onload = function() {
  new Vue({
    el: '#editor',
    data: {
      input: '### Mark Down記法が使えます。',
    },
    filters: {
      marked: marked,
    },
  });
};
