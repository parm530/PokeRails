class Pokemon < ApplicationRecord
  has_many :user_pokemons
  has_many :users, through: :user_pokemons


  def self.catch_pokemon
    num = rand(1..50)
    loader = Poke::API::Loader.new("pokemon")
    pokemon = loader.find(num)
  end

  def self.random_move_number
    num = rand(1..25)
  end

  
end
