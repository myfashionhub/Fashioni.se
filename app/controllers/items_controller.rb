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
    retailer_array = Style.map(@fashionista.style_id)
    retailers      = Style.extract_id(retailer_array) 
    size_code      = @fashionista.size_convert
    max            = @fashionista.budget_max
    term           = params[:search_term] 

    @items = Item.search_api(term, retailers, size_code, max)
  end  

  def save
    new_item = Item.add(params[:shopstyle_id])
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

end


#search_fashionista_items GET    /fashionistas/:fashionista_id/items/search(.:format) items#search
#       fashionista_items GET    /fashionistas/:fashionista_id/items(.:format)        items#index
#                         POST   /fashionistas/:fashionista_id/items(.:format)        items#create
#    new_fashionista_item GET    /fashionistas/:fashionista_id/items/new(.:format)    items#new
#        fashionista_item PATCH  /fashionistas/:fashionista_id/items/:id(.:format)    items#update
#                         PUT    /fashionistas/:fashionista_id/items/:id(.:format)    items#update
#                         DELETE /fashionistas/:fashionista_id/items/:id(.:format)    items#destroy
#            fashionistas GET    /fashionistas(.:format)                              fashionistas#index
#                         POST   /fashionistas(.:format)                              fashionistas#create
#         new_fashionista GET    /fashionistas/new(.:format)                          fashionistas#new
#        edit_fashionista GET    /fashionistas/:id/edit(.:format)                     fashionistas#edit
#             fashionista GET    /fashionistas/:id(.:format)                          fashionistas#show
#                         PATCH  /fashionistas/:id(.:format)                          fashionistas#update
#                         PUT    /fashionistas/:id(.:format)                          fashionistas#update
#                         DELETE /fashionistas/:id(.:format)                          fashionistas#destroy
