Rails.application.routes.draw do
  resources :users
  resources :user_steps
  root to: 'users#index'

  get "destroy_session", to: "users#destroy_session"
  get "destroy_all_users", to: "users#destroy_all_users"
end
