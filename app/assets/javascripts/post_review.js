$(function() {
  var reviewHTML =
 `<div class="review-background"></div>
  <div class="review-window">
    <div class="review-editer__header"> レビュー </div>
    <div class="review-editer__score clearfix">
      <div class="review-editer__score-rate"> - </div>
      <input class="review-editer__score-slider" type="range" name="rate" min="9" max="9" step="1">
    </div>
    <div class="review-editer__input-wrapper">
      <textarea class="review-editer__review-input review-textarea" placeholder="レビューを入力"></textarea>
    </div>
    <div class="review-editer__tags-wrapper">
      <textarea class="review-editer__tags-input review-textarea" placeholder="# タグを入力"></textarea>
    </div>
    <div class="review-editer__bottons-secondary">
      <div class="review-editer__secret-wrapper">
        <a class="review-editer__secret-botton">
          <i class="fa fa-warning"></i>
          <p> ネタバレ </p>
        </a>
        <p class="review-editer__secret-note">
          レビューが映画の内容のネタバレに<br>
          あたる場合はチェックしてください。
        </p>
      </div>
    </div>
    <div class="review-editer__bottons-primary">
      <a class="review-editer__botton--post"> 投稿 </a>
    </div>
  </div>`

  // ----- レビューウィンドウの表示 -----
  $(".post-review-btn").on("click", function() {
    $(".post-review-btn").after(reviewHTML)
    $(".review-editer__score-slider").attr("max", 50);
  });

  // ----- レビューウィンドウを閉じる -----
  $(document).on("click", ".review-background", function() {
    $(".review-background").remove();
    $(".review-window").remove();
  });

  // ----- スコアレンジをドラッグ中の処理 -----
  $(document).on("input", ".review-editer__score-slider", function() {
    var val = $(this).val() / 10;
    if(val < 1) {
      $(".review-editer__score-rate").text("-");
    } else {
      $(".review-editer__score-rate").text(val.toFixed(1));
    };
  });

  // ----- スコア確定後の処理 -----
  $(document).on("change", ".review-editer__score-slider", function() {
    var val = $(this).val() / 10;
    // つまみを 0 に移動させる処理
    // value を空にすることはできないっぽい？
    // value が 0 ~ 0.9 の場合はコントローラ上で空にする？
  });

  function addSharp() {}

  // ----- タグ記入欄の改行禁止 -----
  $(document).on("keydown", ".review-editer__tags-input", function(e) {
    if (e.which == 13) {
      return false;
    }
  });
  $(document).on("blur", ".review-editer__tags-input", function() {
    // 貼りつけられたテキストの改行コードを削除
    var textarea = $(this);
    text = textarea.val();
    new_text = text.replace(/\r?\n/g, " ");
    if (new_text != text) {
      textarea.val(new_text);
    };
  });
  // ----- フォーカスが外れた時、全てのタグに # をつける -----
  $(document).on("blur", ".review-editer__tags-input", function() {
    var tags = $(".review-editer__tags-input").val().replace(/　/g, " ").split(" ");
    var tagsWithSharp = tags.map(function(ele) {
      if(ele.match(/^#+.*/)) {
        ele.replace(/^#+(.*)/, "@")
      }
      return "#" + ele
    });
    var tagsToString = tagsWithSharp.join(" ");
    $(".review-editer__tags-input").val(tagsToString);
  })

  $(document).on("click", ".review-editer__secret-botton", function() {
    ifs
  })
});





