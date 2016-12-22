class SearchesController < ApplicationController

  def new
    @type = params[:type]
    @pokemons = Pokemon.by_types(params[:type].capitalize)
    if @pokemons == []
      redirect_to root_path, :alert => "Invalid search query!"
    else
      render '/pokemons/index'
    end
  end

end
