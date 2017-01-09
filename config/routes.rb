Rails.application.routes.draw do
  resources :needs
  resources :users
  get '/signin', to: 'sessions#new', as: 'signin'
end
