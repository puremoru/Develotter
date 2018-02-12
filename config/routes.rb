Rails.application.routes.draw do
  root 'home#top'
  get '/posts/index', to: 'posts#index'
  get '/posts/new', to: 'posts#new'
  post '/posts/create', to: 'posts#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
