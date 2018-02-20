$(function() {
  $(document).on("click", ".comment-post-form__status", function() {
    if($(".comment-status").val() == 0) {
      $(".comment-status").val(1);
      $(this).css({"color": "White", "background-color": "Red"});
    } else {
      $(".comment-status").val(0);
      $(this).css({"color": "Dimgray", "background-color": "#eee"});
    };
  });
});

$(function() {
  autosize(document.querySelectorAll('textarea'));
})
