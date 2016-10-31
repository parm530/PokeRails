class PartiesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @user_parties = @user.parties
  end

  def new
    @party = Party.new
    @party.party_pokemons.build()
    @party.party_pokemons.build()
    @party.party_pokemons.build()
  end

  def create
    @party = Party.create(user_id: current_user.id)
    @party.update(party_params)
    redirect_to user_party_path(current_user.id, @party)
  end

  def show
    @party = Party.find(params[:id])
  end

  private

  def party_params
    params.require(:party).permit(:user_id, :name, party_pokemons_attributes: [:pokemon_name, :nature])
  end

end
