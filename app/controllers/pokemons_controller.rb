class PokemonsController < ApplicationController

  before_action :set_pokemon, only: [:show, :destroy]

  def new
    if user_signed_in?
      @pokemon = Pokemon.create_pokemon(current_user)
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
