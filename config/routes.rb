Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'home#index'
  devise_for :users
  resources :users

  resources :home, only: [:index]
  resources :search, only: [:index]
end
