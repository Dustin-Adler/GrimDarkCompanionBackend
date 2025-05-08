class CreateStrategems < ActiveRecord::Migration[8.0]
  def change
    create_table :strategems do |t|
      t.string :name, null: false
      t.text :flavour_text, null: false
      t.integer :cost, null: false
      t.text :when, null: false
      t.text :target, null: false
      t.text :effect, null: false
      t.string :category, null: false
      t.text :restrictions
      t.integer :detachment_id

      t.timestamps
    end
    add_index :strategems, :detachment_id
  end
end
