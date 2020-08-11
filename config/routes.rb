Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :users, only: :show do
    resources :destinations, only: [:new, :create, :destroy]
  end
end
