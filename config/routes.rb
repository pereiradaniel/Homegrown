Rails.application.routes.draw do
  get 'oauths/oauth'
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  root 'gardens#index'

  resources :user_sessions
  resources :products

  resources :conversations do
  	resources :messages
  end

  resources :users, only: [:show, :new, :create, :destroy, :edit, :update] do
  	resources :gardens, only: [:show, :new, :index, :create, :destroy]
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
