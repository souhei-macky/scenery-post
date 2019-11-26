class Post < ApplicationRecord
  belongs_to :user
  validates :image, :genre_id, :title, presence: true
  mount_uploader :image, ImageUploader
end
