class Review < ApplicationRecord
  has_many    :tags
  has_many    :comments, dependent: :destroy
  has_many    :likes, dependent: :destroy
  belongs_to  :user
  belongs_to  :movie

  validates :comment,
            :score ,
            :user_id ,
            :movie_id,
            :tatus
            presence: true
end
