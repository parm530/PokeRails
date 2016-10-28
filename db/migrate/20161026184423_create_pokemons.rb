class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.integer :pid
      t.string :name
      t.string :ability
      t.string :move1
      t.string :move2
      t.string :move3
      t.string :move4
      t.integer :attack
      t.integer :defense
      t.integer :speed

      t.timestamps
    end
  end
end
