class Member < ApplicationRecord
  has_many :movies, through: :movies_members
  has_many :movies_members, dependent: :destroy
  has_many :users, through: :users_members
  has_many :users_members, dependent: :destroy
  validates :name, presence: true
  validates :status, presence: true

  def fan_user(user_id)
   users_members.find_by(user_id: user_id)
  end
end
