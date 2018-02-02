$(function() {
  function youtube_search(artist, title) {
    alert("ok");
    window.open("http://www.youtube.com/results?search_query=" + encodeURI(artist) + "+" + encodeURI(title) + "&aq=f");
  };
});
