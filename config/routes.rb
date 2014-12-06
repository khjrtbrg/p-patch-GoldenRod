Rails.application.routes.draw do

  # Users Routes
  get  "users",      to: "users#index",      as: :users
  get  "users/new",  to: "users#new",        as: :new_user
  post "users",      to: "users#create"

  # Sessions Routes
  get  "login",      to: "sessions#new",     as: :login
  post "login",      to: "sessions#create"
  post "logout",     to: "sessions#destroy", as: :logout

  # Posts Routes
  get  "posts",      to: "posts#index",      as: :posts
  get  "posts/new",  to: "posts#new",        as: :new_post
  post "posts",      to: "posts#create"

  # Tools Routes
  get  "tools",      to: "tools#index",      as: :tools
  get  "tools/new",  to: "tools#new",        as: :new_tool
  post "tools",      to: "tools#create"
  get  "tools/:id",  to: "tools#show",       as: :tool
  patch "tools/:id", to: "tools#update"

  root "home#index"

  # For Reference
  resources :flamingo

end
