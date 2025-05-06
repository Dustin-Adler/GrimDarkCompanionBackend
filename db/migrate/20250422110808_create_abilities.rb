class CreateAbilities < ActiveRecord::Migration[8.0]
  def change
    create_table :abilities do |t|
      t.string :name, null: false
      t.text :flavour_text
      t.text :rule, null: false
      t.text :example
      t.text :tldr
      t.string :ability_type, null: false
      t.integer :model_id
      t.integer :army_id
      t.integer :wargear_id

      t.timestamps
    end
    add_index :abilities, :name
    add_index :abilities, :model_id
    add_index :abilities, :army_id
    add_index :abilities, :ability_type
  end
end
