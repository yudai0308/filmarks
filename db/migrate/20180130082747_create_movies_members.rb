class CreateMoviesMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :movies_members do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.timestamps
    end
  end
end
