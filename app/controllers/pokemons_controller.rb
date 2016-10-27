class PokemonsController < ApplicationController

  before_action :set_pokemon, only: [:show, :destroy]

  def new
    if user_signed_in?
      poke_hash = Pokemon.catch_pokemon
      @pokemon = Pokemon.find_or_create_by(pid: poke_hash["national_id"], name: poke_hash["name"], 
        ability: poke_hash["abilities"][0]["name"].capitalize, 
        move1: poke_hash["moves"][Pokemon.random_move_number]["name"], 
        move2: poke_hash["moves"][Pokemon.random_move_number]["name"], 
        move3: poke_hash["moves"][Pokemon.random_move_number]["name"], 
        move4: poke_hash["moves"][Pokemon.random_move_number]["name"], 
        attack: poke_hash["attack"], 
        defense: poke_hash["defense"], 
        speed: poke_hash["speed"])
      current_user.pokemons << @pokemon
      redirect_to user_pokemon_path(current_user, @pokemon), :alert => "Congratulations! You just caught #{@pokemon.name}!" 
    else
      redirect_to root_path
    end
  end

  def show

  end

  def create
  end

  def destroy
    @pokemon.delete
    redirect_to :back
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end


end
