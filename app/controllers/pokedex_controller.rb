class PokedexController < ApplicationController

  def index
    @array = Array (1..150)
    @user = current_user
    @pokemons = current_user.caught_pokemons.order(:pid)
  end

end
