Rails.application.routes.draw do

  root "welcome#index"


  get '/about', to: 'welcome#about'

  get '/users', to: 'users#new'

  post '/users', to: 'users#create'

  resources :feature_requests

  resources :notes


end
