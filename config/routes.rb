Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  namespace :admin do
    resources :users do
      resources :products
      resources :videos
      resources :photos
      resources :ratings
      resources :companies
      resources :reviews
    end
    resources :father_categories do
      resources :categories
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
    resources :distributors do
      resources :companies
    end
  end

  root to: 'home#index'
  devise_for :users
  resources :users

  resources :home, only: [:index]
  resources :search, only: [:index]
  resources :products, only: :show

  resource :pictures, format: false, only: :create
  resource :photos, format: false, only: :create
  resource :videos, format: false, only: :create

  # controller :favourites, as: :favourite, path: :favourites,
  #            format: true, constraints: { format: :json } do
  #   %i(products photos videos).each do |type|
  #     defaults type: type do
  #       post type, to: :create
  #       delete type, to: :destroy
  #     end
  #   end
  # end

  post '/modals/:action', controller: :modals, format: false, as: :modals

end
