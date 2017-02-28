Rails.application.routes.draw do
  
  root "welcomes#home"
  get "pokedex", to: "pokedex#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations'}
  resources :users do
    get 'caught_pokemon', to: "users#caught_pokemon"
    resources :pokemons, only: [:show, :destroy] 
    resources :parties, only: [:index, :new, :show, :edit, :destroy]
  end

  resources :searches
  resources :battles
  resources :matches
  resources :party_pokemons
  resources :parties, except: [:new, :show]
  resources :user_pokemons
  resources :pokemons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
