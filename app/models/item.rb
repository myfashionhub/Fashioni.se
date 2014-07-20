class Item < ActiveRecord::Base
  has_and_belongs_to_many :styles
  has_and_belongs_to_many :fashionistas

  def self.search_api(term, category, retailers, size_code, max, sort)
    url      = "http://api.shopstyle.com/api/v2/"
    id = ENV.fetch('SHOPSTYLE_ID')
    term     = term.gsub(' ','+')
    size     = "&fl=s#{size_code}"
    price    = "&fl=p10:#{max}"
    sort     = "&sort=#{sort}"
    url += "products?pid=#{id}#{retailers}&fts=#{category}#{term}#{size}#{price}"

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


  def self.add(product_id)
    id = ENV.fetch('SHOPSTYLE_ID')
    url = "http://api.shopstyle.com/api/v2/products/#{product_id}?pid=#{id}"
    result = HTTParty.get(url)

    self.create(
                shopstyle_id:result['id'],
                description: result['brandedName'],
                image_url:   result['image']['sizes']['IPhone']['url'],
                url:         result['clickUrl'],
                price:       result['priceLabel']
               )
  end

  def item_params
    # FIXME this method is in the wrong place. It should be in the controller
    # and it should use params.permit().require().
    {
     :shopstyle_id => shopstyle_id,
     :description  => description,
     :image_url    => image_url,
     :url          => url,
     :price        => price
    }
  end

end
