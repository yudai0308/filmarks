class ChangeRestrictionOnReview < ActiveRecord::Migration[5.0]
  def change
    change_column :reviews, :score, :integer, null: true
  end
end
