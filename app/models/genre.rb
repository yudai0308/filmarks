class Genre < ApplicationRecord
 validates :title, presence: true
 has_many :movies, through: :movies_genres
 has_many :movies_genres
end
