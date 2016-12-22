class PartySerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :user
  has_many :pokemons
end
