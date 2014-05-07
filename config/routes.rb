Rails.application.routes.draw do

  root "welcome#index"


  get '/about', to: 'welcome#about'

  get '/users', to: 'users#new'

  post '/users', to: 'users#create'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"

  resources :sessions

  resources :feature_requests

  resources :notes


end
