class ProfilesController < ApplicationController
  before_action :authorize, only: [:index, :edit]

  def index
  end

  def edit
  end

  def update
    current_fashionista.update(fashionista_params)
    redirect_to "/profiles"    
  end

  def destroy
    Fashionista.delete(current_fashionista.id)
    redirect_to "/fashionistas"   
  end

  private  
  def fashionista_params
    params.require(:fashionista).permit(:username, :email, :tagline, :pic_url, :budget, :size, :style_id, :password, :password_confirmation)  
  end   

end
