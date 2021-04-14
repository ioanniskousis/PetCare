Rails.application.routes.draw do
  resources :treatments
  resources :pet_images
  root "home#index"
  get '/home', to: 'home#index'
  get '/users', to: 'users#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # resources :users
  resources :pets
  resources :pets do
    resources :pet_images
  end
  resources :pets do
    resources :treatments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
