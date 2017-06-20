Rails.application.routes.draw do

  resources :items
  resources :categories
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'

  root 'welcome#home'
end
