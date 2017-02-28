Rails.application.routes.draw do

  root 'users#index'

  resources :users
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'

  resources :clients
  patch '/update_loyalty_level' => 'clients#update_loyalty_level'
  patch '/add_points' => 'clients#add_points'

  resources :sales

  resources :products

  resources :teams
  post '/add_member' => 'teams#add_member'

  resources :invoices
  post '/send_invoice_to_client' => "invoices#send_invoice_to_client"
end
