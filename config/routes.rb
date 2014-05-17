Rails.application.routes.draw do
  root 'items#index'

  resources :fashionistas do
    resources :items, except: [:edit]
  end
    
  resources :styles, except: [:edit, :create]
end

#  resources :planets do 
#    resources :moons, except: [:show, :index]
#  end
