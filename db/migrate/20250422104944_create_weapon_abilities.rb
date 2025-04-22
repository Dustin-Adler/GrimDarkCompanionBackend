class CreateWeaponAbilities < ActiveRecord::Migration[8.0]
  def change
    create_table :weapon_abilities do |t|
      t.integer :weapon_id, null: false
      t.integer :ability_id, null: false

      t.timestamps
    end
    add_index :weapon_abilities, [:weapon_id, :ability_id], unique: true
  end
end
