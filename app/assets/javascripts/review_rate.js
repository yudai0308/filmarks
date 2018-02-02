$(function() {
  var starCount = $(".movie-detail__review-rate").data("review-rate");
  var htmlStar = `<span class="rate rate-${starCount}">`
  $(".movie-detail__review-rate").append(htmlStar)
})
