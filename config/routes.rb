Rails.application.routes.draw do
  root                 'sessions#index'
  post   'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  resources :fashionistas#, except: :edit 
  get 'fashionistas/:id/items'    => 'items#index'

  get 'styles'        => 'styles#index'

  get 'profiles'      => 'profiles#index'
  get 'profiles/edit'      => 'profiles#edit'
  
  get 'profiles/items/new'    => 'items#new'
  get 'profiles/items/search' => 'items#search'
  post 'profiles/items/save'  => 'items#save'
  get 'profiles/items/:id'    => 'items#show'
  delete '/profiles/items/:id'=> 'items#destroy'
end
