$(function(){
  $("#q.l-search-field__query").on("keyup",function(){
    var target = $('#js-search-list')
    var input = $("#q").val();
    var html= ` <ul id="search_lists">
                  <li class="p-header-my-menu__item active">
                    <button name="button" type="submit" class="search__btn" value="movie">
                      <span>「${input}」で映画を検索</span>
                    </button>
                  </li>
                  <li class="p-header-my-menu__item">
                    <button name="button" type="submit" class="search__btn" value="cast">
                      <span>「${input}」でキャストを検索</span>
                    </button>
                  </li>
                  <li class="p-header-my-menu__item">
                    <button name="button" type="submit" class="search__btn" value="user">
                      <span>「${input}」でユーザーを検索</span>
                    </button>
                  </li>
                </ul>`
      $('#search_lists').remove();
    if (input.length !== 0){
      target.append(html)
    }
  });
});
$(function() {
  $('.category-list__hidden').on('click', function() {
    var target_hidden = $(this).prevAll('.hidden');
    var target_open = $(this).prevAll('.open');
    var btn_class = $(this).attr('class');
    var target = $(this).prevAll()
    if (btn_class == 'category-list__hidden readmore arrow-down'){
      $(this).removeClass('readmore').addClass('close');
      $(this).removeClass('arrow-down').addClass('arrow-up');
      $(this).text('閉じる');
      $(target_hidden).removeClass('hidden').addClass('open')
    }else{
      $(this).removeClass('close').addClass('readmore');
      $(this).text('もっと見る');
      $(target_open).removeClass('open').addClass('hidden')
      $(this).removeClass('arrow-up').addClass('arrow-down');
    }
  });
});
