class SessionsController < ApplicationController 
  
  def index
  end

  def timeout_in
    10.minutes
    redirect_to root_path, notice: "Session timeout. Please log back in" 
  end

  def create
    fashionista = Fashionista.find_by(email: params[:email])

    if fashionista && fashionista.authenticate(params[:password])
      session[:fashionista_id] = fashionista.id

      redirect_to '/profiles', notice: "Signed in as #{fashionista.username}"
    else 
      redirect_to root_path, alert: "Log in failed"
    end  
  end


  def destroy
    session[:fashionista_id] = nil
    redirect_to root_path, notice: "Logged out" 
  end
end  
