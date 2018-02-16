$(function() {
  var starCount = $(".movie-detail__review-rate").data("review-rate");
  var starCountToF = (starCount / 10).toFixed(1)
  if(starCount > 1) {
    var htmlStar = `<span class="rate rate-${starCount}"></span>
                    <span class="review-rate-ave">${starCountToF}</span>`
  } else {
    var htmlStar = `<span class="rate rate-0"></span>
                    <span class="review-rate-ave"> - </span>`
  }
  $(".movie-detail__review-rate").append(htmlStar)
});
