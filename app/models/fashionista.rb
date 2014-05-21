class Fashionista < ActiveRecord::Base
  has_secure_password
  has_many :items
  belongs_to :style

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true,
             email: true
  validates :password, length: {within: 6..16, wrong_length: "Password length does not match requirement"}, :on => :create

  before_save :default_params

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

  def default_params
    if (1..6).include? self.style_id
      num = (1..7).to_a.sample
      default_tag = 'Fashionista'
    else
      num = (8..10).to_a.sample  
      default_tag = 'Dapper'
    end
    default_pic = "/assets/profile#{num}.jpg"

    if self.pic_url.empty?
      self.pic_url = default_pic
    elsif self.tagline.empty?  
      self.tagline = default_tag
    else
      self.pic_url
      self.tagline   
    end # if statement  

  end
  
  
end
