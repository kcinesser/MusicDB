Rails.application.routes.draw do
  get 'song_searches/index'
  get 'song_searches/show'
  get 'searches/index'
  get 'searches/show'
  devise_for :users
  
  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

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
