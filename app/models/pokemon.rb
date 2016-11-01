class Pokemon < ApplicationRecord
  has_many :party_pokemons
  has_many :parties, through: :party_pokemons
  has_many :user_pokemons
  has_many :users, through: :user_pokemons

  def self.by_types(type)
    where(types: type)
  end


  def self.catch_pokemon
    num = rand(1..150)
    loader = Poke::API::Loader.new("pokemon")
    pokemon = loader.find(num)
  end

  def self.random_move_number
    Array.new(6) {rand(1..20) }.uniq
  end

  def self.pkmn_find_or_create_by(name_hash)
    @pokemon = Pokemon.find_by(name: name_hash[:name])
    if !@pokemon
      loader = Poke::API::Loader.new("pokemon")      
      poke_hash = loader.find(name_hash[:name].downcase)
      @pokemon = Pokemon.create_pokemon(poke_hash)
    end
    @pokemon
  end

  def self.create_pokemon(poke_hash)
    random_num_array = Pokemon.random_move_number
    @pokemon = Pokemon.find_or_create_by(pid: poke_hash["national_id"], name: poke_hash["name"], 
      ability: poke_hash["abilities"][0]["name"].capitalize, 
      move1: poke_hash["moves"][random_num_array[0]]["name"], 
      move2: poke_hash["moves"][random_num_array[1]]["name"], 
      move3: poke_hash["moves"][random_num_array[2]]["name"], 
      move4: poke_hash["moves"][random_num_array[3]]["name"], 
      attack: poke_hash["attack"], 
      defense: poke_hash["defense"], 
      speed: poke_hash["speed"],
      types: types(poke_hash))
    @pokemon
  end

  def self.types(poke_hash)
    poke_hash["types"].collect do |type|
      type["name"].capitalize
    end.join(", ")
  end

end
