class Style < ActiveRecord::Base
  has_and_belongs_to_many :items
  has_many :fashionistas
  
end 
