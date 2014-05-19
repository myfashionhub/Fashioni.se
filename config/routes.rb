Rails.application.routes.draw do
  root                 'sessions#index'
  post   'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  resources :fashionistas do
    resources :items, except: [:edit, :update] do
      collection do
        get 'search' 
        post 'save'
      end  
  end
  end
    
  get 'styles' => 'styles#index'
  get 'profiles' => 'profiles#index'

end
