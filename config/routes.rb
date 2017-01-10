Rails.application.routes.draw do

  resources :needs

  root 'users#new'
  # get '/signup', to: 'users#new', as: 'signup'

  get '/users/new', to: 'users#new'

  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  post '/users', to: 'users#create'

  delete '/users/:id', to: 'users#destroy'

  get '/login', to: 'sessions#new', as: 'login'
  get '/signin', to: 'sessions#new', as: 'signin'
  # remove signin in the Needs files, eventually :)
  post '/sessions', to: 'sessions#create'
  get '/sessions/destroy', to: 'sessions#destroy', as: 'logout'

end
