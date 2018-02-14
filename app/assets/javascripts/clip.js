$(function(){
  function buildHTML3(data){
  var html3 = `<a class="clip-movie-btn3" data-clip-id="${data.movie_id}" data-clip-url="/movies/${data.movie_id}/clips/${data.clip_id}">
                <div class="list-content__clip">
                  <i class="fa fa-paperclip fa-2x fa-flip-horizontal">
                  </i>
                  <p class="clip__count">
                    ${data.movie_users_length}
                  </p>
                </div>
              </a>`
  return html3;
  }
  function buildHTML4(data){
    var html4 = `<a class="clip-movie-btn4" data-clip-id="${data.movie_id}" data-clip-url="/movies/${data.movie_id}/clips">
                  <div class="list-content__clip">
                    <i class="fa fa-paperclip fa-2x fa-flip-horizontal">
                    </i>
                    <p class="clip__count">
                      ${data.movie_users_length}
                    </p>
                  </div>
                </a>`
  return html4;
  }
  $(document).on('click', '.clip-movie-btn4', function(e){
    // alert();
    e.preventDefault();
    var id = $(this).data('clip-id');
    var url = $(this).data('clip-url');
    var element = $(this);
    console.log(element),
    $.ajax({
      url: url,
      type: "POST",
      data: { movie_id: id },
      dataType: 'json',
    })
    .done(function(data){
      var html3 = buildHTML3(data);
      console.log(this),
      $(element).replaceWith( html3 );
    })
    .fail(function(){
      alert('error');
    })
    // return false;
  })
  $(document).on('click', '.clip-movie-btn3', function(e){
    // alert();
    e.preventDefault();
    var id = $(this).data('clip-id');
    var url = $(this).data('clip-url');
    var element = $(this);
    console.log(element),
    $.ajax({
      url: url,
      type: "DELETE",
      data: { movie_id: id },
      dataType: 'json',
    })
    .done(function(data){
      var html4 = buildHTML4(data);
      console.log(this),
      $(element).replaceWith( html4 );
    })
    .fail(function(){
      alert('error');
    })
    // return false;
  })
});
