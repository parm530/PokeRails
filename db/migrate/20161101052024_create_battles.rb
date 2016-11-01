class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.integer :prize

      t.timestamps
    end
  end
end
