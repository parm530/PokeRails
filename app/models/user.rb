class User < ApplicationRecord
  has_one :party
  # has_many :parties
  has_many :party_pokemons, through: :parties
  has_many :pokemons, through: :party_pokemons  

  has_many :user_pokemons
  has_many :caught_pokemons, through: :user_pokemons, source: :pokemon

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      u_name = auth.info.name.split(" ")
      user.first_name = u_name[0]
      user.last_name = u_name[1]
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end

end
