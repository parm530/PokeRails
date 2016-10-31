class PartyPokemon < ApplicationRecord
  belongs_to :party
  belongs_to :pokemon
  validates :nature, :pokemon_name, presence: true

  def pokemon_name=(name)
    if name != ""
      @pokemon = Pokemon.find_by(name: name)
      if !@pokemon
        loader = Poke::API::Loader.new("pokemon")
        @pokemon = loader.find(name)
      end
    end
    @pokemon
  end

  def pokemon_name
    @pokemon
  end

  def self.nature
    ["Hardy", "Lonely", "Brave", "Adamant", "Naughty", "Bold", "Docile", 
      "Relaxed", "Impish", "Lax", "Timid", "Hasty", "Jolly", "Naive", "Modest", 
      "Mild", "Quiet", "Bashful", "Rash", "Calm", "Gentle", "Sassy", "Careful", "Quirky"]
  end
end
