class Party < ApplicationRecord
  belongs_to :user
  has_many :party_pokemons
  has_many :pokemons, through: :party_pokemons

  validates :name, presence: true


  def party_pokemons_attributes=(party_pokemons_attributes)
    party_pokemons_attributes.each do |party_pokemon_attributes|
      self.party_pokemons.build(party_pokemon_attributes)
    end
  end



end
