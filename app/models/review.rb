class Review < ApplicationRecord
  has_many    :tags
  has_many    :comments
  has_many    :likes
  belongs_to  :user, dependent: :destroy
  belongs_to  :movie, dependent: :destroy

  validates :comment,
            :score ,
            :user_id ,
            :movie_id,
            :tatus
            presence: true
end
