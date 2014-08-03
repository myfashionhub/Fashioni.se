function trendFeed() {
  console.log('getting feed');
  $.ajax({
    url: '/items/new',
    method: 'get',
    dataType: 'json',
    success: function(data) {
      console.log(data);
      $('.tweets').append(data);
    }
  });
}


