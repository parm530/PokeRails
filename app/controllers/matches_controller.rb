class MatchesController < ApplicationController

  def new
    @match = Match.new
  end

  def create
    @team1 = current_user.party.pokemons
    @user2 = User.find_by(id: params[:match][:user2_id])
    @team2 = @user2.party.pokemons

    if(@team1.size == 6 && @team2.size == 6) 
      results_array = Match.battle(@team1, @team2)

      frequency = results_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      winner = results_array.max_by { |v| frequency[v] }
      if winner == "Team1"
        params[:match][:status] = "#{current_user.first_name} is the winner!"
      else
        params[:match][:status] = "#{@user2.first_name} is the winner!"
      end
        @match = Match.create(match_params)
        render :create
    else
        redirect_to new_match_path, :alert => "Party Size Must Equal 6!!"
    end
  
  end

  private

  def match_params
    params.require(:match).permit(:user1_id, :user2_id, :team_size, :status)
    
  end
  
end
