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
    default_tag = {'tagline' => 'Fashionizer'} 
    default_pic = {'pic_url' => "/assets/profile#{num}.jpg"}

#   if params.require(:fashionista).permit(:tagline, :pic_url).nil?
#     @fashionista = Fashionista.create(fashionista_params.merge!(default_tag).merge!(default_pic))
#   elsif params.require(:fashionista).permit(:tagline).nil?  
#     @fashionista = Fashionista.create(fashionista_params.merge!(default_tag))
#   elsif params.require(:fashionista).permit(:pic_url).nil?  
#     @fashionista = Fashionista.create(fashionista_params.merge!(default_pic))  
    @fashionista = Fashionista.new(fashionista_params)
    if @fashionista.save
      redirect_to "/fashionistas/#{@fashionista.id}"
    else
      render 'new'
    end    
  end

  def edit
    @current_fashionista = Fashionista.find(session[:fashionista_id])
  end
    
  def update
    @current_fashionista = Fashionista.find(session[:fashionista_id])
    @current_fashionista.update(fashionista_params)

    redirect_to '/profiles'    
  end

  def show 
    @fashionista = Fashionista.find(params[:id])
  end


  def destroy
    Fashionista.delete(current_fashionista.id)
    session[:fashionista_id] = nil
    redirect_to root_path    
  end  

#  def update
#    @fashionista = Fashionista.find(params[:id])
#    @fashionista.update(fashionista_params)
#    redirect_to "/profiles"    
#  end#

#  def destroy
#    Fashionista.delete(params[:id])
#    redirect_to "/fashionistas"   
#  end


  private  
  def fashionista_params
    params.require(:fashionista).permit(:username, :email, :tagline, :pic_url, :budget, :size, :style_id, :password, :password_confirmation)  
  end 

 
end

