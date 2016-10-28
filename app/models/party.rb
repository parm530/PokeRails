class Party < ApplicationRecord
  belongs_to :user
  has_many :party_pokemons
  has_many :pokemons, through: :party_pokemons
end
