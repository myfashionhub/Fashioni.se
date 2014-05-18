class ItemsController < ApplicationController 
  def index
    @fashionista = Fashionista.find(params[:fashionista_id])
    @items = @fashionista.items.all
  end

  def new
    @fashionista = Fashionista.find(params[:fashionista_id])
  end

  def search 
    @fashionista   = Fashionista.find(params[:fashionista_id])
    retailer_array = Style.map(@fashionista.style_id)
    retailers = Style.extract_id(retailer_array) 
    size_code      = @fashionista.size_convert
    max            = @fashionista.budget_max
    term           = params[:search_term] 
    @items = Item.search_api(term, retailers, size_code, max)    
  end  

#{}"http://api.shopstyle.com/api/v2/products?pid=uid9636-25025806-0&fl=r39&fl=r5&fl=r1512&fl=r4&fl=r374&fl=r1138&fts=leather+shorts&fl=s83&fl=p10:50"

#{}"http://api.shopstyle.com/api/v2/products?pid=uid9636-25025806-0&fl=r39&fl=r5&fl=r1512&fl=r4&fl=r374&fl=r1138&fts=leather+skirt&fl=s83&fl=p10:50"

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
