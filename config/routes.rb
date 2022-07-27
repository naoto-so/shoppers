Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index]
    namespace :admin do
      resources :items, only: [:index, :new, :create]
    end
  end

