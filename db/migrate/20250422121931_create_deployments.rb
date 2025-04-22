class CreateDeployments < ActiveRecord::Migration[8.0]
  def change
    create_table :deployments do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
