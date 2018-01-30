class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, null: false, index: true, unique: true
      t.integer :followed_id, null: false, index: true, unique: true
      t.timestamps
    end
     add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
