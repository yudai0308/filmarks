class MoviesMember < ApplicationRecord
  belongs_to :movie
  belongs_to :member
  validates :movie_id, presence: true
  validates :member_id, presence: true
end
