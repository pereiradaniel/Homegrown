Rails.application.routes.draw do
  get 'home' => 'pruducts#home'
  root 'products#home'

  get 'oauths/oauth'
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

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
