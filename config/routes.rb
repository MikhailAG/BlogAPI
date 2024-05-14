Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :comments
  resources :categories
  resources :tags
end
