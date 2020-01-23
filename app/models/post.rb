class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  validates :image, :genre_id, :title, presence: true
  mount_uploader :image, ImageUploader
end
