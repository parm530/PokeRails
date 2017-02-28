class UserSerializer < ActiveModel::Serializer
  attributes :name, :id
  has_many :parties
  has_many :caught_pokemons
end

