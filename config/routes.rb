Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  namespace :admin do
    resources :users do
      resources :products
      resources :videos
      resources :photos
    end
    resources :categories do
      resources :photos
      resources :videos
      resources :users
    end
    resources :companies do
      resources :products
      resources :users
    end
  end

  root to: 'home#index'
  devise_for :users
  resources :users

  resources :home, only: [:index]
  resources :search, only: [:index]
end
