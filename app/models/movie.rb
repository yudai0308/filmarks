class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :clips
  has_many :clips, dependent: :destroy
  has_many :members, through: :movies_members
  has_many :movies_members, dependent: :destroy, foreign_key: true
  has_many :countrys, through: :movies_countrys
  has_many :movies_countrys, dependent: :destroy, foreign_key: true
  has_many :genres, through: :movies_genres
  has_many :movies_genres, dependent: :destroy, foreign_key: true
  has_many :awards, through: :movies_awards
  has_many :movies_awards, dependent: :destroy, foreign_key: true

  validates :title, presence: true

  def clip_user(user_id)
   clips.find_by(user_id: user_id)
  end

end
