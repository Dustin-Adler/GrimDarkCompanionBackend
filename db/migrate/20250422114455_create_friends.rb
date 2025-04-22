class CreateFriends < ActiveRecord::Migration[8.0]
  def change
    create_table :friends do |t|
      t.integer :friend_one_id, null: false
      t.integer :friend_two_id, null: false
      t.boolean :pending, null: false, default: true

      t.timestamps
    end
    add_index :friends, [:friend_one_id, :friend_two_id], unique: true
  end
end
