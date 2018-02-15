class Member < ApplicationRecord
  has_many :movies, through: :movies_members
  has_many :movies_members, dependent: :destroy, foreign_key: true
  has_many :users, through: :users_members
  has_many :users_members, dependent: :destroy
  validates :name, presence: true
  validates :status, presence: true

  accepts_nested_attributes_for :movies_members, allow_destroy: true
end
