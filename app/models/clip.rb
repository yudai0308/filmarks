class Clip < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  varidates :user_id, presence: true
  varidates :movie_id, presence: true
end
