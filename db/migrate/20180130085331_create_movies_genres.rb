class CreateMoviesGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :movies_genres do |t|
    	t.references  :movie, foreign_key: true, null: false
      t.references  :genre, foreign_key: true, null: false
      t.timestamps
    end
  end
end
