Rails.application.routes.draw do
  root                 'sessions#index'
  post   'sessions'            => 'sessions#create'
  delete 'sessions'            => 'sessions#destroy'

  resources :fashionistas, except: :edit
  get 'fashionistas/:id/items' => 'items#index'

  get 'styles'                 => 'styles#index'
  get 'about'                  => 'about#index'

  get 'profile'               => 'profiles#index'
  get 'profile/edit'          => 'profiles#edit'

  get 'items/new'     => 'items#new'
  get 'items/search'  => 'items#search'
  post 'items/save'   => 'items#save'
  post 'profiles/items/copy'   => 'items#copy'
  get 'items/:id'     => 'items#show'
  delete '/profiles/items/:id' => 'items#destroy'
end
