class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @users }
    end
  end

  def new
    
  end

  def create
    
  end

  def show
    # binding.pry
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user }
    end
  end

  def edit
    
  end

  def update
    if user_signed_in? && current_user == @user
      current_user.update(user_params)
    end
    redirect_to user_path(current_user)
  end

  def caught_pokemon
    @user = User.find_by(id: params[:user_id])
    render json: @user
    # binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :hometown)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
  
end
