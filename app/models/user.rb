class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :second_prefecture, class_name: 'Prefecture', optional: true
  belongs_to :constitution
  has_many :closets, dependent: :destroy

  validates :name, presence: true, if: -> { validation_context == :step1 || validation_context.nil? }
  validates :email, presence: true, if: -> { validation_context == :step1 || validation_context.nil? }
  validates :password, presence: true, length: { minimum: 6 }, if: -> { validation_context == :step2 || validation_context.nil? }
  validates :password_confirmation, presence: true, if: -> { validation_context == :step2 || validation_context.nil? }
  validates :prefecture_id, presence: true, if: -> { validation_context == :step3 || validation_context.nil? }

  mount_uploader :image, ImageUploader

  def default_image
    ActionController::Base.helpers.asset_path('default_image.png')
  end

  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth['provider'].to_s || uid != omniauth['uid']

    credentials = omniauth['credentials']
    info = omniauth['info']

    credentials['refresh_token']
    credentials['secret']
    credentials.to_json
    self.name = info['name'] # nameフィールドに値を設定
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    save!
  end

  def password_required?
    # 新しいパスワードが存在する場合にのみバリデーションを適用する
    new_record? || password.present? || password_confirmation.present?
  end

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_initialize
    user.email = auth.info.email || "#{auth.uid}-#{auth.provider}@example.com"
    user.password = Devise.friendly_token[0, 20] if user.new_record?
    user.name = auth.info.name # nameフィールドに値を設定
    user.save
    user
  end
end
