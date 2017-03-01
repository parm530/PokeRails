class Party < ApplicationRecord
  belongs_to :user
  has_many :party_pokemons
  has_many :pokemons, through: :party_pokemons

  validates :name, presence: true

  # def party_pokemons_attributes=(party_pokemons_attributes)
  #   binding.pry
  #   party_pokemons_attributes.values.each do |pkmn_info|
  #     pokemon = Pokemon.pkmn_find_or_create_by(name: pkmn_info[:pokemon_name])
  #     x = self.party_pokemons.build(pokemon_id: pokemon.id, nature: pkmn_info[:nature])
  #     x.save
  #   end
  # end

end