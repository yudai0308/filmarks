class Country < ApplicationRecord
  has_many :movies, through: :movies_countries
  has_many :movies_countries, foreign_key: true

  validates :name, presence: true

  accepts_nested_attributes_for :movies_countries, allow_destroy: true
end
