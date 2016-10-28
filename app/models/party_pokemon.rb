class PartyPokemon < ApplicationRecord
  belongs_to :party
  belongs_to :pokemon
end
