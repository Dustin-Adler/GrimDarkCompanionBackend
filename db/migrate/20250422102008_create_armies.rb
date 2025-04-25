class CreateArmies < ActiveRecord::Migration[8.0]
  def change
    create_table :armies do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :alliance, null: false

      t.timestamps
    end
    add_index :armies, :alliance
  end
end
