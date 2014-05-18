class Item < ActiveRecord::Base
  has_and_belongs_to_many :styles
  has_and_belongs_to_many :fashionistas


  def self.search_api(term, retailers, size_code, max)
    id = ENV.fetch('SHOPSTYLE_ID')

    url   = "http://api.shopstyle.com/api/v2/"
    term  = term.gsub(' ','+')
    size  = "fl=s#{size_code}"
    price = "fl=p10:#{max}"
    url += "products?pid=#{id}&#{retailers}&fts=#{term}&#{size}&#{price}"

    raw_result = HTTParty.get(url)
    results = raw_result['products'].map do |item|
     { shopstyle_id: item['id'],
       name:         item['brandedName'], 
       url:          item['clickUrl'], 
       image_url:    item['image']['sizes'].fetch('IPhone')['url'],
       price:        "#{item['priceLabel']} #{item['currency']}"
     }
    end

    return results 
  end


  def self.add(id)  
    results = packaged_results.map do |result|
      self.create(
        description: result['name'], 
        image_url:   result['image_url'], 
        url:         result['url'], 
        price:       result['price']
        )
    end  

  return results
  end

end

