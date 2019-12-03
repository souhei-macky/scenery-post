class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  validates :image, :genre_id, :title, presence: true
  mount_uploader :image, ImageUploader
end
