Rails.application.routes.draw do
  resources :artworks, only: [:index, :show, :create, :update, :destroy]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
# config/routes.rb

  resources :users, only: [:index, :show, :create, :update, :destroy]





  # root "articles#index"
end
