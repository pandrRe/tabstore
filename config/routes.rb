Rails.application.routes.draw do
  root 'purchases#index'
  resources :users, only: [:new, :create]
  resources :purchases, only: [:index, :new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
