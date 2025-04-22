class CreateAvailableStrategems < ActiveRecord::Migration[8.0]
  def change
    create_table :available_strategems do |t|
      t.integer :keyword_id, null: false
      t.integer :strategem_id, null: false

      t.timestamps
    end
    add_index :available_strategems, [:keyword_id, :strategem_id], unique: true
  end
end
