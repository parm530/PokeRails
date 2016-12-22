class AddColumnToPokemons < ActiveRecord::Migration[5.0]
  def change
    add_column :pokemons, :image_link, :string
  end
end
