class PokemonsController < ApplicationController

  before_action :set_pokemon, only: [:show, :destroy]

  def new
    if user_signed_in?
      poke_hash = Pokemon.catch_pokemon
      @pokemon = Pokemon.create_pokemon(poke_hash)
      current_user.caught_pokemons << @pokemon
      redirect_to user_pokemon_path(current_user, @pokemon), :alert => "Congratulations! You just caught #{@pokemon.name}!" 
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:user_id])
  end

  def index
    @pokemons = Pokemon.all
  end

  def create
  end

  def destroy
    @pokemon.delete
    redirect_to :back
  end

  def pokedex
    @array = Array (1..150)
    @user = current_user
    @pokemons = current_user.caught_pokemons.order(:pid)
  end

  def select_type
    @pokemons = Pokemon.by_types(params[:type].capitalize)
    render 'index'
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end


end
