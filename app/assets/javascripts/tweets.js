function trendFeed() {
  $('.tweets').hide();
  $.ajax({
    url: '/items/new.json',
    method: 'get',
    dataType: 'json',
    success: function(data) {
      var tweets = _.sample(data, 5);
      _.each(tweets, function(tweet) {
        var tweetPara = $('<p>').append(tweet);
        $('.tweets').append(tweetPara);
      });
      $('.tweets').toggle('slide');
    }
  });
}


