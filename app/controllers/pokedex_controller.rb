class PokedexController < ApplicationController

  def index
    @array = Array (1..300)
    @pokemons = Pokemon.all.order(:pid)
  end

end
