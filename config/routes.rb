Rails.application.routes.draw do
  root 'home#top'
  get '/posts/new', to: 'posts#new'
  post '/posts/create', to: 'posts#create'
  get '/posts/index', to: 'posts#index'
  get '/posts/:id', to: 'posts#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
