class PokedexController < ApplicationController

  def index
    @array = Array (1..386)
    @pokemons = Pokemon.all.order(:pid)
  end

end
