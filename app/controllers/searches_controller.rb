class SearchesController < ApplicationController

  def new
    @pokemons = Pokemon.by_types(params[:type].capitalize)
    if @pokemons == []
      redirect_to root_path, :alert => "Invalid search query!"
    else
      render '/pokemons/index'
    end
  end

end
