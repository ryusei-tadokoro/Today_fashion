class Closet < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :users, foreign_key: :user_id

  validates :name, presence: true
  validates :category, presence: true
end
