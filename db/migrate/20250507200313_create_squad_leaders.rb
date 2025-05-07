class CreateSquadLeaders < ActiveRecord::Migration[8.0]
  def change
    create_table :squad_leaders do |t|
      t.integer :leader_id
      t.integer :squad_id

      t.timestamps
    end
  end
end
