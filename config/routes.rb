Rails.application.routes.draw do
  root to: 'products#index'

  # User routes
  resources :users, only: [:new, :create]
  get 'register', to: 'users#new'

  # Session routes
  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Products and categories routes
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  # Cart and orders routes
  resource :cart, only: [:show] do
    post :add_item
    post :remove_item
  end
  resources :orders, only: [:create, :show]

  # About page route
  get 'about', to: 'about#index'

  # Admin namespace routes
  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
  end

  # Remove these redundant routes
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'users/new'
  # get 'users/create'
  # get 'about/index'
end
