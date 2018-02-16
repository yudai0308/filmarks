$(function(){
  function buildHTML1(data){
  var html1 = `<a class="clip-movie-btn1" data-clip-id="${data.movie_id}" data-clip-url="/movies/${data.movie_id}/clips/${data.clip_id}">
                <i class="fa fa-paperclip fa-2x fa-flip-horizontal">
                </i>
                <p>
                  ${data.movie_users_length}
                </p>
              </a>`
  return html1;
  }
  function buildHTML2(data){
    var html2 = `<a class="clip-movie-btn2" data-clip-id="${data.movie_id}" data-clip-url="/movies/${data.movie_id}/clips">
                  <i class="fa fa-paperclip fa-2x fa-flip-horizontal">
                  </i>
                  <p>
                    ${data.movie_users_length}
                  </p>
                </a>`
  return html2;
  }
  $(document).on('click', '.clip-movie-btn2', function(e){
    // alert();
    e.preventDefault();
    var id = $('.clip-movie-btn2').data('clip-id');
    var url = $('.clip-movie-btn2').data('clip-url');
    console.log(url),
    $.ajax({
      url: url,
      type: "POST",
      data: { movie_id: id },
      dataType: 'json',
    })
    .done(function(data){
      var html1 = buildHTML1(data)
      $('.clip-movie-btn2').replaceWith( html1 );
    })
    .fail(function(){
      alert('error');
    })
    // return false;
  })
  $(document).on('click', '.clip-movie-btn1', function(e){
    // alert();
    e.preventDefault();
    var id = $('.clip-movie-btn1').data('clip-id');
    var url = $('.clip-movie-btn1').data('clip-url');
    console.log(url),
    $.ajax({
      url: url,
      type: "DELETE",
      data: { movie_id: id },
      dataType: 'json',
    })
    .done(function(data){
      var html2 = buildHTML2(data)
      $('.clip-movie-btn1').replaceWith( html2 );
    })
    .fail(function(){
      alert('error');
    })
    // return false;
  })
});
