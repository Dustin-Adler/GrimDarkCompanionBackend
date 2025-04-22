class CreateStrategems < ActiveRecord::Migration[8.0]
  def change
    create_table :strategems do |t|
      t.string :name, null: false
      t.integer :cost, null: false
      t.string :when, null: false
      t.string :target, null: false
      t.string :effect, null: false
      t.string :restrictions, null: false
      t.integer :detachment_id, null: false

      t.timestamps
    end
    add_index :strategems, :detachment_id
  end
end
