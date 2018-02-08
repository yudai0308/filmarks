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
