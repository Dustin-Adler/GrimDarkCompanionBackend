class CreateLists < ActiveRecord::Migration[8.0]
  def change
    create_table :lists do |t|
      t.integer :user_id, null: false
      t.integer :army_id, null: false
      t.integer :value_limit, null: false
      t.integer :value, null: false
      t.string :name, null: false
      t.text :note

      t.timestamps
    end
    add_index :lists, :user_id
  end
end
