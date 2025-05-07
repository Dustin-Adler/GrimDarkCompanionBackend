class CreateStrategemKeywords < ActiveRecord::Migration[8.0]
  def change
    create_table :strategem_keywords do |t|
      t.integer :strategem_id, null: false
      t.integer :keyword_id, null: false

      t.timestamps
    end
    add_index :strategem_keywords, [ :strategem_id, :keyword_id ], unique: true
  end
end
