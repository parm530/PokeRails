Rails.application.routes.draw do
  
  root "welcomes#home"
  get "pokedex", to: "pokemons#pokedex"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users do
    resources :pokemons, only: [:show, :destroy] 
    resources :parties, only: [:index, :new, :show, :edit, :destroy]
  end

  resources :party_pokemons
  resources :parties, except: [:new, :show]
  resources :user_pokemons
  resources :pokemons, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
