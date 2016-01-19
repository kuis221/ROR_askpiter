Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  namespace :admin do
    resources :users do
      resources :products
      resources :videos
      resources :photos
    end
    resources :categories do
      resources :sub_categories
      resources :photos
      resources :videos
      resources :users
    end
    resources :sub_categories do
      resources :products
    end
    resources :companies do
      resources :products
      resources :users
    end
    resources :products do
      resources :videos
      resources :photos
      resources :prices
      resources :ratings
      resources :reviews
      resources :users
    end
    resources :videos do
      resources :users
    end
    resources :photos do
      resources :users
    end
  end

  root to: 'home#index'
  devise_for :users
  resources :users

  resources :home, only: [:index]
  resources :search, only: [:index]
end
