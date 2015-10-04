Rails.application.routes.draw do 
  root 'gardens#index'

  resources :user_sessions
  
  resources :users, only: [:show, :new, :create, :destroy] do
  	resources :gardens, only: [:index, :create, :show, :new]
  end
  resources :products

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
