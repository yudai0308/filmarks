class CreateReviewsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews_tags do |t|
      t.references :review, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.timestamps
    end
  end
end
