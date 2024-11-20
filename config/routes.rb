Rails.application.routes.draw do
  resources :pages
  resources :workspaces
  resource :session
  resources :passwords, param: :token

  get "up" => "rails/health#show", as: :rails_health_check
  get "home/index"
  get :sign_up, to: "users#new"
  post :sign_up, to: "users#create"

  root "pages#index"
end
