class CreateWeapons < ActiveRecord::Migration[8.0]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.boolean :meelee, null: false
      t.integer :range, null: false
      t.string :attacks, null: false
      t.integer :proficiency, null: false
      t.string :strength, null: false
      t.integer :armour_penetration, null: false, default: 0
      t.string :damage, null: false
      t.integer :model_id, null: false

      t.timestamps
    end
  end
end
