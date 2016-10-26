Rails.application.routes.draw do
  # devise_for :users

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
    
  resources :users
  root "welcomes#home"
  resources :battles
  resources :user_pokemons
  resources :pokemons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
