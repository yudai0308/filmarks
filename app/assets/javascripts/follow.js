$(function(){
  $(document).on("click",'.unfollow-btn',function(e){
    e.stopPropagation();
    e.preventDefault();
    var btn = $(this);
    var element = $(this).parent();
    var url = element.attr('href');
    $.ajax({
      url: url,
      type: "POST",
      data: "",
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      $(btn).removeClass('unfollow-btn').addClass('follow-btn')
      $(element).attr('href', `/users/${data.active_user_id}/relationships/${data.passive_user_id}`)
      $(`#followers-count_userid${data.passive_user_id}`).text(data.passive_count)
      if ($(`#followings-count_userid${data.active_user_id}`).length){
        $(`#followings-count_userid${data.active_user_id}`).text(data.active_count)
      }
    })
    .fail(function(){
      alert('通信に失敗しました。更新ボタンを押してリロードして下さい。');
    });
  });
});

$(function(){
  $(document).on("click",'.follow-btn',function(e){
    e.stopPropagation();
    e.preventDefault();
    var btn = $(this);
    var element = $(this).parent();
    var url = element.attr('href');
    $.ajax({
      url: url,
      type: "DELETE",
      data:"",
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      $(btn).removeClass('follow-btn').addClass('unfollow-btn')
      $(element).attr('href', `/users/${data.active_user_id}/relationships/?followed_id=${data.passive_user_id}`)
      $(`#followers-count_userid${data.passive_user_id}`).text(data.passive_count)
      if ($(`#followings-count_userid${data.active_user_id}`).length){
        $(`#followings-count_userid${data.active_user_id}`).text(data.active_count)
      }
    })
    .fail(function(){
      alert('通信に失敗しました。更新ボタンを押してリロードして下さい。');
    });
  });
});
