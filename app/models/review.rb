class Review < ApplicationRecord
  has_many    :reviews_tags
  has_many    :tags, through: :reviews_tags
  has_many    :comments, dependent: :destroy
  has_many    :likes, dependent: :destroy
  belongs_to  :user
  belongs_to  :movie

  validates :comment,
            :user_id ,
            :movie_id,
            :status,
            presence: true
end
