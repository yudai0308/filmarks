$(function(){
  $(document).on("click",'.unfollow-btn',function(e){
    e.stopPropagation();
    e.preventDefault();
    $(this).removeClass('unfollow-btn').addClass('follow-btn')
    console.log('followした')
    var link = $(this).parent();
    var url = link.attr('href');
    var m = link.attr('method');
    var data = link.data
    console.log(link)
    console.log(url)
    console.log(m)
    console.log(data)

    $.ajax({
      url: url,
      type: "POST",
      processData: false,
      contentType: false
    });
  });
});

$(function(){
  $(document).on("click",'.follow-btn',function(e){
    e.stopPropagation();
    e.preventDefault();
    $(this).removeClass('follow-btn').addClass('unfollow-btn')
    console.log('unfollowした');
    var link = $(this).parent();
    var url = link.attr('href');
    var m = link.attr('method');
    var data = link.data
    console.log(link)
    console.log(url)
    console.log(m)
    console.log(data)

    $.ajax({
      url: url,
      type: "DELETE",
      processData: false,
      contentType: false
    });


  });
});
