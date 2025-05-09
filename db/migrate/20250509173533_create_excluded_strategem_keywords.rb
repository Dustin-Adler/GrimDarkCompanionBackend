class CreateExcludedStrategemKeywords < ActiveRecord::Migration[8.0]
  def change
    create_table :excluded_strategem_keywords do |t|
      t.integer :strategem_id
      t.integer :keyword_id

      t.timestamps
    end
  end
end
