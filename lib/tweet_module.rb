require 'json'

module Tweet
  def self.fetch
    hydra = Typhoeus::Hydra.new
    base_url = 'http://socialtrackr.herokuapp.com/search/'
    sources  = [{ magazine: 'voguemagazine', keyword: 'trend' },
                { magazine: 'ellemagazine', keyword: 'trend' },
                { magazine: 'instyle', keyword: 'trend' },
                { magazine: 'wmag', keyword: 'trend' }
               ]
    requests = sources.map do |source|
      url = base_url + "#{source[:magazine]}/#{source[:keyword]}"
      request = Typhoeus::Request.new(url)
      hydra.queue(request)
      request
    end
    hydra.run

    tweets = []
    requests.map do |request|
      if request.response.code != 200
        tweets.push('Cannot fetch tweets at this time')
      else
        array = JSON.parse(request.response.response_body)
        array.each { |tweet|
          handles = tweet.scan(/@\w+/)
          links   = tweet.scan(/http:\/\/t.co\/\w+/);
          handles.each { |handle| tweet.gsub!(handle, "<span>#{handle}</span>") }
          links.each { |link| tweet.gsub!(link, "<a href='"+link+"' target='_blank'>"+link+"</a>") }
          tweets.push(tweet)
        }

      end
    end
    tweets
  end
end
