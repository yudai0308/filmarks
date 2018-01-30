class CreateMoviesCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :movies_countries do |t|
      t.references :movie, foreign_key: true, null: false
      t.references :country, foreign_key: true, null: false
      t.timestamps
    end
  end
end
