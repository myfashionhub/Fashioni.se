Rails.application.routes.draw do
  root 'welcome#index'

  resources :fashionistas do
    resources :items, except: [:edit, :update] do
      collection do
        get 'search' 
        post 'save'
      end  
  end
  end
    
  get '/styles' => 'styles#index'
end
