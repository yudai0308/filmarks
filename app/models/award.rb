class Award < ApplicationRecord
  has_many :movies, through: :movies_awards
  has_many :movies_awards, dependent: :destroy, foreign_key: true

  validates :name, presence: true

  accepts_nested_attributes_for :movies_awards, allow_destroy: true
end
