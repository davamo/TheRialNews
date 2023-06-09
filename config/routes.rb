Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :comments, only: [:create, :edit, :update, :destroy]

  resources :articles do
    resources :comments, only: [:create]
  end

  resources :articles, except: [:index]
  root "home#index"
  get '/articles', to: 'articles#index', as: 'user_root'
end
