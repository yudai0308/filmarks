class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :Filmarks_ID, presence: true
  validates :nickname, presence: true

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments
  has_many :movies, through: :clips
  has_many :clips, dependent: :destroy
  has_many :members, through: :users_members
  has_many :users_members
  has_many :active_relationships, class_name: "relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "relationship", foreign_key: "following_id", dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
end
