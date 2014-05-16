Rails.application.routes.draw do
  root 'items#index'

  resources :fashionistas 
  resources :styles 
  resources :items 

end

#  resources :planets do 
#    resources :moons, except: [:show, :index]
#  end
