# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # createアクションを以下のように書き換える
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
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
      clean_up_passwords resource
      set_minimum_password_length
      flash[:error] = "ユーザー登録に失敗しました。"
      render :new # ユーザー登録ページを再度表示し、エラーメッセージを表示する
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :residence_name, :additional_residence_name, :sensation_name)
  end
end