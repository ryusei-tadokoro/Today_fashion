# frozen_string_literal: true

# OmniauthCallbacksController manages the callbacks from various omniauth providers.
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def line
    basic_action
  end

  private

  def basic_action
    @omniauth = request.env['omniauth.auth']

    return if @omniauth.blank?

    @profile = find_or_initialize_user
    set_user_info if @profile.new_record?
    @profile.save! if @profile.changed?

    sign_in_and_redirect
  end

  def find_or_initialize_user
    User.find_or_initialize_by(provider: @omniauth['provider'], uid: @omniauth['uid'])
  end

  def set_user_info
    email = @omniauth['info']['email'].presence || fake_email
    @profile.assign_attributes(email:, name: @omniauth['info']['name'], password: Devise.friendly_token[0, 20])
  end

  def fake_email
    "#{@omniauth['uid']}-#{@omniauth['provider']}@example.com"
  end

  def sign_in_and_redirect
    sign_in(:user, @profile)
    flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'LINE')
    redirect_to root_path
  end
end
