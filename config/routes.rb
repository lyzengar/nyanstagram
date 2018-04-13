Rails.application.routes.draw do
  resources :cats
  resources :users, only: [:new, :create]
  resources :comments, only: [:new, :create, delete]
  resources :likes, only: [:create]
  resources :dislikes, only: [:create]
end
