Rails.application.routes.draw do 
  root 'gardens#index'
  resources :gardens, only: [:index, :create, :show, :new]
end
