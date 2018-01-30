class MoviesAward < ApplicationRecord
  has_many :users
  has_many :members
end
