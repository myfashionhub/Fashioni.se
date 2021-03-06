class Item < ActiveRecord::Base
  has_and_belongs_to_many :styles
  has_and_belongs_to_many :fashionistas

  def self.search_api(term, category, retailers, size_code, max, sort)
    url      = "http://api.shopstyle.com/api/v2/"
    # TODO: Find a new product API
    id = ENV.fetch('SHOPSTYLE_ID')
    term     = term.gsub(' ','+')
    size     = "&fl=s#{size_code}"
    price    = "&fl=p10:#{max}"
    sort     = "&sort=#{sort}"
    num_results = "&limit=20"
    url += "products?pid=#{id}#{retailers}&fts=#{category}#{term}#{size}#{price}#{num_results}"

    raw_result = HTTParty.get(url)
    raw_result['products'].map do |item|
      {
       shopstyle_id: item['id'],
       name:         item['brandedName'],
       url:          item['clickUrl'],
       image_url:    item['image']['sizes'].fetch('IPhone')['url'],
       price:        item['priceLabel']
      }
  end

  end


  def self.add(product_id, style_id)
    api_key = ENV.fetch('SHOPSTYLE_ID')
    url = "http://api.shopstyle.com/api/v2/products/#{product_id}?pid=#{api_key}"
    result = HTTParty.get(url)

    item = Item.find_or_create_by(shopstyle_id:result['id'],
                description: result['brandedName'],
                image_url:   result['image']['sizes']['IPhone']['url'],
                url:         result['clickUrl'],
                price:       result['priceLabel'],
                style_id:    style_id
               )
  end

end
