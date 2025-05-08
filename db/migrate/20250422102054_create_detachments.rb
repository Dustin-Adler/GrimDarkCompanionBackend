class CreateDetachments < ActiveRecord::Migration[8.0]
  def change
    create_table :detachments do |t|
      t.string :detachment_name, null: false
      t.text :detachment_description
      t.string :rule_name, null: false
      t.text :rule_description
      t.text :rule, null: false
      t.text :keyword_info
      t.integer :model_id
      t.integer :keyword_id
      t.integer :army_id, null: false

      t.timestamps
    end
    add_index :detachments, :army_id
  end
end
