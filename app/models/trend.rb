class Trend < ActiveRecord::Base

  def self.find
    url = "http://api.nytimes.com/svc/mostpopular/v2/mostemailed/fashion/30?offset=20&api-key=3f2ea559f5dff249d1ab987e6d22b902:4:69398956"
    response = HTTParty.get(url)

    content_array = response['results'].map do |result|
      { title: result['title'],
        abstract: result['abstract'] }
    end

  end  
end


response.keys = ["status", "copyright", "num_results", "results"]

response['num_results'] 33
response['results']

response['results'][0]['adx_keywords'] 
["url", "adx_keywords", "column", "section", "byline", "type", "title", "abstract", "published_date", "source", "id", "asset_id", "views", "des_facet", "org_facet", "per_facet", "geo_facet", "media"]

url = "http://www.elle.com/fashion/trend-reports/"
raw = HTTParty.get(url)
