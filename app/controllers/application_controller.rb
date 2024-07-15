# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Pundit::Authorization
  include ActionController::RequestForgeryProtection
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  def set_csrf_token_header
    response.set_header('X-CSRF-Token', form_authenticity_token)
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name prefecture_id second_prefecture_id constitution_id image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name prefecture_id second_prefecture_id constitution_id image])
  end

  def user_not_authorized
    flash[:alert] = "あなたはこの操作を行う権限がありません。"
    redirect_to(request.referrer || root_path)
  end
end
