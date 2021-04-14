Rails.application.routes.draw do
  root "home#index"
  get '/home', to: 'home#index'
  get '/users', to: 'users#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # resources :users
  resources :pets

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
