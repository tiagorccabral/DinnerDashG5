Rails.application.routes.draw do

  resources :items

  resources :categories
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  resources :carts do
     member do
      get :add
      get :remove
      get :add_single
    end
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'welcome#home'
end
