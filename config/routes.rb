Rails.application.routes.draw do
  root 'home#top'
  get 'posts/index'
  get "/posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/index" => "posts#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
