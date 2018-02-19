Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'home#top'
  get '/posts/new', to: 'posts#new'
  post '/posts/create', to: 'posts#create'
  get '/posts/index', to: 'posts#index'
  get '/posts/:id', to: 'posts#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
