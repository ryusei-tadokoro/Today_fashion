class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :second_prefecture, class_name: 'Prefecture', foreign_key: 'second_prefecture_id', optional: true
  belongs_to :constitution

  validates :prefecture_id, :constitution_id, presence: true
  validates :password, presence: true, on: :create

  mount_uploader :image, ImageUploader
  def default_image
    ActionController::Base.helpers.asset_path('default_image.png')
  end

end
