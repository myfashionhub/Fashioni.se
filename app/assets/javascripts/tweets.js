function trendFeed() {
  $('.tweets').hide();
  $.ajax({
    url: '/items/new.json',
    method: 'get',
    dataType: 'json',
    success: displayFeed,
    error: function(data) { console.log(data); }
  });
}

var getRandomIdx = function(max) {
  return Math.floor(Math.random() * max);
};

function displayFeed(data) {
  var numTweets = 5;
  var tweetIndexes = [];

  // Get 5 random tweets from array
  while (tweetIndexes.length < numTweets) {
    var randomIdx = getRandomIdx(data.length);
    if (tweetIndexes.indexOf(randomIdx) == -1) {
      tweetIndexes.push(randomIdx);
    }
  }

  tweetIndexes.forEach(function(index) {
    var tweet = data[index];
    var tweetEl = $('<p>').append(tweet);
    $('.tweets').append(tweetEl);
  });

  $('.tweets').toggle('slide');
}
