class Closet < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :subcategory, optional: true

  validates :name, presence: true
  validates :category, presence: true
end
