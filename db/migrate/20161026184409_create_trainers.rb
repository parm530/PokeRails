class CreateTrainers < ActiveRecord::Migration[5.0]
  def change
    create_table :trainers do |t|
      t.integer :user_id
      t.string :name
      t.integer :age
      t.string :hometown
      t.timestamps
    end
  end
end
