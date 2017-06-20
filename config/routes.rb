Rails.application.routes.draw do
  
  resources :items do
  	resources :categories
  end

  resources :categories

  root 'welcome#home'
end
