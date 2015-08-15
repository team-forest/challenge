Spotisquare::Application.routes.draw do
  devise_for :users

  root :to => 'home#index'
  get "session/create"
  get "session/destroy"
  
  get "/fb/auth", to: 'session#create'
end
