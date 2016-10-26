Rails.application.routes.draw do
  devise_for :users
  root "welcomes#home"
  resources :battles
  resources :user_pokemons
  resources :pokemons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
