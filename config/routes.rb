Rails.application.routes.draw do

  root "welcome#index"

  get '/dashboard' => "dashboard#index"

  get '/about', to: 'welcome#about'

  get '/users', to: 'users#new'
  get '/users/:id', to: 'users#show'

  post '/users', to: 'users#create'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"

  get '/auth/evernote/callback', to: 'evernote#create'
  get '/auth/failure', to: 'evernote#failure'

  resource :reset_passwords
  get    '/reset-passwords/edit/:id' =>   'reset_passwords#edit'
  patch   '/reset-passwords/edit/:id' =>   'reset_passwords#update'

  resources :sessions

  resources :feature_requests

  resources :notes
  resources :contacts

  get '/bill_tracker', to: "bill_trackers#show"


end
