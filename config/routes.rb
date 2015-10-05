Rails.application.routes.draw do 
  root 'user_sessions#new'

  resources :user_sessions
  resources :gardens, only: [:index, :create, :show, :new]
  resources :products do
    resources :messages
  end
  resources :users, only: [:new, :create, :destroy, :show]

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
