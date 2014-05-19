class Style < ActiveRecord::Base
  has_and_belongs_to_many :items
  has_many :fashionistas
  
  def id
    case name
    when 'trendy'
      1
    when 'business'
      2
    when 'active'
      3
    when 'sexy'
      4
    when 'vintage'
      5
    when 'designer'
      6
    end        
  end  
 
  def self.map(id)
    retailer_array = nil
    case id
    when 1   
  retailer_array = [{:id=>"108", :name=>"asos"}, 
                {:id=>"483", :name=>"topshop"}, 
                {:id=>"205", :name=>"mango"}, 
                {:id=>"36", :name=>"forever 21"}, 
                {:id=>"374", :name=>"dsw"}, 
                {:id=>"249", :name=>"aldo"}, 
                {:id=>"1465", :name=>"dorothy perkins"}]

    when 2   
  retailer_array = [{:id=>"39", :name=>"loft"}, 
                    {:id=>"5", :name=>"j.crew"}, 
                    {:id=>"1512", :name=>"j.crew"}, 
                    {:id=>"4", :name=>"ann taylor"}, 
                    {:id=>"374", :name=>"dsw"}, 
                    {:id=>"1138", :name=>"baublebar"}]

    when 3   
  retailer_array = [{:id=>"40", :name=>"aeropostale"}, 
                  {:id=>"41", :name=>"american eagle"},  
                  {:id=>"13", :name=>"gap"},
                  {:id=>"383", :name=>"alloy"}, 
                  {:id=>"43", :name=>"tilly's"}, 
                  {:id=>"857", :name=>"toms"}, 
                  {:id=>"992", :name=>"levi's"}]

    when 4   
  retailer_array = [{:id=>"32", :name=>"bebe"}, 
                {:id=>"35", :name=>"guess"}, 
                {:id=>"117", :name=>"guess"}, 
                {:id=>"434", :name=>"juicy couture"}, 
                {:id=>"249", :name=>"aldo"}, 
                {:id=>"38", :name=>"victoria's secret"}, 
                {:id=>"832", :name=>"vince camuto"}] 

    when 5   
  retailer_array = [{:id=>"19", :name=>"bluefly"}, 
                   {:id=>"22", :name=>"anthropologie"}, 
                   {:id=>"29", :name=>"urban outfitters"}, 
                   {:id=>"666", :name=>"modcloth"}, 
                   {:id=>"720", :name=>"madewell"}, 
                   {:id=>"31", :name=>"free people"}] 

    when 6   
  retailer_array = [{:id=>"21", :name=>"shopbop"}, 
                    {:id=>"8", :name=>"bloomingdale's"}, 
                    {:id=>"427", :name=>"theoutnet"}, 
                    {:id=>"1467", :name=>"gilt"}, 
                    {:id=>"357", :name=>"bcbgmaxazria"}, 
                    {:id=>"27", :name=>"net-a-porter"}]
     
    end    
  end

  
  def self.extract_id(retailer_array)
    retailer_ids = retailer_array.map { |retailer| "fl=r#{retailer[:id]}" }
    retailer_query  = retailer_ids.join('&')
    return retailer_query
  end
    

end 
