class CreateDetachments < ActiveRecord::Migration[8.0]
  def change
    create_table :detachments do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :army_id, null: false

      t.timestamps
    end
    add_index :detachments, :army_id
  end
end
