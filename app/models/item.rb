require 'category'
class Item < ActiveRecord::Base
  has_and_belongs_to_many :styles

    
  def search
    categories = [ "womens-clothes",  "womens-athletic-clothes", "womens-pants", "womens-tops"]
    trendy_array = [{:id=>"108", :name=>"asos"}, {:id=>"483", :name=>"topshop"}, {:id=>"205", :name=>"mango"}, {:id=>"36", :name=>"forever 21"}, {:id=>"374", :name=>"dsw"}, {:id=>"249", :name=>"aldo"}, {:id=>"1465", :name=>"dorothy perkins"}]

    retailer_ids = trendy_array.map { |retailer| "fl=r#{retailer[:id]}" }
    retailer = retailer_ids.join('&')
    size = "fl=s#{@size_code}"

    url = "http://api.shopstyle.com/api/v2/"
    id = ENV.fetch('SHOPSTYLE_ID')
    term = "jumpsuit"
    term = term.gsub(' ', '+')
    max = "75"
    price = "fl=p5:#{max}"
    url += "products?#{id}&#{retailer}&fts=#{term}&#{size}&#{price}"

    result = HTTParty.get(url)
    @packaged_results = result['products'].map do |item|
     { name:      item['brandedName'], 
       url:       item['clickUrl'], 
       image_url: item['image']['sizes'].fetch('IPhone')['url'],
       price:     "#{item['priceLabel']} #{item['currency']}"
     }
    end   

    results = @packaged_results.map do |result|
      Item.create(
        description: result['name'], 
        image_url:   result['image_url'], 
        url:         result['url'], 
        price:       result['price']
        )
    end  

#result = HTTParty.get("http://api.shopstyle.com/api/v2/products?pid=uid9636-25025806-0&fl=r249&fl=r108&fl=r1465&fts=sundress&fl=s81")
#    @packaged_results = result['products'].map do |item|
#     { name: item['brandedName'], url: item['clickUrl'], 
#       image_url: item['image']['sizes'].fetch('IPhone')['url'],
#       price: "#{item['priceLabel']} #{item['currency']}" }
#    end   #

#    results = @packaged_results.map do |result|
#      Item.create(description: result[:name], image_url: result[:image_url], url: result[:url], price: result[:price])
#    end

  end

end

sizes = [
  {xxs: '79'},
  {xs:  '81'},
  {s:   '83'},
  {m:   '85'},
  {l:   '87'},
  {xl:  '89'}]
