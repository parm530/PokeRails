class PartiesController < ApplicationController

  def new
    @party = Party.new
    @party.party_pokemons.build()
    @party.party_pokemons.build()
    @party.party_pokemons.build()
  end

  def create
    # binding.pry
    party = Party.create(party_params)
    redirect_to user_party_path(current_user, party)
  end

  def show
    
  end

  private

  def party_params
    params.require(:party).permit(:name, party_pokemons_attributes: [:pokemon_name, :nature])
  end

end
