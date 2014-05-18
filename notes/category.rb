require 'httparty'


cat_raw = HTTParty.get('http://api.shopstyle.com/api/v2/categories?pid=uid9636-25025806-0')
categories = []
cat_raw['categories'].each do |category| 
  if category['id'].downcase.include? "women" 
    categories << category['parentId'] 
  elsif category['parentId'].downcase.include? "women" 
    categories << category['parentId'] 
  elsif category['name'].downcase.include? "women"
    categories << category['parentId'] # localizedId is more specific
  else
    nil   
  end
end  

categories = [ "womens-clothes",  "womens-athletic-clothes", "womens-pants", "womens-tops"]
