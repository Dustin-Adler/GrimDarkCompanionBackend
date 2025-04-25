# note: name generater for Unit name could be fun or interesting for users

class CreateUnits < ActiveRecord::Migration[8.0]
  def change
    create_table :units do |t|
      t.string :name, null: false
      t.string :note
      t.integer :list_id, null: false
      t.integer :leader_one_id
      t.integer :leader_two_id
      t.integer :squad_id, null: false
      t.string :squad_quantity, null: false
      t.integer :enhancement_id

      t.timestamps
    end
    add_index :units, :list_id
  end
end
