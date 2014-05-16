require 'httparty'

retail_raw = HTTParty.get("http://api.shopstyle.com/api/v2/retailers?pid=uid9636-25025806-0")
retail_array = retail_raw['retailers']

# Map array of retailer hashes
designer_name.map do |retailer|
  retail_array.select do |retailer_hash|
  if retailer_hash['name'].downcase.include? retailer
    designer_array << {id: retailer_hash['id'], name: retailer}
  end
  end
end


# trend name array
trendy_name = ["asos", "topshop", "mango", "forever 21", "dsw", "aldo", 
  "dorothy perkins"]
business_name = ["loft", "j.crew", "ann taylor", "lord & taylor", "aldo", "dsw", "baublebar"]
casual_name = ["aeropostale", "gap", "alloy", "piperlime", "toms", "levi's"]
active_name = ["tilly's", "athleta", "nike", "toms", "american eagle"]
sexy_name = ["bebe", "guess", "juicy couture", "aldo", "victoria's secret", "vince camuto"]
designer_name = ["shopbop", "bloomingdale's", "theoutnet", "gilt",
 "michael kors", "bcbgmaxazria", "net-a-porter"]  
vintage_name = ["bluefly", "anthropologie", "urban outfitters", "modcloth", "madewell", "free people"]


trendy_array = [{:id=>"108", :name=>"asos"}, {:id=>"483", :name=>"topshop"}, {:id=>"205", :name=>"mango"}, {:id=>"36", :name=>"forever 21"}, {:id=>"374", :name=>"dsw"}, {:id=>"249", :name=>"aldo"}, {:id=>"1465", :name=>"dorothy perkins"}]

business_array = [{:id=>"39", :name=>"loft"}, {:id=>"5", :name=>"j.crew"}, {:id=>"1512", :name=>"j.crew"}, {:id=>"4", :name=>"ann taylor"}, {:id=>"413", :name=>"lord & taylor"}, {:id=>"249", :name=>"aldo"}, {:id=>"374", :name=>"dsw"}, {:id=>"1138", :name=>"baublebar"}]


casual_array = [{:id=>"40", :name=>"aeropostale"}, {:id=>"13", :name=>"gap"}, {:id=>"383", :name=>"alloy"}, {:id=>"76", :name=>"piperlime"}, {:id=>"857", :name=>"toms"}, {:id=>"992", :name=>"levi's"}]

active_array = [{:id=>"43", :name=>"tilly's"}, {:id=>"457", :name=>"athleta"}, {:id=>"111", :name=>"nike"}, {:id=>"857", :name=>"toms"}, {:id=>"41", :name=>"american eagle"}]

sexy_array = [{:id=>"32", :name=>"bebe"}, {:id=>"35", :name=>"guess"}, {:id=>"117", :name=>"guess"}, {:id=>"434", :name=>"juicy couture"}, {:id=>"249", :name=>"aldo"}, {:id=>"38", :name=>"victoria's secret"}, {:id=>"832", :name=>"vince camuto"}]

vintage_array = [{:id=>"19", :name=>"bluefly"}, {:id=>"22", :name=>"anthropologie"}, {:id=>"29", :name=>"urban outfitters"}, {:id=>"666", :name=>"modcloth"}, {:id=>"720", :name=>"madewell"}, {:id=>"31", :name=>"free people"}]

designer_array = [{:id=>"21", :name=>"shopbop"}, {:id=>"8", :name=>"bloomingdale's"}, {:id=>"427", :name=>"theoutnet"}, {:id=>"1467", :name=>"gilt"}, {:id=>"130", :name=>"michael kors"}, {:id=>"357", :name=>"bcbgmaxazria"}, {:id=>"27", :name=>"net-a-porter"}]

#size code
sizes = [
  {xxs: '79'},
  {xs:  '81'},
  {s:   '83'},
  {m:   '85'},
  {l:   '87'},
  {xl:  '89'}]


