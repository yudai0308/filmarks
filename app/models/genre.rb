class Genre < ApplicationRecord
 validates :name, presence: true
 has_many :movies, through: :movies_genres
 has_many :movies_genres, foreign_key: true

 accepts_nested_attributes_for :movies_genres, allow_destroy: true
end
