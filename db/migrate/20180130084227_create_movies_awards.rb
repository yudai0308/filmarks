class CreateMoviesAwards < ActiveRecord::Migration[5.0]
  def change
    create_table :movies_awards do |t|
    	t.references :movie, null: false, foreign_key: true
      t.references :award, null: false, foreign_key: true
      t.timestamps
    end
  end
end
