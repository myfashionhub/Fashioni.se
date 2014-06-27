cat_raw = HTTParty.get('http://api.shopstyle.com/api/v2/categories?pid=uid9636-25025806-0')
@categories = []
cat_raw['categories'].each do |category|
  if category['id'].downcase.include? "women"
    @categories << category['parentId']
  elsif category['parentId'].downcase.include? "women"
    @categories << category['parentId']
  elsif category['name'].downcase.include? "women"
    @categories << category['parentId']
  else
    nil
  end
end

@categories.uniq!
@categories = ["clothes-shoes-and-jewelry",
               "women",
               "womens-clothes",
               "womens-accessories",
               "womens-eyewear",
               "womens-athletic-clothes",
               "womens-intimates",
               "womens-outerwear",
               "womens-pants",
               "womens-tops",
               "womens-shoes",
               "womens-beauty"]

@child_cat = ["women", "womens-clothes", "womens-accessories", "belts", "gifts", "gift-cards", "gloves", "hats", "scarves", "womens-eyewear", "womens-eyeglasses", "sunglasses", "key-chains", "womens-tech-accessories", "womens-umbrellas", "womens-athletic-clothes", "athletic-jackets", "athletic-pants", "athletic-shorts", "athletic-skirts", "sports-bras-and-underwear", "athletic-tops", "bridal", "jeans", "dresses", "womens-intimates", "bras", "camisoles", "chemises", "gowns", "hosiery", "pajamas", "panties", "robes", "socks", "shapewear", "slippers", "thongs", "jackets", "jewelry", "maternity-clothes", "womens-outerwear", "coats", "fur-and-shearling-coats", "leather-and-suede-coats", "puffer-coats", "raincoats-and-trenchcoats", "wool-coats", "womens-pants", "casual-pants", "cropped-pants", "dress-pants", "leggings", "skinny-pants", "wide-leg-pants", "petites", "plus-sizes", "shorts", "skirts", "womens-suits", "sweaters", "swimsuits", "sweatshirts", "teen-girls-clothes", "womens-tops", "button-front-tops", "camisole-tops", "cashmere-tops", "halter-tops", "longsleeve-tops", "shortsleeve-tops", "sleeveless-tops", "tank-tops", "tees-and-tshirts", "tunic-tops", "polo-tops", "handbags", "womens-shoes", "shoes-athletic", "boots", "evening-shoes", "flats", "mules-and-clogs", "platforms", "pumps", "sandals", "womens-sneakers", "wedges", "womens-beauty", "bath-body", "perfume", "hair-accessories", "hair-care", "makeup", "skin-care", "beauty-tools"]

cat = [ "womens-clothes",  "womens-athletic-clothes", "womens-pants", "womens-tops"]

# localizedId is more specific
