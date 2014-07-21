class ItemsController < ApplicationController
  def index
    @fashionista = Fashionista.find(params[:id])
    @items = @fashionista.items.all
  end

  def new
    @fashionista = current_fashionista
  end

  def search
    @fashionista   = current_fashionista
    if params[:brand]
      retailers = ""
    else
      retailers = Style.retailer_query(@fashionista.style_id)
    end
    max            = params[:max]
    term           = params[:search_term]
    sort           = params[:sort]

    if (1..6).include? @fashionista.style_id
      category  = nil
      size_code = @fashionista.size_convert
    else
      category  = 'men+'
      size_code = nil
    end

    @items = Item.search_api(term, category, retailers, size_code, max, sort)
  end


  def save
    fashionista = current_fashionista
    item = Item.add(params[:shopstyle_id], fashionista.style_id)
    Save.find_or_create_by(fashionista_id: fashionista.id, item_id: item.id)
    render json: item.to_json
  end


  def copy
    item = Item.find(params[:item_id])
    new_item = Item.create(item_params)
    current_fashionista.items << new_item
    redirect_to '/profiles'
  end


  def show
    @item = Item.find(params[:id])
  end


  def destroy
    Item.delete(params[:id])
    redirect_to '/profiles'
  end

  private

end
