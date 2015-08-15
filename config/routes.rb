Spotisquare::Application.routes.draw do
  get "callbacks/facebook"
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }

  root :to => 'home#index'
  get "session/create"
  get "session/destroy"
  
  get "/fb/auth", to: 'sessions#create'

  get "/challenge" => "home#challenge"
  get "/challenge/create" => "home#createChallenge"
  post "/challenge/cChallenge" => "home#cChallenge"
  get "/challenge/list" => "home#challengeList"
end
