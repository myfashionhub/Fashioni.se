require 'httparty'


#  cat_raw = HTTParty.get('http://api.shopstyle.com/api/v2/categories?pid=uid9636-25025806-0')
#  categories = []#

#  cat_raw['categories'].map do |category| 
#    if category['id'].downcase.include? "women" 
#      categories << category['name'] 
#    elsif category['parentId'].downcase.include? "women" 
#      categories << category['name'] 
#    elsif category['name'].downcase.include? "women"
#      categories << category['name'] 
#    else
#      nil   
#    end
#  end  
