class Award < ApplicationRecord
  has_many :movies, through: :movies_awards
  has_many :movies_awards, dependent: :destroy

  varidates :name, presence: true
end
