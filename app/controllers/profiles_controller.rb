class ProfilesController < ApplicationController
  before_action :authorize, only: [:index, :edit]

  def index
    @current_fashionista = Fashionista.find(session[:fashionista_id])
  end

  def edit
    @current_fashionista = Fashionista.find(session[:fashionista_id])
  end

end
