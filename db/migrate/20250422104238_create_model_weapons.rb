class CreateModelWeapons < ActiveRecord::Migration[8.0]
  def change
    create_table :model_weapons do |t|
      t.integer :model_id, null: false
      t.integer :weapon_id, null: false

      t.timestamps
    end
    add_index :model_weapons, [:model_id, :weapon_id], unique: true
  end
end
