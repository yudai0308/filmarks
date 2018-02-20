$(function() {
  function displayReviewPostForm(ele) {
    ele.css({"display": "inline"})
    $(".review-editer__score-slider").attr("max", 50);
  }

  // ----- レビューウィンドウの表示 -----
  $(".post-review-btn").on("click", function(e) {
    e.preventDefault();
    var reviewPostForm = $(".new_review")
    displayReviewPostForm(reviewPostForm);
  });

  $(".list-content__mark").on("click", function(e) {
    e.preventDefault();
    var reviewPostForm = $(this).parents("a").siblings("form");
    displayReviewPostForm(reviewPostForm);
  });

  // ----- レビューウィンドウを閉じる -----
  $(document).on("click", ".review-background", function() {
    $(".new_review").css({"display": "none"})
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

  // ----- 全てのタグに # をつける -----
  $(document).on("keydown", ".review-editer__tags-input", function() {
    // var formCSS = $(this).parents(".new_review").css("display")
    // if(formCSS == "inline") {
    //   var tags = $(".review-editer__tags-input").val().replace(/　/g, " ").split(" ");
    //   var tagsWithSharp = tags.map(function(ele) {
    //     if(ele.match(/^#+.*/)) {
    //       ele = ele.replace(/^#+(.*)/, "$1")
    //     }
    //     return "#" + ele
    //   });
    //   var tagsToString = tagsWithSharp.join(" ");
    //   $(this).val(tagsToString);
    // };
  });

  // ----- ネタバレ禁止の処理 -----
  $(document).on("click", ".review-editer__status-botton", function() {
    if($(".review-status").val() == 0) {
      $(".review-status").val(1);
      $(this).css({"color": "White", "background-color": "Red"});
    } else {
      $(".review-status").val(0);
      $(this).css({"color": "Dimgray", "background-color": "#eee"});
    };
  });
});
