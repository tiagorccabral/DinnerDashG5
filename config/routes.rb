Rails.application.routes.draw do

  resources :items do
    member do
      put :add_to_cart
    end
  end
  resources :categories
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'welcome#home'
end
