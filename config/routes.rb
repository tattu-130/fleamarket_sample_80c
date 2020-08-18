Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'items#index'
  resources :items, except: :new do
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end
  resources :users, only: :new
  resources :users, only: :show do
    resources :destinations, only: [:new, :create, :destroy]
    resources :items, only: :new
  end
  resource :cards, only: [:new, :create, :show, :destroy]
end
