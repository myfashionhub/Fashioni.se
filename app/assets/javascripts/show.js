function itemHover() {
  $('.closet a').mouseenter(function(e) {
    var text = $(e.target).parent().find('div');
    text.css('visibility', 'visible');
  });

  $('.closet a').mouseleave(function(e) {
    var text = $(e.target).parent().find('div');
    text.css('visibility', 'hidden');
  });
}
