class Country < ApplicationRecord
  has_many :movies, through: :movies_countries
  has_many :movies_countries, foreign_key: 'country_id'

  validates :name ,
            presence: true
end
