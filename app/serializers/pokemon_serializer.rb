class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name, :ability, :move1, :move2, :move3, :move4, :attack, :defense, :speed, :image_link, :types
  # belongs_to :party
end
