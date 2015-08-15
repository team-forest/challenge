Spotisquare::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }

  root :to => 'home#index'
  resources :challenges
end
