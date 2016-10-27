class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    
  end

  def create
    
  end

  def show
    
  end

  def edit
    
  end

  def update

    if user_signed_in?
      current_user.update(user_params)
    end
    redirect_to user_path(current_user)
  end


  private

  def user_params
    params.require(:user).permit(:name, :age, :hometown)
  end
  
end
