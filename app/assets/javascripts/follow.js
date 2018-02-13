$(function(){
  $('.user__lists-content-follow__btn.follow-btn').click(function (e) {
    e.preventDefault();
    console.log('followした')
    console.log(this)
  });
});

$(function(){
  $('.user__lists-content-follow__btn.unfollow-btn').click(function (e) {
    e.preventDefault();
    console.log('unfollowした');
    console.log(this)
  });
});
