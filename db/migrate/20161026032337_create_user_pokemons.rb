class CreateUserPokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :user_pokemons do |t|

      t.timestamps
    end
  end
end
