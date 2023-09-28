Rails.application.routes.draw do
  resources :comments, only: [:index, :create, :destroy]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # config/routes.rb
  
  resources :users do 
    resources :artworks, only:[:index]
  end
  # http://localhost:3000/users/:user_id/artworks
  
  
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :artworks, only: [:index, :show, :create, :update, :destroy]
  resources :artwork_shares, only:[:index, :create, :destroy]



  # root "articles#index"
end
