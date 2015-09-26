function dropdownMenu() {
  $('#mycloset').mouseenter(function() {
    $('.dropdown').css('display', 'block');
  });
  $('#mycloset').mouseleave(function() {
    $('.dropdown').css('display', 'none');
  });
}
