class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user_id ,
            :movie_id,
            presence: true
end
