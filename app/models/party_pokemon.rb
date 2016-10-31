class PartyPokemon < ApplicationRecord
  belongs_to :party
  belongs_to :pokemon
  validates :nature, presence: true

  def pokemon_name=(name)
    if name != ""
      @pokemon = Pokemon.pkmn_find_or_create_by(name)
    end
    @pokemon
  end

  def pokemon_name
    @pokemon
  end
  
end
