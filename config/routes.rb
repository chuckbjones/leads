Rails.application.routes.draw do
  devise_for :users

  resources :customers, only: %i[new create]
  resources :offices, only: %i[show edit update]
  get "/offices/:id/home", to: "offices#home", as: "office_home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "customers#new"
end
