class MoviesAward < ApplicationRecord
  belongs_to :movie
  belongs_to :award
end
