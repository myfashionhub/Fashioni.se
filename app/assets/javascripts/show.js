function itemHover() {
  $('.closet a').mouseover(function(e) {
    var text = $(e.target).parent().find('div');
    text.css('visibility', 'visible');
  });

  $('.closet a').mouseout(function(e) {
    var text = $(e.target).parent().find('div');
    text.css('visibility', 'hidden');
  });
}
