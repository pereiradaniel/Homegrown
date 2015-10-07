Rails.application.routes.draw do
  root 'gardens#index'

  resources :user_sessions
  resources :products
  resources :messages

  resources :users, only: [:show, :new, :create, :destroy, :edit, :update] do
  	resources :gardens, only: [:show, :new, :index, :create, :destroy]
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
