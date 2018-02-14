$(function() {
  var starCount = $(".movie-detail__review-rate").data("review-rate");
  var starCountToF = (starCount / 10).toFixed(1)
  var htmlStar = `<span class="rate rate-${starCount}"></span>
                  <span class="review-rate-ave">${starCountToF}</span>`
  $(".movie-detail__review-rate").append(htmlStar)
});
