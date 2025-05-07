class CreateModelKeywords < ActiveRecord::Migration[8.0]
  def change
    create_table :model_keywords do |t|
      t.integer :model_id, null: false
      t.integer :keyword_id, null: false

      t.timestamps
    end
    add_index :model_keywords, [ :model_id, :keyword_id ], unique: true
  end
end
