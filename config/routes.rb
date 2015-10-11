Rails.application.routes.draw do
  root 'gardens#index'

  resources :user_sessions
  resources :products
  
  resources :conversations
  resources :messages

  resources :trades

	resources :gardens, only: [:show, :new, :index, :create, :destroy]
  resources :users, only: [:show, :new, :create, :destroy, :edit, :update]

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
