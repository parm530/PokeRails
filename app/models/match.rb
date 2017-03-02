class Match < ApplicationRecord
  
  def self.battle(team1, team2)
    range = (0..5)
    array = range.to_a
    array.collect do |index|
      if team1[index].speed > team2[index].speed
        if team1[index].attack > team2[index].attack
          "Team1"
        end
        "Team2"
      end
    end
  end
  
end
