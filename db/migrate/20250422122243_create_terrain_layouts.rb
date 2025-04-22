class CreateTerrainLayouts < ActiveRecord::Migration[8.0]
  def change
    create_table :terrain_layouts do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
