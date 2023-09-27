Rails.application.routes.draw do
  resources :artworks
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
# config/routes.rb

# resources :users
get '/users', to: 'users#index'
#get '/users/new', to: 'users#new' 
post '/users', to: 'users#create'
get '/users/:id', to: 'users#show'
#get '/users/:id/edit', to: 'users#edit' 
patch '/users/:id', to: 'users#update'
#put '/users/:id', to: 'users#update' 
delete '/users/:id', to: 'users#destroy'




  # root "articles#index"
end
