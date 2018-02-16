$(function(){
  function buildHTML1(data){
  var html1 = `<button name="button" type="submit" class="fun__btn1" data-fan-id="${data.member_id}" data-fan-url="/members/${data.member_id}/users_members/${data.fan_id}">
                  <image alt="fun_btn-image" src="http://localhost:3000/assets/btn_fan-52c009a40b63ec9e843081d8af90012cb1d174c526a0cd0012d85c7d83f02d76.svg" class="fa fa-paperclip fa-2x">
                </button>`
  return html1;
  }
  function buildHTML2(data){
    var html2 = `<button name="button" type="submit" class="fun__btn2" data-fan-id="${data.member_id}" data-fan-url="/members/${data.member_id}/users_members">
                  <image alt="fun_btn-image" src="http://localhost:3000/assets/btn_fan-52c009a40b63ec9e843081d8af90012cb1d174c526a0cd0012d85c7d83f02d76.svg" class="fa fa-paperclip fa-2x">
                </button>`
  return html2;
  }
  function buildHTML3(data){
    var html3 = `<div class="cast__lists-content-fun__count">
                  <span>
                    Fanが
                    <strong>${data.member_users_length}</strong>
                    人います
                  </span>
                </div>`
  return html3;
  }
  $(document).on('click', '.fun__btn2', function(e){
    // alert();
    e.preventDefault();
    var id = $(this).data('fan-id');
    var url = $(this).data('fan-url');
    var element = $(this);
    var ele = $(this).siblings('.cast__lists-content-fun__count');
    $.ajax({
      url: url,
      type: "POST",
      data: { member_id: id },
      dataType: 'json',
    })
    .done(function(data){
      var html1 = buildHTML1(data);
      var html3 = buildHTML3(data);
      $(element).replaceWith( html1 );
      $(ele).replaceWith( html3 );
    })
    .fail(function(){
      alert('error');
    })
    // return false;
  })
  $(document).on('click', '.fun__btn1', function(e){
    // alert();
    e.preventDefault();
    var id = $(this).data('fan-id');
    var url = $(this).data('fan-url');
    var element = $(this);
    var ele = $(this).siblings('.cast__lists-content-fun__count');
    $.ajax({
      url: url,
      type: "DELETE",
      data: { member_id: id },
      dataType: 'json',
    })
    .done(function(data){
      var html2 = buildHTML2(data);
      var html3 = buildHTML3(data);
      $(element).replaceWith( html2 );
      $(ele).replaceWith( html3 );
    })
    .fail(function(){
      alert('error');
    })
    // return false;
  })
});
