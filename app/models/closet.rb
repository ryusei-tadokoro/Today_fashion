class Closet < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category
  belongs_to :subcategory
  has_many :subcategories, through: :category

  validates :name, presence: true
  validates :category, presence: true
  validates :subcategory, presence: true
end
