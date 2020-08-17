Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, except: :new do
    member do
      get 'category_children', defaults:{ format: 'json'}
      get 'category_grandchildren', defaults:{ format: 'json'}
    end
  end
  resources :users, only: :show do
    resources :destinations, only: [:new, :create, :destroy]
    resources :items, only: :new 
  end
end
