Item.delete_all
Fashionista.delete_all
Style.delete_all

myfashionhub = Fashionista.create(username: 'myfashionhub', email: 'nessa_m00re@yahoo.com', tagline: 'Fashion for life', pic_url: 'http://www.nessanguyen.com/images/nessa.jpg', size: 'xs', budget: '50', style_id: 1)

# trendy_array = [{:id=>"108", :name=>"asos"}, {:id=>"483", :name=>"topshop"}, {:id=>"205", :name=>"mango"}, {:id=>"36", :name=>"forever 21"}, {:id=>"374", :name=>"dsw"}, {:id=>"249", :name=>"aldo"}, {:id=>"1465", :name=>"dorothy perkins"}]# 

# business_array = [{:id=>"39", :name=>"loft"}, {:id=>"5", :name=>"j.crew"}, {:id=>"1512", :name=>"j.crew"}, {:id=>"4", :name=>"ann taylor"}, {:id=>"413", :name=>"lord & taylor"}, {:id=>"249", :name=>"aldo"}, {:id=>"374", :name=>"dsw"}, {:id=>"1138", :name=>"baublebar"}]# 
# 

# casual_array = [{:id=>"40", :name=>"aeropostale"}, {:id=>"13", :name=>"gap"}, {:id=>"383", :name=>"alloy"}, {:id=>"76", :name=>"piperlime"}, {:id=>"857", :name=>"toms"}, {:id=>"992", :name=>"levi's"}]# 

# active_array = [{:id=>"43", :name=>"tilly's"}, {:id=>"457", :name=>"athleta"}, {:id=>"111", :name=>"nike"}, {:id=>"857", :name=>"toms"}, {:id=>"41", :name=>"american eagle"}]# 

# sexy_array = [{:id=>"32", :name=>"bebe"}, {:id=>"35", :name=>"guess"}, {:id=>"117", :name=>"guess"}, {:id=>"434", :name=>"juicy couture"}, {:id=>"249", :name=>"aldo"}, {:id=>"38", :name=>"victoria's secret"}, {:id=>"832", :name=>"vince camuto"}]# 

# vintage_array = [{:id=>"19", :name=>"bluefly"}, {:id=>"22", :name=>"anthropologie"}, {:id=>"29", :name=>"urban outfitters"}, {:id=>"666", :name=>"modcloth"}, {:id=>"720", :name=>"madewell"}, {:id=>"31", :name=>"free people"}]# 

# designer_array = [{:id=>"21", :name=>"shopbop"}, {:id=>"8", :name=>"bloomingdale's"}, {:id=>"427", :name=>"theoutnet"}, {:id=>"1467", :name=>"gilt"}, {:id=>"130", :name=>"michael kors"}, {:id=>"357", :name=>"bcbgmaxazria"}, {:id=>"27", :name=>"net-a-porter"}]


result = HTTParty.get("http://api.shopstyle.com/api/v2/products?pid=uid9636-25025806-0&fl=r249&fl=r108&fl=r1465&fts=sundress&fl=s81")
    @packaged_results = result['products'].map do |item|
     { name: item['brandedName'], url: item['clickUrl'], 
       image_url: item['image']['sizes'].fetch('IPhone')['url'],
       price: "#{item['priceLabel']} #{item['currency']}" }
    end   

    results = @packaged_results.map do |result|
      Item.create(description: result[:name], image_url: result[:image_url], url: result[:url], price: result[:price])
    end  
