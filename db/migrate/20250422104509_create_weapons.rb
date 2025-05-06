class CreateWeapons < ActiveRecord::Migration[8.0]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.boolean :meelee, null: false
      t.integer :range, default: 0
      t.string :attacks, null: false
      t.integer :proficiency, null: false
      t.string :strength, null: false
      t.integer :armour_penetration, default: 0
      t.string :damage, null: false
      t.integer :equipped, default: 0
      t.integer :equip_limit, default: 1
      t.integer :model_id, null: false
      t.integer :weapon_id
      t.integer :models_per_weapon
      t.string :wargear_types, array: true, default: []

      t.timestamps
    end
  end
end
