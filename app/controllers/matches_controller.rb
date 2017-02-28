class MatchesController < ApplicationController

  def new
    @match = Match.new
  end

  def create
    amount = params[:match][:team_size].to_i
    @team1 = current_user.caught_pokemons.sample(amount)
    @user2 = User.find_by(id: params[:match][:user2_id])
    @team2 = @user2.caught_pokemons.sample(amount)
    if @team1.size == amount && @team2.size == amount 
      results_array = Match.battle(@team1, @team2)
      freq = results_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      winner = results_array.max_by { |v| freq[v] }
      if winner == "Team1"
        params[:match][:status] = "#{current_user.name} is the winner!"
      else
        params[:match][:status] = "#{@user2.name} is the winner!"
      end
        @match = Match.create(match_params)
        render :create
    else
        redirect_to new_match_path, :alert => "INVALID PARTY SIZE!"
    end
  
  end

  private

  def match_params
    params.require(:match).permit(:user1_id, :user2_id, :team_size, :status)
    
  end
  
end
