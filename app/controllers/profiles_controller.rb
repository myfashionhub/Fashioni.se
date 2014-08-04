class ProfilesController < ApplicationController
  before_action :authorize, only: [:index, :edit]

  def index
    @fashionista = current_fashionista
    @style = Style.find(@fashionista.style_id)
    saves  = Save.where(fashionista_id: @fashionista.id)

    @items = saves.to_a.sort_by{ |save| save.created_at }.reverse
                  .map do |save|
      Item.find(save.item_id)
    end
  end

  def edit
    @current_fashionista = Fashionista.find(session[:fashionista_id])
  end

end
