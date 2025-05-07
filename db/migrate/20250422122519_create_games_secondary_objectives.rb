class CreateGamesSecondaryObjectives < ActiveRecord::Migration[8.0]
  def change
    create_table :games_secondary_objectives do |t|
      t.integer :game_id, null: false
      t.integer :player_id, null: false
      t.integer :secondary_objective_id, null: false

      t.timestamps
    end
    add_index :games_secondary_objectives, [ :game_id, :player_id, :secondary_objective_id ], unique: true
  end
end
