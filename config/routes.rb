Rails.application.routes.draw do

  root 'users#new'
  # get '/signup', to: 'users#new', as: 'signup'
  
  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'

  post '/users', to: 'users#create'

end
