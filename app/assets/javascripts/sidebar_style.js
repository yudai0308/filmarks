$(function() {
  var url = window.location.href
  function changeCSS(i) {
    var html = $(".c-side-menu__items_title").eq(i).children();
    html.css({"color":"#fff",
              "background-color":"#7e7e7e"})
  }

  if (url.match(/\/lists\/now/)) {
    changeCSS(0);
  } else if (url.match(/\/lists\/comming/)) {
    changeCSS(1);
  } else if (url.match(/\/lists\/upcomming/)) {
    changeCSS(2);
  } else if (url.match(/\/lists\/trend/)) {
    changeCSS(3);
  } else if (url.match(/\/lists\/yaer/)) {
    changeCSS(4);
  } else if (url.match(/\/lists\/country/)) {
    changeCSS(5);
  } else if (url.match(/\/lists\/genre/)) {
    changeCSS(6);
  } else if (url.match(/\/lists\/tag/)) {
    changeCSS(7);
  }
});
