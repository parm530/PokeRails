Rails.application.routes.draw do

  root "welcomes#home"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users do
    resources :pokemons, only: [:show] 
  end

  resources :user_pokemons
  resources :pokemons, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
