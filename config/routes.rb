Rails.application.routes.draw do
  root 'stocks#index'
  resources :products
  resources :shelters
  resources :supplies
  resources :stocks
  resources :categories
  resources :transactions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
