class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :id
  has_one :party
  has_many :caught_pokemons
end

