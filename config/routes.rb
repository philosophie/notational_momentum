NotationalMomentum::Application.routes.draw do
  devise_for :users

  root to: "home#index"

  match "signup" => "users#new", via: :get

  resources :users, only: [:new, :create]
end
