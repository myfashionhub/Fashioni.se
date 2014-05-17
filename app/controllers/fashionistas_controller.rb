class FashionistasController < ApplicationController 
  def index
    @fashionistas = Fashionista.all
  end

  def new
    @fashionista = Fashionista.new
    
  end

  def create
    @fashionista = Fashionista.create(fashionista_params)
    redirect_to "/fashionistas/#{@fashionista.id}"
  end

  def edit
    @fashionista = Fashionista.find(params[:id])
  end

  def show 
    @fashionista = Fashionista.find(params[:id])
  end

  def update
    @fashionista = Fashionista.find(params[:id])
    @fashionista.update(fashionista_params)
    redirect_to "/fashionistas/#{@fashionista.id}"    
  end


#    fashionistas GET    /fashionistas(.:format)          fashionistas#index
#                 POST   /fashionistas(.:format)          fashionistas#create
# new_fashionista GET    /fashionistas/new(.:format)      fashionistas#new
#edit_fashionista GET    /fashionistas/:id/edit(.:format) fashionistas#edit
#     fashionista GET    /fashionistas/:id(.:format)      fashionistas#show
#                 PATCH  /fashionistas/:id(.:format)      fashionistas#update
#                 PUT    /fashionistas/:id(.:format)      fashionistas#update
#                 DELETE /fashionistas/:id(.:format)      fashionistas#destroy

  private
  
  def fashionista_params
    params_tagline = params.require(:fashionista).permit(:tagline)
    if params_tagline.nil?
      params_tagline = "Fashionizer"  
    end     

    params_pic  = params.require(:fashionista).permit(:pic_url)    
    if params_pic.nil?
      num = (1..6).sample
      params_pic = "/assets/profile#{num}.jpg"
    end 

    params.require(:fashionista).permit(:username, :email, :tagline, :pic_url, :budget, :size, :style_id, :password)  
  end 

end

