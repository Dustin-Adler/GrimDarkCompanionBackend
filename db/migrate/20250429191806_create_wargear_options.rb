class CreateWargearOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :wargear_options do |t|
      t.integer :model_id, null: false
      t.integer :default_loadout, null: false, array: true
      t.integer :weapon_loadouts, array: true, default: []
      t.integer :add_any, array: true, default: []
      t.integer :select_one, array:true, default: []
      t.integer :for_n_models
      t.integer :for_n_models_weapon_swap, array:true, default: []

      t.timestamps
    end
  end
end
