## Fashioni.se

A bookmarking tool for discovering and keeping track of your coveted fashion items.
Fashioni.se customizes search results based on your declared style and lets you filter items by price, popularity and/or recency. Peak inside other fashionistas' closets and steal their style. **[View app](http://fashionize.herokuapp.com/)**

![Fashioni.se homepage](http://nessanguyen.comze.com/file/screenshot.png "Fashioni.se homepage")

### Developer
Fashioni.se utilizes the [Shopstyle API](http://shopsense.shopstyle.com/shopsense/28044754, "Shopstyle API"), a fashion product search engine, to bring customized results.   

It customizes fashionista's search results by passing filter params into the query string, determined by the fashionista's stated style (men's or women's wear, relevant retailers, clothing size) and/or the params they choose at the search (price range, sort by). 

```ruby
  def self.search_api(term, category, retailers, size_code, max, sort)
    url      = "http://api.shopstyle.com/api/v2/"
    id = ENV.fetch('SHOPSTYLE_ID')
    term     = term.gsub(' ','+')
    size     = "&fl=s#{size_code}"
    price    = "&fl=p10:#{max}"
    sort     = "&sort=#{sort}" 
    url += "products?pid=#{id}#{retailers}&fts=#{category}#{term}#{size}#{price}"

    raw_result = HTTParty.get(url)
    results = raw_result['products'].map do |item|
     { shopstyle_id: item['id'],
       name:         item['brandedName'], 
       url:          item['clickUrl'], 
       image_url:    item['image']['sizes'].fetch('IPhone')['url'],
       price:        "#{item['priceLabel']}"
     }
    end
    
    return results
  end    
```    

The user interface is light and easy to use. Fashionistas can see what other users have in their closet and copy items from them.
