NotationalMomentum::Application.routes.draw do
  root to: "home#index"

  match "signup" => "users#new", via: :get

  resource :account, controller: "users", only: [:new, :create]
end
