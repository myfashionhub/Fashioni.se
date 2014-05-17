class FashionistasController < ApplicationController 
  def index
    @fashionistas = Fashionista.all
  end

  def new
    @fashionista = Fashionista.new
    
  end

  def create
    num = (1..6).to_a.sample
    defaults = {'tagline' => 'Fashionizer', 
                'pic_url' => "/assets/profile#{num}.jpg"}
        
    @fashionista = Fashionista.create(fashionista_params.merge!(defaults))
    binding.pry
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

  def destroy
    Fashionista.delete(params[:id])
    redirect_to "/fashionistas"   
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
    params.require(:fashionista).permit(:username, :email, :tagline, :pic_url, :budget, :size, :style_id, :password)  
  end 

end

