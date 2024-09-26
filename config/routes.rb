Rails.application.routes.draw do
  get "user_sessions/new"
  get "user_sessions/create"
  get "users/index"
  get "users/new"
  get "users/create"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "/login", to: "user_sessions#new"
  delete "/logout", to: "user_sessions#destroy", as: :logout  # Logout route

  # Defines the root path route ("/")
  root 'pages#index'
  get 'pages/secret'

  resources :user_sessions, only: [:new, :create]
  resources :users, only: [:show, :new, :create, :index, :edit, :update]

  # Game events routes
  resources :game_events do
    resources :cancellations, only: [:new, :create] # Nested cancellations routes
  end
  
  get 'assigned_games', to: 'game_events#assignedGames'
end
