class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.integer :battle_id
      t.integer :team_size
      t.string :status

      t.timestamps
    end
  end
end
