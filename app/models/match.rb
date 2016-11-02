class Match < ApplicationRecord

  # def build_team(trainer)
  #   trainer.caught_pokemons.sample(self.team_size)
  # end

  def self.battle(team1, team2)
    Array(0..team1.size-1).collect do |x|
      if team1[x].attack > team2[x].attack
        "Team1"
      else
        "Team2"
      end
    end
  end
  
end
