$(function() {
  var reviewHTML =
 `<div class="review-background"></div>
  <div class="review-window">
    <div class="review-editer__header"> レビュー </div>
    <div class="review-editer__score">
      <div class="review-editer__score-rate"> スコア </div>
      <div class="review-editer__score-slider"></div>
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

  $(".post-review-btn").on("click", function() {
    $(".post-review-btn").after(reviewHTML)
  });

  $(document).on("click", ".review-background", function() {
    $(".review-background").remove();
    $(".review-window").remove();
  })
});
