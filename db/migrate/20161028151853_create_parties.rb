class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.integer :user_id
      t.integer :limit, default: 6
      t.string :name

      t.timestamps
    end
  end
end
