class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name, null: false, unique: true
      t.integer :status, null: false

      t.timestamps
    end
  end
end
