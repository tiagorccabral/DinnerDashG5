Rails.application.routes.draw do

  resources :items

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  root 'welcome#home'
end
