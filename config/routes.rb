Rails.application.routes.draw do
  root "cats#index"
  resources :cats do
    resources :comments, only: [:create, :destroy, :edit, :update], shallow: true
    resources :likes, only: [:create]
    resources :dislikes, only: [:create]
  end
  resources :users, only: [:new, :create, :destroy]
  get "/login", to: "sessions#new"
end
