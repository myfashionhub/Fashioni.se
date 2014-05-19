Rails.application.routes.draw do
  root                 'sessions#index'
  post   'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  resources :fashionistas, except: :edit 
    
  get 'styles'        => 'styles#index'

  get 'profiles'      => 'profiles#index'
  get 'profiles/edit' => 'profiles#edit'
  
  get 'profiles/items/new'    => 'items#new'
  get 'profiles/items/search' => 'items#search'
  post 'profiles/items/save'  => 'items#save'


end
