ServerAps::Application.routes.draw do
  
  resources :external_posts

  resources :posts

  root "pages#home"
  
  get "/home", to: "pages#home", as: "home"
  
  get "/signin", to: "sessions#new", as: "signin"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy", as: "signout"
  
  namespace :admin do
    root "base#index"
    resources :users
  end
    
end
