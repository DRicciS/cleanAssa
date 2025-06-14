# config/routes.rb
Rails.application.routes.draw do
  # Set the homepage to the posts index page for now
  root "posts#index"

  resources :posts, only: [ :index, :show ]
  resources :users, only: [ :index, :show ]
end
