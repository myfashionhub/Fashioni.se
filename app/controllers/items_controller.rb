class ItemsController < ApplicationController 
  def index
    @items = Item.all
  end

  def search

  end  

  def new
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
