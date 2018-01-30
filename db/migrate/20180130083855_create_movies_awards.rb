class CreateMoviesAwards < ActiveRecord::Migration[5.0]
  def change
    create_table :movies_awards do |t|
      t.references  :movie, foreign_key: true, null: false
      t.references  :award, foreign_key: true, null: false
      t.timestamps
    end
  end
end
