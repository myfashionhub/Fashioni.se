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
      retailer_array = Style.retailer_array(@fashionista.style_id)
      retailers      = Style.extract_id(retailer_array)
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
    new_item = Item.add(params[:shopstyle_id])
    current_fashionista.items << new_item
    redirect_to '/profiles'
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
