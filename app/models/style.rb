class Style < ActiveRecord::Base
  has_and_belongs_to_many :fashionistas
  has_and_belongs_to_many :items

  def id(style)
    {
     'women: trendy'   => 1,
     'women: business' => 2,
     'women: active'   => 3,
     'women: sexy'     => 4,
     'women: vintage'  => 5,
     'women: designer' => 6,
     'men: business'   => 7,
     'men: active'     => 8,
    }[style]
  end

  def self.retailer_choices
    {
     1 => [
           {:id=>"108", :name=>"asos"},
           {:id=>"483", :name=>"topshop"},
           {:id=>"205", :name=>"mango"},
           {:id=>"36", :name=>"forever 21"},
           {:id=>"374", :name=>"dsw"},
           {:id=>"249", :name=>"aldo"},
           {:id=>"1465", :name=>"dorothy perkins"}
          ],
     2 => [
           {:id=>"39", :name=>"loft"},
           {:id=>"5", :name=>"j.crew"},
           {:id=>"1512", :name=>"j.crew"},
           {:id=>"4", :name=>"ann taylor"},
           {:id=>"374", :name=>"dsw"},
           {:id=>"1138", :name=>"baublebar"}
          ],
     3 => [
           {:id=>"40", :name=>"aeropostale"},
           {:id=>"41", :name=>"american eagle"},
           {:id=>"13", :name=>"gap"},
           {:id=>"383", :name=>"alloy"},
           {:id=>"43", :name=>"tilly's"},
           {:id=>"857", :name=>"toms"},
           {:id=>"992", :name=>"levi's"}
          ],
     4 =>[
          {:id=>"32", :name=>"bebe"},
          {:id=>"35", :name=>"guess"},
          {:id=>"117", :name=>"guess"},
          {:id=>"434", :name=>"juicy couture"},
          {:id=>"249", :name=>"aldo"},
          {:id=>"38", :name=>"victoria's secret"},
          {:id=>"832", :name=>"vince camuto"}
         ],
     5 => [
           {:id=>"19", :name=>"bluefly"},
           {:id=>"22", :name=>"anthropologie"},
           {:id=>"29", :name=>"urban outfitters"},
           {:id=>"666", :name=>"modcloth"},
           {:id=>"720", :name=>"madewell"},
           {:id=>"31", :name=>"free people"}
          ],
     6 => [
           {:id=>"21", :name=>"shopbop"},
           {:id=>"8", :name=>"bloomingdale's"},
           {:id=>"427", :name=>"theoutnet"},
           {:id=>"1467", :name=>"gilt"},
           {:id=>"357", :name=>"bcbgmaxazria"},
           {:id=>"27", :name=>"net-a-porter"}
          ],
     7 => [
           {:id=>"108", :name=>"asos"},
           {:id=>"8", :name=>"bloomingdale's"},
           {:id=>"5", :name=>"j.crew"},
           {:id=>"1467", :name=>"gilt"},
           {:id=>"60", :name=>"brooks brothers"},
           {:id=>"54", :name=>"banana republic"}
          ],
     8 => [
           {:id=>"21", :name=>"pacsun"},
           {:id=>"41", :name=>"american eagle"},
           {:id=>"427", :name=>"urban outfitters"},
           {:id=>"40", :name=>"aeropostale"},
           {:id=>"13", :name=>"gap"},
           {:id=>"43", :name=>"tilly's"}
          ]
    }
  end

  def self.retailers(id)
    retailer_choices[id]
    retailer_query  = "&#{retailer_ids.join('&')}"
  end

end
