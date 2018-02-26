Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/users/index', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  post '/users/:id/update', to: 'users#update'

  root 'home#top'
  get '/posts/new', to: 'posts#new'
  post '/posts/create', to: 'posts#create'
  get '/posts/index', to: 'posts#index'
  get '/posts/:id', to: 'posts#show'

  post '/posts/:post_id/comments/create', to: 'comments#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
