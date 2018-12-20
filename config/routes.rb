Rails.application.routes.draw do
  get 'tab/show'
  get 'tab/create'
  get 'welcome/index'

  resources :songs, only: [:index] do
    resources :notes
  end
  
  resources :artists do
    resources :songs 
  end
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
