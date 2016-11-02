class PartiesController < ApplicationController

  before_action :set_party, only: [:show, :edit, :destroy]
  before_action :set_user, only: [:index, :edit, :new, :destroy]

  def index
    @user_parties = @user.parties
  end

  def new
    @party = Party.new
    @party.party_pokemons.build()
    @party.party_pokemons.build()
    @party.party_pokemons.build()
  end

  def create
    # @party = Party.create(user_id: current_user.id)
    # @party.update(party_params)
    @party = Party.new(party_params)
    if @party.valid?
      @party.save
      redirect_to user_party_path(current_user.id, @party)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @party.delete
    redirect_to :back
  end

  def edit
    
  end

  def update
    
  end

  private

  def party_params
    params.require(:party).permit(:user_id, :name, party_pokemons_attributes: [:pokemon_name, :nature])
  end

  def set_party
    @party = Party.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end
