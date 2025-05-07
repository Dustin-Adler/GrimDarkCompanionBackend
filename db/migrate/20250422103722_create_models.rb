class CreateModels < ActiveRecord::Migration[8.0]
  def change
    create_table :models do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :movement, null: false
      t.integer :army_id, null: false
      t.float :cost, null: false
      t.integer :min_squad, null: false
      t.integer :max_squad, null: false
      t.integer :unit_limit, null: false
      t.integer :toughness, null: false
      t.integer :armour_save, null: false
      t.integer :invuln_save, null: false
      t.integer :wounds, null: false
      t.integer :leadership, null: false
      t.integer :obj_control, null: false
      t.integer :affiliate_model_id, default: nil
      t.integer :big_squad_points_adjustment, default: 0
      t.integer :leader_or_squad_ids, array: true, default: []

      t.timestamps
    end
    add_index :models, :army_id
  end
end
