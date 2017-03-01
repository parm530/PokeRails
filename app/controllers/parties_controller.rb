class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :destroy]
  before_action :set_user, only: [:index, :edit, :new, :destroy]

  def index
    @user_party = @user.party
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user_party}
    end
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    if @party.valid?
      @party.save
      # redirect_to user_party_path(current_user.id, @party)
      render json: @party, status: 201
    else
      render :new
    end
  end

  def show
    
  end

  def update
    current_user.party.update(party_params)
    redirect_to user_path(current_user)
  end
  
  def destroy
    @party.delete
    redirect_to :back
  end

  def edit
    
  end

  private

  def party_params
    params.require(:party).permit(:user_id, :name, pokemon_ids: [])
  end

  def set_party
    @party = current_user.party

  end

  def set_user
    @user = current_user
  end

end
