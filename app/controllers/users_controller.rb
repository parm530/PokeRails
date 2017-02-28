class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_filter :authenticate_user!

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
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user }
    end
  end

  def edit
    if(current_user == @user)
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user)
  end

  def caught_pokemon
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :hometown)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end
