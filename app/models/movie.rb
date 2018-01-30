class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :clips
  has_many :clips, dependent: :destroy
  has_many :members, through: :movies_members
  has_many :movies_members
  has_many :countrys, through: :movies_countrys
  has_many :movies_countrys
  has_many :genres, through: :movies_genres
  has_many :movies_genres
  has_many :awards, through: :movies_awards
  has_many :movies_awards

  validates :title, presence: true
end
