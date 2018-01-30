class CreateUsersMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :users_members do |t|
    	t.references :user, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.timestamps
    end
  end
end
