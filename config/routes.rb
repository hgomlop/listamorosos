Rails.application.routes.draw do
  devise_for :users
  resources :morosos
  get 'home/about'
  #root 'home#index'
  root 'morosos#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
