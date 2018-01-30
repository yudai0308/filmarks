class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false, index: true
      t.string :subtitle
      t.text :image
      t.string :time
      t.text :story
      t.string :production
      t.string :release

      t.timestamps
    end
  end
end
