Rails.application.routes.draw do
  resources :founds
  resources :lost_photos
  resources :losts
  resources :treatment_categories
  resources :treatment_photos
  # get '/treatment_photos/delete/:id', to: 'treatment_photos#destroy', as: 'detete_treatment_photo'
  resources :treatments
  resources :pet_images
  root "home#index"
  get '/home', to: 'home#index'
  get '/dashboard', to: 'dashboard#index'
  get '/users', to: 'users#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :pets
  resources :pets do
    resources :pet_images
  end
  resources :pets do
    resources :treatments
  end
  resources :user do
    resources :treatments
  end
  resources :appointments, except: [:show]
  resources :users do
    resources :appointments, except: [:show]
  end

end
