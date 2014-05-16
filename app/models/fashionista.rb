class Fashionista < ActiveRecord::Base
    has_and_belongs_to_many :items
    belongs_to :style

#  def initialize(username, pic_url, email, password, budget, style, size)  
#  end  

  def size_convert
    @size_code = ''
    case self.size
      when 'XXS (0)'
        @size_code = '79'
      when 'XS (2)'
        @size_code = '81'
      when 'S (4-6)'
        @size_code = '83'
      when 'M (8-10)'
        @size_code = '85'
      when 'L (12-14)'
        @size_code = '87'        
      when 'XL (16-18)'
        @size_code = '80'  
    end
  end

  def style_convert
    @style_id = ''
    case self.style
      when 'trendy'
      @style_id = ''
      when 'business'
      @style_id = ''
      when 'active'
      @style_id = ''
      when 'vintage'
      @style_id = ''
      when 'designer' 
      @style_id = ''      
    end
  end

end
