class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_fashionista

  def current_fashionista
    Fashionista.find(session[:fashionista_id]) if session[:fashionista_id]
  end

  def authorize
    redirect_to root_path if current_fashionista.nil?
  end
end
