$(function() {
  function buildReviewHTML(reviewURL) {

  var reviewHTML = `<form class="post_review_form" action="${reviewURL}" method="POST">
                      <div class="review-background"></div>
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
                          <div class="review-editer__status-wrapper">
                            <a class="review-editer__status-botton gray-botton" data-status="0">
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
                          <a class="review-editer__botton--post" href="#" onclick="postReview();"> 投稿 </a>
                        </div>
                      </div>
                    </form>`
  return reviewHTML;
  }

  // ----- レビューウィンドウの表示 -----
  $(".post-review-btn").on("click", function() {
    var reviewURL = window.location.href + "/reviews"
    var reviewHTML = buildReviewHTML(reviewURL);
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
  });

  // ----- ネタバレ禁止の処理 -----
  $(document).on("click", ".review-editer__status-botton", function() {
    console.log($(this).attr("status"));
    if($(this).attr("data-status") == "0") {
      $(this).attr("data-status", "1");
      $(this).css({"color": "White", "background-color": "Red"});
    } else {
      $(this).attr("data-status", "0");
      $(this).css({"color": "Dimgray", "background-color": "#eee"});
    };
  });

  // ----- データ送信 -----
  function postReview() {

    var formData = new FormData($(".post_review_form").get()[0]);
    console.log(formData);

  };
  // var reviewRate = $(".review-editer__score-slider").val();
  // var reviewComment = $(".review-editer__review-input").val();
  // var reviewStatus = $
  // var postReviewData = {"comment": "", "score": "", "status": ""}
  // var postTagsData = {""}
});





