Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'items#index'
  resources :items, except: :new do
    collection do
      get 'search'
    end
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
    member do
      get 'category_children', defaults:{ format: 'json'}
      get 'category_grandchildren', defaults:{ format: 'json'}
    end
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
    collection do
      get 'detail_search'
      post 'detail_search'
    end
  end
  resources :users, only: :new
  resources :users, only: [:index, :show, :edit, :update] do
    resources :destinations, only: [:new, :create, :destroy]
    resources :items, only: :new 
  end
  resource :cards, only: [:new, :create, :show, :destroy]
end
