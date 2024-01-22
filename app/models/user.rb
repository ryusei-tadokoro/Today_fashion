class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line] 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :second_prefecture, class_name: 'Prefecture', foreign_key: 'second_prefecture_id', optional: true
  belongs_to :constitution
  has_many :closets  
  
  validates :password, presence: true, if: :password_required?

  mount_uploader :image, ImageUploader
  def default_image
    ActionController::Base.helpers.asset_path('default_image.png')
  end

  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    name = info["name"]
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end
  def password_required?
    # 新しいパスワードが存在する場合にのみバリデーションを適用する
    new_record? || password.present? || password_confirmation.present?
  end
end
