Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :comments, only: [:create, :edit, :update, :destroy]

  resources :articles do
    resources :comments, only: [:create]
  end
  root "home#index"
end
