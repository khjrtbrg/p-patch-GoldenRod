Rails.application.routes.draw do

  # Users Routes
  get  "users",      to: "users#index",      as: :users
  get  "users/new",  to: "users#new",        as: :new_user
  post "users",      to: "users#create"

  # Sessions Routes
  get  "logout",     to: "sessions#destroy", as: :logout

  root "home#index"

end
