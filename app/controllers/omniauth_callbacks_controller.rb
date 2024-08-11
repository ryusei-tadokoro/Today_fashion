# frozen_string_literal: true

# OmniauthCallbacksController handles the callback from OmniAuth providers.
# It processes the authentication data and manages user login.
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def line
    basic_action
  end

  private

  def basic_action
    @omniauth = request.env['omniauth.auth']
    return if @omniauth.blank?

    find_or_create_user
    @profile.set_values(@omniauth)
    sign_in_and_redirect_user
  end

  def find_or_create_user
    @profile = User.find_or_initialize_by(provider: @omniauth['provider'], uid: @omniauth['uid'])
    return if @profile.email.present?

    email = fetch_email
    @profile = current_user || User.create!(provider: @omniauth['provider'], uid: @omniauth['uid'],
                                            email:, name: @omniauth['info']['name'],
                                            password: Devise.friendly_token[0, 20])
  end

  def fetch_email
    @omniauth['info']['email'] || "#{@omniauth['uid']}-#{@omniauth['provider']}@example.com"
  end

  def sign_in_and_redirect_user
    sign_in(:user, @profile)
    flash[:notice] = I18n.t('devise.omniauth_callbacks.success')
    redirect_to expendable_items_path
  end

  def fake_email(_uid, _provider)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
