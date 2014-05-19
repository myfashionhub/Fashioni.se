Rails.application.routes.draw do
  root                 'sessions#index'
  post   'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  resources :fashionistas, except: :edit 
    
  get 'styles' => 'styles#index'
  get 'profiles' => 'profiles#index'
  get 'profiles/edit' => 'profiles#edit'
  
  resources :profiles, only: [:index, :edit] do
    resources :items, except: [:edit, :update] do
      collection do
        get 'search' 
        post 'save'
      end  
    end
  end

end

#                    root GET    /                                                    sessions#index
#                sessions POST   /sessions(.:format)                                  sessions#create
#                         DELETE /sessions(.:format)                                  sessions#destroy
#search_fashionista_items GET    /fashionistas/:fashionista_id/items/search(.:format) items#search
#  save_fashionista_items POST   /fashionistas/:fashionista_id/items/save(.:format)   items#save
#       fashionista_items GET    /fashionistas/:fashionista_id/items(.:format)        items#index
#                         POST   /fashionistas/:fashionista_id/items(.:format)        items#create
#    new_fashionista_item GET    /fashionistas/:fashionista_id/items/new(.:format)    items#new
#        fashionista_item GET    /fashionistas/:fashionista_id/items/:id(.:format)    items#show
#                         DELETE /fashionistas/:fashionista_id/items/:id(.:format)    items#destroy
#            fashionistas GET    /fashionistas(.:format)                              fashionistas#index
#                         POST   /fashionistas(.:format)                              fashionistas#create
#         new_fashionista GET    /fashionistas/new(.:format)                          fashionistas#new
#        edit_fashionista GET    /fashionistas/:id/edit(.:format)                     fashionistas#edit
#             fashionista GET    /fashionistas/:id(.:format)                          fashionistas#show
#                         PATCH  /fashionistas/:id(.:format)                          fashionistas#update
#                         PUT    /fashionistas/:id(.:format)                          fashionistas#update
#                         DELETE /fashionistas/:id(.:format)                          fashionistas#destroy
#                  styles GET    /styles(.:format)                                    styles#index
#                profiles GET    /profiles(.:format)                                  profiles#index
#           profiles_edit GET    /profiles/edit(.:format)                             profiles#edit
