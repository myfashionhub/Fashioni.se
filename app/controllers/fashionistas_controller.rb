class FashionistasController < ApplicationController 

  def index
    @fashionista = current_fashionista
    @fashionistas = Fashionista.all
  end

  def new
    @fashionista = Fashionista.new
  end


  def create
    num = (1..6).to_a.sample
    defaults = {'tagline' => 'Fashionizer', 
                'pic_url' => "/assets/profile#{num}.jpg"}
    if params.require(:fashionista).permit(:tagline, :pic_url).nil?  
      @fashionista = Fashionista.create(fashionista_params.merge!(defaults))
    else
      @fashionista = Fashionista.create(fashionista_params)
    end    
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


  private  
  def fashionista_params
    params.require(:fashionista).permit(:username, :email, :tagline, :pic_url, :budget, :size, :style_id, :password, :password_confirmation)  
  end 

end

