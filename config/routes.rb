Rails.application.routes.draw do

  root 'users#index'

  resources :users
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'

  resources :clients
  patch '/update_loyalty_level' => 'clients#update_loyalty_level'
  patch '/add_points' => 'clients#add_points'

  resources :sales

  resources :points
end
