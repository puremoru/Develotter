Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'
  get "/auth/failure" => "sessions#failure"
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/users/index', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  post '/users/:id/update', to: 'users#update'

  root 'home#top'
  get '/privacy', to: 'home#privacy'
  get '/posts/new', to: 'posts#new'
  post '/posts/create', to: 'posts#create'
  get '/posts/index', to: 'posts#index'
  get '/posts/trend', to: 'posts#trend'
  get '/posts/:id', to: 'posts#show'
  get '/posts/:id/edit', to: 'posts#edit'
  post '/posts/:id/update', to: 'posts#update'
  post '/posts/:id/destroy', to: 'posts#destroy'

  post '/posts/:post_id/comments/create', to: 'comments#create'
  post '/posts/:post_id/comments/:id/destroy', to: 'comments#destroy'
  post '/posts/:post_id/likes/create', to: 'likes#create'
  post '/posts/:post_id/likes/destroy', to: 'likes#destroy'
  post '/posts/:post_id/stars/create', to: 'stars#create'
  post '/posts/:post_id/stars/destroy', to: 'stars#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
