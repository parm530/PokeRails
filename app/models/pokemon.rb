class Pokemon < ApplicationRecord
  has_many :party_pokemons
  has_many :parties, through: :party_pokemons
  has_many :user_pokemons
  has_many :users, through: :user_pokemons

  scope :by_types, -> type {all.select{|pokemon| pokemon.types.include?(type)}} 
  
  def self.catch_pokemon
    num = rand(1..300)
    loader = Poke::API::Loader.new("pokemon")
    pokemon = loader.find(num)
  end

  def self.random_num_array(num)
    array = Array.new(10) {rand(1..num-1) }.uniq.first(4)
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
    if poke_hash["moves"].size <= 5
      @pokemon = Pokemon.find_or_create_by(pid: poke_hash["national_id"], name: poke_hash["name"], 
        ability: poke_hash["abilities"][0]["name"].capitalize, 
        move1: poke_hash["moves"][0]["name"], 
        move2: poke_hash["moves"][1]["name"],  
        attack: poke_hash["attack"], 
        defense: poke_hash["defense"], 
        speed: poke_hash["speed"],
        types: types(poke_hash))
    else
      random = Pokemon.random_num_array(poke_hash["moves"].size)
      @pokemon = Pokemon.find_or_create_by(pid: poke_hash["national_id"], name: poke_hash["name"], 
        ability: poke_hash["abilities"][0]["name"].capitalize, 
        move1: poke_hash["moves"][random[0]]["name"], 
        move2: poke_hash["moves"][random[1]]["name"], 
        move3: poke_hash["moves"][random[2]]["name"], 
        move4: poke_hash["moves"][random[3]]["name"], 
        attack: poke_hash["attack"], 
        defense: poke_hash["defense"], 
        speed: poke_hash["speed"],
        types: types(poke_hash))
    end
    @pokemon
  end

  def self.types(poke_hash)
    poke_hash["types"].collect do |type|
      type["name"].capitalize
    end.join(", ")
  end

end
