Spotisquare::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }

  root :to => 'home#index'
  resources :challenges
  resources :challenge_data
  get '/done', to: 'home#mark_as_done'
end
