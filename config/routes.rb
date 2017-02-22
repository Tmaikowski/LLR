Rails.application.routes.draw do
  root 'users#index'

  resources :users
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'

  resources :clients

  resources :sales
end
