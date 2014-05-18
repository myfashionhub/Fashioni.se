Rails.application.routes.draw do
  root 'welcome#index'

  resources :fashionistas do
    resources :items, except: [:edit, :show] do
      collection do
        get 'search'
      end  
  end
  end
    
  get '/styles' => 'styles#index'
end
