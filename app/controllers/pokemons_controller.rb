class PokemonsController < ApplicationController

  before_action :set_pokemon, only: [:show, :destroy]
  before_action :set_user, only: [:show, :destroy]
  before_action :set_user_pokemon, only: [:destroy]

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
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @pokemon }
    end
  end

  def index
    @pokemons = Pokemon.all
  end

  def create
  end

  def destroy
    temp = []
    temp << @pkmn
    current_user.caught_pokemons -= temp
    redirect_to :back
  end


  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_user_pokemon
    @pkmn = current_user.caught_pokemons.find(params[:id])
  end

end
