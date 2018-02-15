class Genre < ApplicationRecord
 validates :name, presence: true
 has_many :movies, through: :movies_genres
 has_many :movies_genres, foreign_key: 'genre_id'
end
