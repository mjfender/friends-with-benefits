Rails.application.routes.draw do

  resources :needs do
    resources :events
  end
   post '/needs/:need_id/events/:id/edit', to: 'events#edit'
  # params[:need_id], params[:id] for event.id

  match '/needs/:need_id/participants/:id/leave', to:'needs#remove_participant', as: "remove_participant", via: [:get, :post]

  match '/needs/:need_id/remove-from-group/:group_id', to: 'needs#remove_from_group', as: "remove_from_group",  via: [:get, :post]

  get "avatar/:size/:background/:text" => Dragonfly.app.endpoint { |params, app|
  app.generate(:initial_avatar, URI.unescape(params[:text]), { size: params[:size], background_color: params[:background] })
}, as: :avatar


  resources :groups do
    resources :memberships, except: ["show"]
  end

  root 'users#new'
  # get '/signup', to: 'users#new', as: 'signup'

  get '/users/new', to: 'users#new'

  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  post '/users', to: 'users#create'

  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  post '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'
  get '/users/set_default_group/:group_id', to: 'users#set_default_group', as: 'set_default_group'

  delete '/users/:id', to: 'users#destroy'

  get '/login', to: 'sessions#new', as: 'login'
  get '/signin', to: 'sessions#new', as: 'signin'
  # remove signin in the Needs files, eventually :)
  post '/sessions', to: 'sessions#create'
  get '/sessions/destroy', to: 'sessions#destroy', as: 'logout'


  get '/replies/new', to: 'replies#new', as: 'new_reply'
  post '/replies', to: 'replies#create'
  get '/replies/:id/edit', to: 'replies#edit', as: 'edit_reply'
  post '/replies/:id/edit', to: 'replies#edit'
  patch '/replies/:id', to: 'replies#update'
  delete '/replies/:id', to: 'replies#destroy', as: 'delete_reply'
  get '/replies/:id', to: 'replies#show', as: 'reply'


  # Members. Maybe super ugly & bad.

  get '/groups/:group_id/memberships/:user_id/revoke', to: 'memberships#revoke', as: 'revoke_membership'


  get '/groups/:group_id/memberships/:user_id/admin', to: 'memberships#request_admin', as: 'admin_request'

  get '/groups/:group_id/memberships/:user_id/deny_admin', to: 'memberships#deny_admin', as: 'deny_admin'

  get '/groups/:group_id/memberships/:user_id/admin_toggle', to: 'memberships#toggle_admin', as: 'toggle_admin'

  get '/groups/:group_id/memberships/request-invite', to: 'memberships#request_invite', as: 'request_group_membership'

  get '/groups/:group_id/memberships/:user_id/request-invite/approve', to: 'memberships#approve_membership_request', as: 'approve_group_membership'

  get '/groups/:group_id/memberships/:user_id/request-invite/deny', to: 'memberships#deny_membership_request', as: 'deny_group_membership'

  match '/groups/:group_id/memberships/approve-all/', to: 'memberships#approve_all_memberships', as: 'approve_all_group_membership', via: [:get, :post]

  match '/groups/:group_id/memberships/leave', to: 'memberships#leave_group', as: 'leave_group', via: [:get, :post]


  get '/dashboards/index', to: 'dashboards#index', as: 'dashboard'

end
