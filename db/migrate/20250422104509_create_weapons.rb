class CreateWeapons < ActiveRecord::Migration[8.0]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.boolean :meelee, null: false
      t.integer :range, null: false
      t.integer :attacks, null: false
      t.integer :proficiency, null: false
      t.integer :strength, null: false
      t.string :damage, null: false

      t.timestamps
    end
  end
end
