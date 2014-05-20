class Fashionista < ActiveRecord::Base
  has_secure_password
  has_many :items
  belongs_to :style
  #validates :username, presence: true
  validates :email, presence: true, uniqueness: true,
             email: true
  validates :password, length: {within: 6..12, wrong_length: "Password length does not match requirement"}, :on => :create

  def size_convert
    size_code = ''
    case size
    when 'XXS (0)'
      size_code = '79'
    when 'XS (2)'
      size_code = '81'
    when 'S (4-6)'
      size_code = '83'
    when 'M (8-10)'
      size_code = '85'
    when 'L (12-14)'
      size_code = '87'        
    when 'XL (16-18)'
        size_code = '80' 
          #36 '225', 38 '227', 40 '229', 42 '231', 44 '233', 46 '235'
    end

    return size_code
  end


  def budget_max 
    max = 0
    case budget
    when 'Under $50'
      max = 50
    when '$50 - $100'  
      max = 100
    when 'Over $100'    
      max = 400
    end  

    return max
  end

  
end
