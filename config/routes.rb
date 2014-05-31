Rails.application.routes.draw do

  root "welcome#index"

  get '/dashboard' => "dashboard#index"

  get '/about', to: 'welcome#about'

  get '/users', to: 'users#new'
  get '/users/:id', to: 'users#show'

  post '/users', to: 'users#create'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"

  resources :sessions

  resources :feature_requests

  resources :notes
  resources :contacts

  get '/bill_tracker', to: "bill_trackers#show"


end
