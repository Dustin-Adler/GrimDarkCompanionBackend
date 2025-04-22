class CreateAbilities < ActiveRecord::Migration[8.0]
  def change
    create_table :abilities do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.text :rule, null: false
      t.text :example, null: false
      t.string :tldr, null: false

      t.timestamps
    end
  end
end
