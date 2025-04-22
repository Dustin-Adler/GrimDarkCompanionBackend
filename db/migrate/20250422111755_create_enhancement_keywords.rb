class CreateEnhancementKeywords < ActiveRecord::Migration[8.0]
  def change
    create_table :enhancement_keywords do |t|
      t.integer :enhancement_id, null: false
      t.integer :keyword_id, null: false

      t.timestamps
    end
    add_index :enhancement_keywords, [:enhancement_id, :keyword_id], unique: true
  end
end
