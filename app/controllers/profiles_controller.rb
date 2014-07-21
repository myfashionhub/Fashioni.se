class ProfilesController < ApplicationController
  before_action :authorize, only: [:index, :edit]

  def index
    @fashionista = current_fashionista
    saves  = Save.where(fashionista_id: @fashionista.id)
    @items = saves.map do |save|
      Item.find(save.item_id)
    end
    @items.sort_by{ |item| item.created_at }
  end

  def edit
    @current_fashionista = Fashionista.find(session[:fashionista_id])
  end

end
