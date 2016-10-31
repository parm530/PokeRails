class Pokemon < ApplicationRecord
  has_many :party_pokemons
  has_many :parties, through: :party_pokemons
  has_many :user_pokemons
  has_many :users, through: :user_pokemons


  def self.catch_pokemon
    num = rand(1..150)
    loader = Poke::API::Loader.new("pokemon")
    pokemon = loader.find(num)
  end

  def self.random_move_number
    Array.new(4) {rand(1..25) }.uniq
  end

  def self.create_pokemon(user)
    poke_hash = Pokemon.catch_pokemon
    random_num_array = Pokemon.random_move_number
    @pokemon = Pokemon.find_or_create_by(pid: poke_hash["national_id"], name: poke_hash["name"], 
      ability: poke_hash["abilities"][0]["name"].capitalize, 
      move1: poke_hash["moves"][random_num_array[0]]["name"], 
      move2: poke_hash["moves"][random_num_array[1]]["name"], 
      move3: poke_hash["moves"][random_num_array[2]]["name"], 
      move4: poke_hash["moves"][random_num_array[3]]["name"], 
      attack: poke_hash["attack"], 
      defense: poke_hash["defense"], 
      speed: poke_hash["speed"])
    user.caught_pokemons << @pokemon
    @pokemon
  end

end
