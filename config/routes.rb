Spotisquare::Application.routes.draw do
  get "sessions/create"

  get "sessions/destroy"

  devise_for :users

  root :to => 'home#index'
  get "session/create"
  get "session/destroy"
  
  get "/fb/auth", to: 'sessions#create'

  get "/challenge" => "home#challenge"
end
