class CreateEnhancements < ActiveRecord::Migration[8.0]
  def change
    create_table :enhancements do |t|
      t.integer :detachment_id, null: false
      t.integer :cost, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.text :rule, null: false

      t.timestamps
    end
    add_index :enhancements, :detachment_id
  end
end
