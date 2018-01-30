class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text        :comment, null: false
      t.integer     :score, null: false
      t.references  :user, index: true, foreign_key: true, null: false
      t.references  :movie, index: true, foreign_key: true, null: false
      t.integer     :status, null: false
      t.timestamps
    end
  end
end
