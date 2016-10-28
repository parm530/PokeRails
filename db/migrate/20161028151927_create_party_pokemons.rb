class CreatePartyPokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :party_pokemons do |t|
      t.integer :party_id
      t.integer :pokemon_id
      t.string :nature
      t.string :item

      t.timestamps
    end
  end
end
