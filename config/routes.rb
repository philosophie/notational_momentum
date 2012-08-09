NotationalMomentum::Application.routes.draw do
  root to: "home#index"

  match "signup" => "users#new", via: :get

  resources :users, only: [:new, :create]
end
