class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_prefectures, only: [:new, :create]
  before_action :set_constitutions, only: [:new, :create]

  def create
    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?

      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      logger.error("User creation failed: #{resource.errors.full_messages.join(', ')}")
      clean_up_passwords resource
      set_minimum_password_length
      flash[:error] = "ユーザー登録に失敗しました。"
      render :new
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :prefecture_id, :second_prefecture_id, :constitution_id)
  end

  def set_prefectures
    @prefectures = Prefecture.all
  end

  def set_constitutions
    @constitutions = Constitution.all
  end
end
