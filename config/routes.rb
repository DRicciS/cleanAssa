# config/routes.rb
Rails.application.routes.draw do
  root "posts#index"
  devise_for :users

  # This expands the routes to include :new, :create, :edit, :update, and :destroy
  resources :posts do
    # This nests the comment routes under posts, as comments belong to a post.
    resources :comments, only: [ :create, :destroy ]
  end

  # We will keep the user routes as they were, since we are not editing users.
  resources :users, only: [ :index, :show ]
end
