Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :users

  resources :home, only: [:index]
  resources :search, only: [:index]
  resources :products, only: :show
end
