Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :show] do
    resources :orders, only: [:index]
  end
    namespace :admin do
      resources :items, only: [:index, :new, :create, :edit, :update]
    end
  end

