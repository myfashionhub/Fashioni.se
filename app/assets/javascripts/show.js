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

function dropdownMenu() {
  $('#mycloset').mouseenter(function() {
    $('.dropdown').css('display', 'block');
  });
  $('#mycloset').mouseleave(function() {
    $('.dropdown').css('display', 'none');
  });
}
