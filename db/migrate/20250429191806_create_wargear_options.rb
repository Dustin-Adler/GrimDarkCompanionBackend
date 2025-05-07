class CreateWargearOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :wargear_options do |t|
      t.integer :model_id, null: false
      t.integer :default_loadout, null: false, array: true
      t.integer :add_any, array: true, default: []
      t.integer :alt_loadout_one, array: true, default: []
      t.integer :alt_loadout_two, array: true, default: []
      t.integer :alt_loadout_three, array: true, default: []
      t.integer :alt_loadout_four, array: true, default: []
      t.integer :alt_loadout_five, array: true, default: []
      t.integer :first_select_one, array: true, default: []
      t.integer :second_select_one, array: true, default: []
      t.integer :third_select_one, array: true, default: []
      t.integer :fourth_select_one, array: true, default: []
      t.integer :models_per_weapon_one
      t.integer :for_n_models_one, array: true, default: []
      t.integer :models_per_weapon_two
      t.integer :for_n_models_two, array: true, default: []

      t.timestamps
    end
  end
end
