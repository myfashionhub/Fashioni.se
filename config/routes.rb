Rails.application.routes.draw do
  root 'welcome#index'

  resources :fashionistas do
    resources :items, except: [:edit]
  end
    
  resources :styles, except: [:edit, :create]
end
