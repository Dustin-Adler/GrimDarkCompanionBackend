class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.integer :player_one_id, null: false
      t.integer :player_two_id, null: false
      t.string :game_name, null: false
      t.text :note
      t.integer :list_value_limit, null: false
      t.integer :mission_rule_id, null: false
      t.integer :deployment_id, null: false
      t.integer :terrain_id, null: false
      t.integer :battle_round, null: false
      t.integer :player_one_list_id, null: false
      t.integer :player_two_list_id, null: false
      t.integer :player_one_vps, null: false
      t.integer :player_two_vps, null: false

      t.timestamps
    end
    add_index :games, :player_one_id
    add_index :games, :player_two_id
  end
end
